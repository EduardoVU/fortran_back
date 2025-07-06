from pydantic import BaseModel
from typing import Optional, List

class DamageEntry(BaseModel):
    masa: float
    desplazamiento: float
    height: float
    energy: Optional[float] = None  # Campo opcional para calcular internamente

class DamagePayload(BaseModel):
    name: str
    value: List[DamageEntry]