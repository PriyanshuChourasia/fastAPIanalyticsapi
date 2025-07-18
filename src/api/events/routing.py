from fastapi import APIRouter
from .schemas import EventSchema

router = APIRouter()

@router.get("/")
def read_events():
    return{
        "items":[
            {"id":1},
            {"id":2},
            {"id":3}
        ],
        "count":3
    }

@router.get("/{event_id}")
def get_event(event_id:int) -> EventSchema:
    return{
        "id":event_id
    }

# Create event
@router.post("/")
def create_event() -> EventSchema:
    return{
        "id":123
    }
