import os
import tempfile
import base64
import re
from fastapi import UploadFile
from typing import List, Dict
from collections import defaultdict


def create_formulario(files: List[UploadFile]):
    try:
        # Crear carpeta temporal
        temp_dir = tempfile.mkdtemp()

        # Guardar archivos en la carpeta temporal
        filenames = save_files(files, temp_dir)

        # Agrupar archivos por el número antes del guion bajo
        file_groups = group_files(filenames)

        # Crear y escribir el archivo Fortran (main.f90)
        main_f90_path = generate_fortran_file(temp_dir, file_groups)

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


def generate_fortran_file(temp_dir: str, file_groups: Dict[str, List[str]]) -> str:
    main_f90_path = os.path.join(temp_dir, "main.f90")

    with open(main_f90_path, "w", encoding="utf-8") as f:
        # Encabezado del archivo Fortran
        f.write("PROGRAM main\n")
        f.write("USE singular\n")
        f.write("IMPLICIT NONE\n\n")
        f.write("CHARACTER(len=100)::raw_data,cut_rawdata\n")
        f.write("CHARACTER(len=100)::acc_corregida,vel_nocorregida\n")
        f.write("CHARACTER(len=100)::vel_corregida,des_nocorregida\n")
        f.write("CHARACTER(len=100)::des_corregida\n")
        f.write("REAL(KIND=16)::mindes1,mindes2\n\n")
        
        # Declaración de variables para cada grupo
        for group, files in file_groups.items():
            f.write(f"REAL(KIND=16)::" + ",".join([f"k{group}_{i+1}" for i in range(len(files))]) + "\n")
        
        num_groups = len(file_groups)
        f.write("REAL(KIND=16)::" + ",".join([f"promedio{i}" for i in range(1, num_groups + 1)]) + "\n\n")
        
        # Procesamiento de cada archivo por grupo
        for group, files in file_groups.items():
            for i, filename in enumerate(files):
                base_name = os.path.splitext(filename)[0]
                print("filename")
                print(filename)
                f.write(f'raw_data = "{filename}"\n')
                f.write(f'cut_rawdata = "{base_name}_cut.txt"\n')
                f.write(f'acc_corregida = "{base_name}_acccor.txt"\n')
                f.write(f'vel_nocorregida = "{base_name}_velsin.txt"\n')
                f.write(f'vel_corregida = "{base_name}_velcor.txt"\n')
                f.write(f'des_nocorregida = "{base_name}_dessin.txt"\n')
                f.write(f'des_corregida = "{base_name}_descor.txt"\n\n')
                
                f.write("CALL process(raw_data, cut_rawdata, acc_corregida, vel_nocorregida, ")
                f.write("vel_corregida, des_nocorregida, des_corregida, mindes2)\n")
                f.write(f'k{group}_{i+1} = mindes2\n\n')
            
            # Cálculo del promedio por grupo
            promedio_vars = "+".join([f"k{group}_{i+1}" for i in range(len(files))])
            f.write(f"promedio{list(file_groups.keys()).index(group) + 1} = ({promedio_vars})/{len(files)}\n\n")
        
        # Mostrar los desplazamientos promedio
        f.write("\n! Mostrar los desplazamientos promedio\n")
        for i, group in enumerate(file_groups.keys(), 1):
            f.write(f'WRITE(*,*)"El desplazamiento promedio para archivos con {group} es : ",promedio{i}\n')
        
        f.write("\nEND PROGRAM main\n")

    # print(f"Archivo main.f90 creado en: {main_f90_path}")
    return main_f90_path


def encode_file_to_base64(file_path: str) -> str:
    if not os.path.exists(file_path) or os.path.getsize(file_path) == 0:
        raise ValueError("El archivo main.f90 no fue creado correctamente o está vacío.")

    with open(file_path, "rb") as f:
        return base64.b64encode(f.read()).decode("utf-8")
