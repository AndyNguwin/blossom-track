from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def home():
    return {"message": "First FastAPI app"}

# Endpoints list

## Authentication
# auth/register
# auth/login
# auth/refresh
# auth/signout

## Tasks
# tasks
# tasks/{task_id}
# POST task
# PUT tasks/{task_id}
# PATCH? tasks/task_id/archive
# DELETE tasks/{task_id}

## Completion
# tasks/{task_id}/completions
# POST /completions
# DELETE completions/{task_id}/{date}
# GET /dashboard?