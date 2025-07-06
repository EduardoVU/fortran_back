import os
import tempfile
import matplotlib.pyplot as plt
import pandas as pd
from fastapi import UploadFile
from typing import List
from fpdf import FPDF
from matplotlib.ticker import MaxNLocator
from matplotlib.lines import Line2D
import base64
import re
from .models import DamagePayload

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

def create_damage_plot(data: DamagePayload):
    desplazamientos = []
    energias = []

    gravity = 9.81
    for entry in data.value:
        entry.energy = entry.masa * gravity * entry.height
        entry.desplazamiento = abs(entry.desplazamiento)

        desplazamientos.append(entry.desplazamiento)
        energias.append(entry.energy)

    n = len(desplazamientos)

    fig, ax = plt.subplots(figsize=(8, 11))  # más alto para la tabla abajo
    ax.xaxis.set_major_locator(MaxNLocator(nbins=10))

    for i, (x, y) in enumerate(zip(desplazamientos, energias)):
        if i == 0:
            ax.plot(x, y, marker='o', color='dimgray', markersize=7)
        elif i == 1:
            ax.plot(x, y, marker='^', color='red', markersize=7)
        elif i == n - 1:
            ax.plot(x, y, marker='s', color='blue', markersize=7)
        else:
            ax.plot(x, y, marker='o', color='blue', markersize=7)

    if n >= 2:
        ax.plot(desplazamientos[0:2], energias[0:2], linestyle='-', color='red')
    if n >= 3:
        for i in range(1, n - 1):
            ax.plot(desplazamientos[i:i+2], energias[i:i+2], linestyle='-', color='blue')

    ax.set_title(data.name)
    ax.set_xlabel('Desplazamiento (m)')
    ax.set_ylabel('Energía (J)')
    ax.grid(True)

    for i, (x, y) in enumerate(zip(desplazamientos, energias)):
        text = f"({x:.4g}, {y:.2f})"
        if i == n - 1:
            ax.annotate(
                text, xy=(x, y), xytext=(-10, 0),
                textcoords="offset points", ha="right", va="center",
                fontsize=12, color="black"
            )
        else:
            ax.annotate(
                text, xy=(x, y), xytext=(15, 0),
                textcoords="offset points", ha="left", va="center",
                fontsize=12, color="black"
            )

    x_range = max(desplazamientos) - min(desplazamientos)
    y_range = max(energias) - min(energias)
    x_margin = x_range * 0.25 if x_range > 0 else 1e-7
    y_margin = y_range * 0.25 if y_range > 0 else 1

    ax.set_xlim(min(desplazamientos) - x_margin, max(desplazamientos) + x_margin)
    ax.set_ylim(min(energias) - y_margin, max(energias) + y_margin)

    yticks = ax.get_yticks()
    ax.set_yticklabels([f"{y_tick:.2f}" for y_tick in yticks])
    
    if n >= 2:
        punto1 = (desplazamientos[0], energias[0])
        puntoN = (desplazamientos[-1], energias[-1])
        hipotetico1 = (puntoN[0], punto1[1])  
        hipotetico2 = (punto1[0], puntoN[1])

        print(f"Punto hipotético 1: {hipotetico1}")
        print(f"Punto hipotético 2: {hipotetico2}")
        
        # Recolectar los puntos para el polígono: H1, Pn, ..., P1, H1
        puntos_poligono = [hipotetico1] + list(zip(reversed(desplazamientos), reversed(energias))) + [hipotetico1]
        area_inferior = 0
        for i in range(len(puntos_poligono) - 1):
            x0, y0 = puntos_poligono[i]
            x1, y1 = puntos_poligono[i + 1]
            area_inferior += (x0 * y1) - (x1 * y0)
        area_inferior = abs(area_inferior) / 2
        
        puntos_poligono = [hipotetico2] + list(zip(desplazamientos, energias)) + [hipotetico2]
        area_superior = 0
        for i in range(len(puntos_poligono) - 1):
            x0, y0 = puntos_poligono[i]
            x1, y1 = puntos_poligono[i + 1]
            area_superior += (x0 * y1) - (x1 * y0)
        area_superior = abs(area_superior) / 2
    else:
        area_inferior = 0
        area_superior = 0
        
    print(f"Área inferior (Ainf): {area_inferior:.4f}")
    print(f"Área superior (Asup): {area_superior:.4f}")
    

    # Tabla con desplazamientos en notación científica
    table_data = []
    for i in range(n):
        x_val = desplazamientos[i]
        y_val = energias[i]
        table_data.append([f"Punto {i+1}", f"({x_val:.3e}, {y_val:.3f})"])

    table_data.extend([
        ["Área inferior (Ainf)", f"{area_inferior:.4g}" ],
        ["Área superior (Asup)", f"{area_superior:.4g}"],
        ["Índice de daño (I.D)", f"{(area_superior / area_inferior):.4g}"]
    ])

    # Crear tabla fuera del área del gráfico con bbox
    table = ax.table(
    cellText=table_data,
    colLabels=["Concepto", "Valor"],
    cellLoc="center",
    colWidths=[0.3, 0.5],
    bbox=[0, -0.7, 1, 0.45]  # más abajo y más alto para que no se corte
    )
    table.auto_set_font_size(False)
    table.set_fontsize(10)
    table.scale(1, 1.3)

    # Ajustar espacio del gráfico para que no quede muy abajo
    plt.subplots_adjust(left=0.15, bottom=0.35, top=0.9)

    # Leyenda
    legend_elements = []
    if n >= 1:
        legend_elements.append(
            Line2D([0], [0], marker='o', color='dimgray', label=f"{data.value[0].masa}kg", linestyle='', markersize=7)
        )
    if n >= 2:
        legend_elements.append(
            Line2D([0], [0], marker='^', color='red', label=f"{data.value[1].masa}kg", linestyle='', markersize=7)
        )
    if n >= 3:
        legend_elements.append(
            Line2D([0], [0], marker='s', color='blue', label=f"{data.value[-1].masa}kg", linestyle='', markersize=7)
        )

    ax.legend(handles=legend_elements, loc='upper left', fontsize=10)
    fig.tight_layout(rect=[0, 0.1, 1, 0.95])

    with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as img_file:
        plt.savefig(img_file.name, format='png', dpi=300)
        graph_image_path = img_file.name
    plt.close(fig)

    pdf = FPDF()
    pdf.add_page()
    pdf.set_font("Arial", size=12)
    pdf.cell(0, 10, "Índice de daño", ln=True)
    pdf.image(graph_image_path, x=10, y=20, w=pdf.w - 20)

    with tempfile.NamedTemporaryFile(suffix=".pdf", delete=False) as pdf_file:
        pdf.output(pdf_file.name)
        pdf_file.seek(0)
        with open(pdf_file.name, "rb") as f:
            encoded_pdf = base64.b64encode(f.read()).decode('utf-8')

    os.remove(graph_image_path)
    os.remove(pdf_file.name)

    return {
        "success": True,
        "file": encoded_pdf
    }
