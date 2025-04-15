from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse, HTMLResponse
from fastapi.routing import APIRouter
import importlib
import os

app = FastAPI()

# Sirve archivos estáticos desde la carpeta dist (frontend build)
app.mount("/assets", StaticFiles(directory="dist/assets"), name="assets")

# Endpoint raíz para devolver index.html
@app.get("/", response_class=HTMLResponse)
async def serve_frontend():
    return FileResponse("dist/index.html")

# Configuración de CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Puedes restringir esto a dominios específicos
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Enrutador principal con prefijo /api
api_router = APIRouter(prefix="/api")

# Carga dinámica de routers en la carpeta entities
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

# Montar todas las rutas bajo /api
app.include_router(api_router)
