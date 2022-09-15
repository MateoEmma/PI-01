from fastapi import FastAPI
from rutes.users import user
from config.database import conn

app = FastAPI(title= 'Formula1',
            description= 'API on drivers, tracks, teams, statistics of Formula 1',
            version= '1.0.0')

app.include_router(user)



