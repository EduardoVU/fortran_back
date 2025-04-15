from pydantic import BaseModel
from typing import List

# Definir el modelo que valida los datos
class Formulario(BaseModel):
    carpeta: str
    archivos: List[str]
