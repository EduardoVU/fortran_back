import os
import tempfile
import base64
import re
from fastapi import UploadFile
from typing import List
from collections import defaultdict

def create_formulario(files: List[UploadFile]):
    # Almacenar los nombres de los archivos
    filenames = []
    
    # Crear una carpeta temporal
    temp_dir = tempfile.mkdtemp()
    print(f"Carpeta temporal creada: {temp_dir}")

    # Guardar los archivos en la carpeta temporal con sus nombres originales
    for file in files:
        filename = file.filename  # Usar el nombre real del archivo
        file_path = os.path.join(temp_dir, filename)
        with open(file_path, "wb") as f:
            f.write(file.file.read())
        filenames.append(filename)
    
    # Agrupar los archivos por el número antes del guion bajo usando regex
    file_groups = defaultdict(list)
    pattern = re.compile(r'(\d+)(?:KG)?_')  # Captura el número antes de _ y ignora "KG" si está presente

    for filename in filenames:
        match = pattern.search(filename)
        if match:
            group_number = match.group(1)
            file_groups[group_number].append(filename)
    
    # Crear el archivo main.f90 con el contenido especificado
    main_f90_path = os.path.join(temp_dir, "main.f90")
    with open(main_f90_path, "w", encoding="utf-8") as f:
        f.write("PROGRAM main\n")
        f.write("USE singular\n")
        f.write("IMPLICIT NONE\n\n")
        f.write("CHARACTER(len=100)::raw_data,cut_rawdata\n")
        f.write("CHARACTER(len=100)::acc_corregida,vel_nocorregida\n")
        f.write("CHARACTER(len=100)::vel_corregida,des_nocorregida\n")
        f.write("CHARACTER(len=100)::des_corregida\n")
        f.write("REAL(KIND=16)::mindes1,mindes2\n\n")
        
        # Generar las líneas de las variables en base a los grupos
        for group, files in file_groups.items():
            f.write(f"REAL(KIND=16)::" + ",".join([f"k{group}_{i+1}" for i in range(len(files))]) + "\n")
        
        # Generar los promedios en base a la cantidad de grupos
        num_groups = len(file_groups)
        f.write("REAL(KIND=16)::" + ",".join([f"promedio{i}" for i in range(1, num_groups + 1)]) + "\n\n")
        
        # Generar el bloque de procesamiento para cada archivo
        for group, files in file_groups.items():
            for i, filename in enumerate(files):
                f.write(f'raw_data = "{filename}"\n')
                f.write(f'cut_rawdata = "{filename.split(".")[0]}_cut.txt"\n')
                f.write(f'acc_corregida = "{filename.split(".")[0]}_acccor.txt"\n')
                f.write(f'vel_nocorregida = "{filename.split(".")[0]}_velsin.txt"\n')
                f.write(f'vel_corregida = "{filename.split(".")[0]}_velcor.txt"\n')
                f.write(f'des_nocorregida = "{filename.split(".")[0]}_dessin.txt"\n')
                f.write(f'des_corregida = "{filename.split(".")[0]}_descor.txt"\n\n')
                
                f.write("CALL process(raw_data, cut_rawdata, acc_corregida, vel_nocorregida, ")
                f.write("vel_corregida, des_nocorregida, des_corregida, mindes2)\n")
                f.write('WRITE(*,*)"mindes2 es: ",mindes2\n')
                f.write(f'k{group}_{i+1} = mindes2\n\n')
            
            # Generar la línea de promedio para este grupo
            f.write(f"!Ahora obtenemos el promedio de todos los desplazamientos del grupo {group}\n")
            promedio_vars = "+".join([f"k{group}_{i+1}" for i in range(len(files))])
            f.write(f"promedio{list(file_groups.keys()).index(group) + 1} = ({promedio_vars})/{len(files)}\n\n")
        
        # Generar las líneas de WRITE para mostrar los promedios
        f.write("\n! Mostrar los desplazamientos promedio\n")
        for i, group in enumerate(file_groups.keys(), 1):
            f.write(f'WRITE(*,*)"El desplazamiento promedio para archivos con {group} es : ",promedio{i}\n')
        
        f.write("\nEND PROGRAM main\n")

    print(f"Archivo main.f90 creado en: {main_f90_path}")

    # Convertir el archivo main.f90 a Base64
    with open(main_f90_path, "rb") as f:
        file_content = f.read()
        base64_content = base64.b64encode(file_content).decode("utf-8")
    
    # Retornar el archivo Base64
    return {
        'success': True,
        'message': "Archivo creado con éxito",
        'data': base64_content
    }
