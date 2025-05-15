from fastapi import APIRouter, UploadFile, File
from typing import List
from . import controller
from fastapi.responses import JSONResponse

router = APIRouter()

@router.post("/fortran")
async def create_fortran(files: List[UploadFile] = File(...)):
    result = controller.create_formulario(files)
    return JSONResponse(content=result)