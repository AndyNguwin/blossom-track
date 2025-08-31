import sys
import os

# Changing path to backend/app so I can get the auth.py and models.py to use its tools
sys.path.append(os.path.join(os.path.dirname(__file__), "backend", "app"))

from auth import get_password_hash
from models import Session, Users 

if __name__ == "__main__":
    session = Session()
    try:
        users = session.query(Users).all()
        for user in users:
            user.password = get_password_hash(user.password)
        session.commit()
        print(f"Successfully hashed {len(users)} passwords")
    except Exception as e:
        print(f"Error hashing passwords: {e}")
        session.rollback()
    finally:
        session.close()
