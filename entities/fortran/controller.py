import os
import tempfile
import base64
import re
from fastapi import UploadFile
from typing import List, Dict
from collections import defaultdict


def create_formulario(files: List[UploadFile], target_os: str = "linux"):
    try:
        # Crear carpeta temporal
        temp_dir = tempfile.mkdtemp()

        # Guardar archivos en la carpeta temporal
        filenames = save_files(files, temp_dir)

        # Agrupar archivos por el número antes del guion bajo
        file_groups = group_files(filenames)

        # Crear y escribir el archivo Fortran (main.f90) con lógica para OS
        main_f90_path = generate_fortran_file(temp_dir, file_groups, target_os=target_os)

        # Convertir el archivo main.f90 a Base64
        base64_content = encode_file_to_base64(main_f90_path)

        return {
            'success': True,
            'message': "Archivo creado con éxito",
            'file': base64_content
        }

    except Exception as e:
        return {
            'success': False,
            'message': f"Error al procesar archivos: {str(e)}"
        }


def save_files(files: List[UploadFile], temp_dir: str) -> List[str]:
    filenames = []

    for file in files:
        filename = file.filename
        file_path = os.path.join(temp_dir, filename)

        with open(file_path, "wb") as f:
            f.write(file.file.read())

        filenames.append(filename)

    return filenames


def group_files(filenames: List[str]) -> Dict[str, List[str]]:
    file_groups = defaultdict(list)
    pattern = re.compile(r'(\d+)(?:KG)?_')

    for filename in filenames:
        match = pattern.search(filename)
        if match:
            group_number = match.group(1)
            file_groups[group_number].append(filename)

    return file_groups


def generate_fortran_file(temp_dir: str, file_groups: Dict[str, List[str]], target_os: str = "windows") -> str:
    main_f90_path = os.path.join(temp_dir, "main.f90")

    # Definir comandos mkdir según SO
    def mkdir_command(path: str) -> str:
        if target_os.lower() == "windows":
            # En Windows backslash y sin -p (mkdir crea solo una carpeta a la vez)
            return f"CALL SYSTEM('mkdir {path}')\n"
        else:
            # Linux/macOS con -p para crear árbol completo si no existe
            return f"CALL SYSTEM('mkdir -p {path}')\n"

    with open(main_f90_path, "w", encoding="utf-8") as f:
        # Encabezado del archivo Fortran
        f.write("PROGRAM main\n")
        f.write("USE singular\n")
        f.write("IMPLICIT NONE\n\n")

        # Variables de archivo
        f.write("CHARACTER(len=100)::raw_data,cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida\n")
        f.write("REAL(KIND=16)::mindes1,mindes2\n\n")

        # Declaración de variables para cada grupo
        for group, files in file_groups.items():
            f.write(f"REAL(KIND=16)::" + ",".join([f"k_{group}_{i+1}" for i in range(len(files))]) + "\n")

        num_groups = len(file_groups)
        f.write("REAL(KIND=16)::" + ",".join([f"promedio{i}" for i in range(1, num_groups + 1)]) + "\n\n")

        # Crear carpetas raíz y subcarpetas 'plots' y 'memory'
        f.write("CALL SYSTEM('')  ! Línea dummy para separar\n")
        for group in file_groups.keys():
            f.write(mkdir_command(f"{group}"))
            f.write(mkdir_command(os.path.join(group, "plots")))
            f.write(mkdir_command(os.path.join(group, "memory")))

        f.write("\n")

        # Procesamiento de cada archivo por grupo
        for group, files in file_groups.items():
            for i, filename in enumerate(files):
                base_name = os.path.splitext(filename)[0]

                # Archivos que van a plots
                acccor_file = os.path.join(group, "plots", f"{base_name}_acccor.txt")
                descor_file = os.path.join(group, "plots", f"{base_name}_descor.txt")
                velcor_file = os.path.join(group, "plots", f"{base_name}_velcor.txt")

                # Archivos que van a memory
                cut_file = os.path.join(group, "memory", f"{base_name}_cut.txt")
                velsin_file = os.path.join(group, "memory", f"{base_name}_velsin.txt")
                dessin_file = os.path.join(group, "memory", f"{base_name}_dessin.txt")

                # raw_data está en nivel raíz (sin carpeta)
                raw_file = filename

                f.write(f'raw_data = "{raw_file}"\n')
                f.write(f'cut_rawdata = "{cut_file}"\n')
                f.write(f'acc_corregida = "{acccor_file}"\n')
                f.write(f'vel_nocorregida = "{velsin_file}"\n')
                f.write(f'vel_corregida = "{velcor_file}"\n')
                f.write(f'des_nocorregida = "{dessin_file}"\n')
                f.write(f'des_corregida = "{descor_file}"\n\n')

                f.write("CALL process(raw_data, cut_rawdata, acc_corregida, vel_nocorregida, ")
                f.write("vel_corregida, des_nocorregida, des_corregida, mindes2)\n")
                f.write(f'k_{group}_{i+1} = mindes2\n\n')

            # Cálculo del promedio por grupo
            promedio_vars = "+".join([f"k_{group}_{i+1}" for i in range(len(files))])
            f.write(f"promedio{list(file_groups.keys()).index(group) + 1} = ({promedio_vars})/{len(files)}\n\n")

        # Mostrar los desplazamientos promedio
        f.write("\n! Mostrar los desplazamientos promedio\n")
        for i, group in enumerate(file_groups.keys(), 1):
            f.write(f'WRITE(*,*)"El desplazamiento promedio para archivos con {group} es : ",promedio{i}\n')

        f.write("\nEND PROGRAM main\n")

    return main_f90_path


def encode_file_to_base64(file_path: str) -> str:
    if not os.path.exists(file_path) or os.path.getsize(file_path) == 0:
        raise ValueError("El archivo main.f90 no fue creado correctamente o está vacío.")

    with open(file_path, "rb") as f:
        return base64.b64encode(f.read()).decode("utf-8")