import os
import re
from .schemas import Formulario

def create_formulario(formulario_data: Formulario):
    carpeta = formulario_data.carpeta
    archivos = formulario_data.archivos

    if not os.path.exists(carpeta):
        return {
            "success": False,
            "message": f"La carpeta '{carpeta}' no fue encontrada."
        }

    archivo_path = os.path.join(carpeta, "main.f90")
    archivos_encontrados = False

    # Lista para almacenar los kX_Y y promedios
    lista_todos_los_ks = []

    with open(archivo_path, "w", encoding="utf-8") as f:
        # Header
        f.write('''PROGRAM main
USE singular
IMPLICIT NONE

CHARACTER(len=100)::raw_data,cut_rawdata
CHARACTER(len=100)::acc_corregida,vel_nocorregida
CHARACTER(len=100)::vel_corregida,des_nocorregida
CHARACTER(len=100)::des_corregida
REAL(KIND=16)::mindes1,mindes2

''')

        # Recopilar todas las variables kX_Y por grupo
        print("archivos")
        print(archivos)
        for nombre in archivos:
            archivos_con_prefijo = [f for f in os.listdir(carpeta) if f.startswith(nombre)]
            cantidad = len(archivos_con_prefijo)
            if cantidad == 0:
                # Si no hay archivos, retornar un error inmediato
                return {
                    "status": "error",
                    "message": f"No se encontraron archivos con el prefijo '{nombre}' en la carpeta '{carpeta}'."
                }
                
            archivos_encontrados = True
            match = re.search(r'(\d+)(?=KG$)', nombre)
            print("match")
            print(match)
            if match:
                numero = match.group(1)
                variables = [f"k{numero}_{i+1}" for i in range(cantidad)]
                lista_todos_los_ks.append((numero, variables))

        # Escribir las variables kX_Y
        for _, variables in lista_todos_los_ks:
            f.write(f"REAL(KIND=16)::" + ",".join(variables) + "\n")

        # Línea única para las variables promedio
        cantidad_promedios = len(lista_todos_los_ks)
        if cantidad_promedios > 0:
            promedio_vars = [f"promedio{i+1}" for i in range(cantidad_promedios)]
            f.write(f"REAL(KIND=16)::" + ",".join(promedio_vars) + "\n\n")

        # Bloques de procesamiento + promedio después del último archivo
        for i, (numero, variables) in enumerate(lista_todos_los_ks):
            cantidad = len(variables)
            nombre_base = archivos[i]

            for j in range(1, cantidad + 1):
                base = f"{nombre_base}_{j}"
                f.write(f'raw_data = "{base}.txt"\n')
                f.write(f'cut_rawdata = "{base}_cut.txt"\n')
                f.write(f'acc_corregida = "{base}_acccor.txt"\n')
                f.write(f'vel_nocorregida = "{base}_velsin.txt"\n')
                f.write(f'vel_corregida = "{base}_velcor.txt"\n')
                f.write(f'des_nocorregida = "{base}_dessin.txt"\n')
                f.write(f'des_corregida = "{base}_descor.txt"\n\n')

                f.write("CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)\n")
                f.write('WRITE(*,*)"mindes2 es: ",mindes2\n\n')
                f.write(f'k{numero}_{j} = mindes2\n\n')

                if j == cantidad:
                    promedio_var = f"promedio{i + 1}"
                    promedio_expr = "+".join(variables)
                    f.write("!Ahora obtenemos el promedio de todos los desplazamientos\n")
                    f.write(f"{promedio_var} = ({promedio_expr})/{cantidad}\n\n")

        # Generar los WRITE para los promedios
        for i in range(cantidad_promedios):
            f.write(f'WRITE(*,*)"El desplazamiento promedio para archivos con {lista_todos_los_ks[i][0]} es : ",promedio{i+1}\n')

    if not archivos_encontrados:
        return {
            "success": False,
            "message": f"No se encontraron archivos con los nombres especificados en la carpeta '{carpeta}'."
        }

    return {
        "success": True,
        "message": f"Archivo generado en la carpeta '{carpeta}'.",
    }
