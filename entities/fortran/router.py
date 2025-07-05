from fastapi import APIRouter, UploadFile, File, Query
from typing import List, Literal
from . import controller
from fastapi.responses import JSONResponse

router = APIRouter()

@router.post("/fortran")
async def create_fortran(
    files: List[UploadFile] = File(...),
    target_os: Literal["windows", "linux"] = Query(
        "windows", description="Sistema operativo del entorno de ejecución", example="windows"
    )
):
    result = controller.create_formulario(files, target_os=target_os)
    return JSONResponse(content=result)