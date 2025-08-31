from fastapi import FastAPI
from models import Session, Users
from sqlalchemy.exc import IntegrityError

app = FastAPI()

@app.get("/")
def home():
    return {"message": "First FastAPI app"}

# TODO: Add database async functionality (with AsyncSession())\
# Create session per request to avoid error and rollback states; cons of performance overhead
# TODO: Connection pooling
@app.post("/auth/register")
async def register(first_name: str, last_name: str, username: str, email: str, password: str):
    session = Session()
    try:
        new_user = Users(
            first_name = first_name,
            last_name = last_name,
            username = username,
            email = email,
            password = password
        )
        session.add(new_user)
        session.commit()
        return {
            "message": "User registered successfully",
            "user": {
                "id": new_user.id,
                "first_name": new_user.first_name,
                "last_name": new_user.last_name,
                "username": new_user.username,
                "email": new_user.email,
                "created_at": new_user.created_at
            }
        }
        
    except IntegrityError as e:
        if "users_username_key" in str(e):
            return {"message": f"Username {username} already exists"}
        elif "users_email_key" in str(e):
            return {"message": f"Email {email} already exists"}
        else:
            return {"message": f"Error registering user: {e}"}

    except Exception as e:
        return {"message": f"Error registering user: {e}"}
    finally:
        session.close()

@app.post("/auth/login")
async def login(email: str, password: str):
    session = Session()
    try:
        account_exists = session.query(Users).filter(Users.email == email, Users.password == password).first()
        if not account_exists:
            return {"message": "Invalid email or password"}
        return {
            "message": "Login successful",
            "user": {
                "first_name": account_exists.first_name,
                "last_name": account_exists.last_name,
                "username": account_exists.username,
            }
        }
    except Exception as e:
        return {"message": f"Error logging in: {e}"}
    finally:
        session.close()

# Endpoints list

## Authentication
#1.  auth/register
#2.  auth/login
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