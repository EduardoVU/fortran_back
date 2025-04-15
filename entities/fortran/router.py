from fastapi import APIRouter
from .schemas import Formulario
from . import controller

router = APIRouter()  # Definir el objeto router

@router.post("/fortran")
def create_fortran(formulario: Formulario):
    return controller.create_formulario(formulario_data=formulario)
