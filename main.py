from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import importlib
import os

app = FastAPI()

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Puedes cambiar esto a ["http://localhost:3000"] si necesitas más seguridad
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Agregar prefijo /api
from fastapi.routing import APIRouter

api_router = APIRouter(prefix="/api")

# Ruta dinámica para cargar routers en "entities"
entities_path = os.path.join(os.path.dirname(__file__), "entities")

for entity_name in os.listdir(entities_path):
    entity_folder = os.path.join(entities_path, entity_name)
    router_path = os.path.join(entity_folder, "router.py")
    if os.path.isdir(entity_folder) and os.path.exists(router_path):
        module_name = f"entities.{entity_name}.router"
        try:
            module = importlib.import_module(module_name)
            api_router.include_router(module.router)
            print(f"Router {entity_name} agregado con éxito")

        except ModuleNotFoundError as e:
            print(f"Error al importar el router {module_name}: {e}")

# Montar el router principal con prefijo /api
app.include_router(api_router)
