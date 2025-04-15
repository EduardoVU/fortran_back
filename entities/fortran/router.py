from fastapi import APIRouter
from .schemas import Formulario
from . import controller

router = APIRouter()

@router.post("/fortran")
def create_fortran(formulario: Formulario):
    return controller.create_formulario(formulario_data=formulario)
