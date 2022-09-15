from sqlalchemy import Table, Column
from sqlalchemy.sql.sqltypes import Integer, String
from config.database import meta, engine
from sqlalchemy.orm import Session
from sqlalchemy import select

drivers = Table('drivers', meta, Column(
    'driverId', Integer),
    Column('driverRef', String(255)),
    Column('numbercar', String(255)),
    Column('codeName', String(255)),
    Column('dateOfBirth',String(255)),
    Column('nationality', String(255)),
    Column('forename', String(255)),
    Column('surname', String(255)))

constructors = Table('constructors', meta, Column(
    'constructorId', Integer),
    Column('constructorRef', String(155)),
    Column('constructorName', String(155)),
    Column('nationality', String(155)))

races = Table('races', meta, Column(
    'indexTable', Integer),
    Column('raceId', Integer),
    Column('YearRace', Integer),
    Column('NumRound', Integer),
    Column('circuitId', Integer),
    Column('circuitName', String(150)),
    Column('riceDate', String(150)),
    Column('riceTime', String(150)))

pit_stop = Table('pit_stops', meta, Column(
    'stopsId', Integer),
    Column('raceId', Integer),
    Column('driverId', Integer),
    Column('NumStop', Integer),
    Column('lap', Integer),
    Column('riceTime', String(150)),
    Column('duration', String(150)),
    Column('milliseconds', Integer))

results = Table('results', meta, Column(
    'resultId', Integer),
    Column('raceId', Integer),
    Column('driverId', Integer),
    Column('constructorId', Integer),
    Column('num', Integer),
    Column('grid', Integer),
    Column('endPosition', Integer),
    Column('points', String(150)),
    Column('laps', Integer),
    Column('raceTime', String(150)),
    Column('milliseconds', String(150)),
    Column('fastTestLap', String(150)),
    Column('driverRank', String(150)),
    Column('fastTestLapTime', String(150)),
    Column('fastTestLapSpeed', String(150)),
    Column('statusId', Integer))

qualifying = Table('qualifying', meta, Column(
    'qualifyId', Integer),
    Column('raceId', Integer),
    Column('driverId', Integer),
    Column('constructorId', Integer),
    Column('num', Integer),
    Column('qualiPosition', Integer),
    Column('Q1', String(150)),
    Column('Q2', String(150)),
    Column('Q3', String(150)))

lap_times = Table('lap_times', meta, Column(
    'raceId', Integer),
    Column('driverId', Integer),
    Column('lap', Integer),
    Column('position', Integer),
    Column('riceTime', String(150)),
    Column('milliseconds', Integer))

Year_Max = 'select count(raceId) as NumRaces, yearRace from races group by yearRace order by count(raceId) desc limit 1'

WinningDriver = 'select d.forename, d.surname, count(r.endPosition) as RacesWinners from results r join drivers d  on r.driverId = d.driverId where r.endPosition = 1 group by d.surname limit 1'

Circuit_whit_more_races = 'select count(raceId) as Number_of_Races, circuitName from races group by circuitName order by count(raceId) desc limit 2'

meta.create_all(engine)