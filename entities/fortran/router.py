from fastapi import APIRouter, UploadFile, File
from typing import List
from . import controller

router = APIRouter()

@router.post("/fortran")
async def create_fortran(files: List[UploadFile] = File(...)):
    return controller.create_formulario(files)