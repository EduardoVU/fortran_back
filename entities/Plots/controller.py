import os
import tempfile
import matplotlib.pyplot as plt
import pandas as pd
from fastapi import UploadFile
from typing import List
from fpdf import FPDF
import base64

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
        create_plot_section(pdf, grouped_files["acccor"], f"ACELERACIONES {base_name}", "Tiempo (s)", "Aceleración (g)", temp_dir, "#0000FF", 1)
    if grouped_files["velcor"]:
        create_plot_section(pdf, grouped_files["velcor"], f"VELOCIDADES {base_name}", "Tiempo (s)", "Velocidad (m/s)", temp_dir, "#008000", 2)
    if grouped_files["descor"]:
        create_plot_section(pdf, grouped_files["descor"], f"DESPLAZAMIENTOS {base_name}", "Tiempo (s)", "Desplazamiento (m)", temp_dir, "#FF0000", 4)

    pdf_path = os.path.join(temp_dir, "plots.pdf")
    pdf.output(pdf_path)
    return pdf_path

def extract_base_name(grouped_files: dict) -> str:
    for category in grouped_files:
        if grouped_files[category]:
            return os.path.basename(grouped_files[category][0]).split("_")[0]
    return "Sin_Nombre"

def create_plot_section(pdf: FPDF, files: List[str], section_title: str, xlabel: str, ylabel: str, temp_dir: str, color: str, column_index: int):
    if not files:
        return

    pdf.add_page()
    pdf.set_font("Arial", "B", 16)
    pdf.cell(0, 10, section_title, ln=True, align="C")

    for file in files:
        try:
            data = pd.read_csv(file, delim_whitespace=True, header=None)
            plt.figure()
            plt.plot(data[0], data[column_index], color=color)
            plt.title(f"{section_title} - {os.path.basename(file)}")
            plt.xlabel(xlabel)
            plt.ylabel(ylabel)

            plot_path = os.path.join(temp_dir, f"{os.path.basename(file)}.png")
            plt.savefig(plot_path, dpi=300, bbox_inches='tight')
            plt.close()

            # Ajustar tamaño de la imagen en el PDF (150mm de ancho)
            pdf.add_page()
            pdf.image(plot_path, x=30, y=20, w=150)

        except Exception as e:
            pdf.add_page()
            pdf.set_font("Arial", "B", 12)
            pdf.multi_cell(0, 10, f"Error al procesar el archivo {os.path.basename(file)}: {str(e)}")
