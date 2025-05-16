import os
import tempfile
import matplotlib.pyplot as plt
import pandas as pd
from fastapi import UploadFile
from typing import List
from fpdf import FPDF
import base64
import re

def create_plots(files: List[UploadFile]):
    try:
        temp_dir = tempfile.mkdtemp()
        filenames = save_files(files, temp_dir)
        grouped_files = group_files_by_type(filenames)

        if not any(grouped_files.values()):
            return {
                'success': False,
                'message': "No se encontraron archivos válidos (acccor, velcor, descor)."
            }

        pdf_path = generate_pdf(temp_dir, grouped_files)

        if not os.path.exists(pdf_path):
            return {
                'success': False,
                'message': "Error al generar el archivo PDF."
            }

        with open(pdf_path, "rb") as pdf_file:
            base64_pdf = base64.b64encode(pdf_file.read()).decode("utf-8")

        return {
            'success': True,
            'message': "Archivo PDF generado con éxito",
            'file': base64_pdf
        }

    except Exception as e:
        return {
            'success': False,
            'message': f"Error al procesar archivos: {str(e)}"
        }

def save_files(files: List[UploadFile], temp_dir: str) -> List[str]:
    filenames = []
    for file in files:
        file_path = os.path.join(temp_dir, file.filename)
        with open(file_path, "wb") as f:
            f.write(file.file.read())
        filenames.append(file_path)
    return filenames

def group_files_by_type(filenames: List[str]):
    grouped_files = {
        "acccor": [],
        "velcor": [],
        "descor": []
    }

    for file in filenames:
        if "_acccor" in file:
            grouped_files["acccor"].append(file)
        elif "_velcor" in file:
            grouped_files["velcor"].append(file)
        elif "_descor" in file:
            grouped_files["descor"].append(file)

    return grouped_files

def generate_pdf(temp_dir: str, grouped_files: dict) -> str:
    pdf = FPDF()
    pdf.set_auto_page_break(auto=True, margin=15)
    base_name = extract_base_name(grouped_files)

    if grouped_files["acccor"]:
        add_section_page(pdf, f"ACELERACIONES {base_name}")
        create_plot_section(pdf, grouped_files["acccor"], "Aceleración", "Tiempo (s)", "Aceleración (g)", temp_dir, "#0000FF", 1)
    
    if grouped_files["velcor"]:
        add_section_page(pdf, f"VELOCIDADES {base_name}")
        create_plot_section(pdf, grouped_files["velcor"], "Velocidad", "Tiempo (s)", "Velocidad (m/s)", temp_dir, "#008000", 2)
    
    if grouped_files["descor"]:
        add_section_page(pdf, f"DESPLAZAMIENTOS {base_name}")
        create_plot_section(pdf, grouped_files["descor"], "Desplazamiento", "Tiempo (s)", "Desplazamiento (m)", temp_dir, "#FF0000", 4)

    pdf_path = os.path.join(temp_dir, "plots.pdf")
    pdf.output(pdf_path)
    return pdf_path

def extract_base_name(grouped_files: dict) -> str:
    for category in grouped_files:
        if grouped_files[category]:
            filename = os.path.basename(grouped_files[category][0]).split(".")[0]
            # Buscar el texto antes del último número y su _
            base_name = re.sub(r'_\d+(_[^_]+)?$', '', filename)
            return base_name
    return "Sin_Nombre"

def add_section_page(pdf: FPDF, section_title: str):
    pdf.add_page()
    pdf.set_font("Arial", "B", 24)
    pdf.set_y(pdf.h / 2 - 10)  # Centrado verticalmente
    pdf.set_x(0)
    pdf.multi_cell(0, 10, section_title, align="C")

def create_plot_section(pdf: FPDF, files: List[str], section_type: str, xlabel: str, ylabel: str, temp_dir: str, color: str, column_index: int):
    for file in files:
        try:
            data = pd.read_csv(file, delim_whitespace=True, header=None)
            
            # Extraer los dos últimos números del nombre del archivo
            filename = os.path.basename(file)
            numbers = re.findall(r'\d+', filename)
            
            if len(numbers) >= 2:
                first_number = numbers[-2]
                second_number = numbers[-1]

                # Convertir 75 a 7.5 si es el primer número
                if first_number == "75":
                    first_number = "7.5"

                title_text = f"Impacto {first_number} KG {second_number}"
            else:
                title_text = "Impacto Desconocido"
            
            plt.figure()
            plt.plot(data[0], data[column_index], color=color)
            plt.title(f"{title_text}")
            plt.xlabel(xlabel)
            plt.ylabel(ylabel)

            plot_path = os.path.join(temp_dir, f"{os.path.basename(file)}.png")
            plt.savefig(plot_path, dpi=300, bbox_inches='tight')
            plt.close()

            pdf.add_page()
            pdf.set_font("Arial", "B", 16)
            pdf.set_y(20)

            # Centrar la imagen
            image_width = 150
            image_height = 100
            x_pos = (pdf.w - image_width) / 2
            y_pos = (pdf.h - image_height) / 2 + 20

            pdf.image(plot_path, x=x_pos, y=y_pos, w=image_width, h=image_height)

        except Exception as e:
            pdf.add_page()
            pdf.set_font("Arial", "B", 12)
            pdf.set_y((pdf.h - 10) / 2)
            pdf.multi_cell(0, 10, f"Error al procesar el archivo {os.path.basename(file)}: {str(e)}", align="C")
