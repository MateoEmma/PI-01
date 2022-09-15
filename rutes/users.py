from select import select
from fastapi import APIRouter
from config.database import conn
from models.data import Circuit_whit_more_races, WinningDriver, Year_Max, drivers, constructors, races, pit_stop, results, qualifying, lap_times

user = APIRouter()

@user.get("/users")
def Formula1():
    return 'Database of Formula1 compititions'

@user.get('/drivers')
def F1():
    return conn.execute(drivers.select()).fetchall()

@user.get('/constructors')
def cons():
    return conn.execute(constructors.select()).fetchall()

@user.get('/races')
def race():
    return conn.execute(races.select()).fetchall()

@user.get('/pit_stop')
def stops():
    return conn.execute(pit_stop.select()).fetchall()

@user.get('/results')
def result():
    return conn.execute(results.select()).fetchall()

@user.get('/qualifying')
def qualify():
    return conn.execute(qualifying.select()).fetchall()

@user.get('/lap_times')
def laps():
    return conn.execute(lap_times.select()).fetchall()

@user.get('/year_max_races')
def yearmax():
    return conn.execute(Year_Max).fetchall()

@user.get('/winningest_driver')
def winDriver():
    return conn.execute(WinningDriver).fetchall()

@user.get('/circuit_whit_more_races')
def races_circuit():
    return conn.execute(Circuit_whit_more_races).fetchall()