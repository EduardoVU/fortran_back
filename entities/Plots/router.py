from fastapi import APIRouter, UploadFile, File
from typing import List
from . import controller
from fastapi.responses import JSONResponse

router = APIRouter()

@router.post("/plots")
async def create_plots(files: List[UploadFile] = File(...)):
    result = controller.create_plots(files)
    return JSONResponse(content=result)