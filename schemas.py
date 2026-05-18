from pydantic import BaseModel
from typing import Optional

# Base Schema contains properties that are common across all variants
class TaskBase(BaseModel):
    title: str
    description: Optional[str] = None
    completed: bool = False

# Schema for creating a task (client sends this)
class TaskCreate(TaskBase):
    pass

# Schema for reading a task (API returns this)
class Task(TaskBase):
    id: int

    class Config:
        # Tells Pydantic to read data even if it is not a dict, but an ORM model
        from_attributes = True
