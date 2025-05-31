# router.py
from fastapi import APIRouter, UploadFile, File
from typing import List
from . import controller
from fastapi.responses import JSONResponse
from .models import DamagePayload

router = APIRouter()

@router.post("/plots")
async def create_plots(files: List[UploadFile] = File(...)):
    result = controller.create_plots(files)
    return JSONResponse(content=result)

@router.post("/plots-damage")
async def create_damage_plot(items: DamagePayload):
    print("items")
    print(items)
    for entry in items.value:
        print(entry.masa, entry.desplazamiento, entry.height)
    result = controller.create_damage_plot(items)
    return result  # ✅ FastAPI serializa automáticamente si es Pydantic-compatible
