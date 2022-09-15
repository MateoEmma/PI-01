from select import select
from sqlalchemy import create_engine, MetaData

engine = create_engine('mysql+pymysql://root:sofia2929@localhost:3306/F1')

meta = MetaData()

conn = engine.connect()