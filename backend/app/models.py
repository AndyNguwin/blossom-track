from sqlalchemy import create_engine, Column, Integer, String, Text, Boolean, TIMESTAMP, ForeignKey, Date
from sqlalchemy.engine import URL
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from sqlalchemy.sql import func


url = URL.create(
    drivername="postgresql",
    username="postgres",
    password="zekrom11",
    host="localhost",
    database="blossom-track",
    port=5432
)

engine = create_engine(url)
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()

class Users(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    first_name = Column(String(20), nullable=False)
    last_name = Column(String(20), nullable=False)
    username = Column(String(20), nullable=False, unique=True)
    email = Column(String(100), nullable=False, unique=True)
    password = Column(Text, nullable=False)
    created_at = Column(TIMESTAMP(timezone=True), nullable=False, server_default=func.now())

    tasks = relationship("Tasks", back_populates="user")

class Tasks(Base):
    __tablename__ = "tasks"

    id = Column(Integer, primary_key = True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    task_name = Column(Text, nullable=False)
    is_active = Column(Boolean, nullable=False, server_default = "true")
    created_at = Column(TIMESTAMP(timezone=True), nullable=False, server_default=func.now())

    user = relationship("Users", back_populates="tasks")
    completions = relationship("Completions", back_populates="task")

class Completions(Base):
    __tablename__ = "completions"

    task_id = Column(Integer, ForeignKey("tasks.id"), primary_key=True)
    date = Column(Date, primary_key=True)

    task = relationship("Tasks", back_populates="completions")

Base.metadata.create_all(engine)