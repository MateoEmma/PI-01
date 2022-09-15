create database F1;

use F1;

drop table if exists drivers;
create table drivers(
			driverId int not null,
            driverRef varchar(20),
            numbercar varchar(10),
            codeName varchar(10),
            dateofBirth date,
            nationality varchar(20),
            forename varchar(20),
            surname varchar(50)
) engine= InnoDB default charset= utf8mb4;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\drivers.csv'
into table drivers
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table if exists constructors;
create table constructors(
			constructorId int not null,
            constructorRef varchar(20),
            constructorName varchar(30),
            nationality varchar(20)
) engine= InnoDB default charset= utf8mb4;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\constructors.csv'
into table constructors
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

drop table if exists races;
create table races(
		indexTable int,
        raceId int not null,
        YearRace int,
        NumRound int,
        circuitId int,
        circuitName varchar(50),
        riceDate date,
        riceTime varchar(50)
) engine= InnoDB default charset= utf8mb4;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\races.csv'
into table races
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

drop table if exists pit_stops;
create table pit_stops(
				stopsId int not null,
                raceId int,
                driverId int,
                NumStop int,
                lap int,
                riceTime varchar(30),
                duration varchar(20),
                milliseconds int
) engine= InnoDB default charset= utf8mb4;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pit_stops.csv'
into table pit_stops
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

drop table if exists results;
create table results(
				resultId int not null,
                raceId int,
                driverId int,
                constructorId int,
                num int,
                grid int,
                endPosition int,
                points decimal(10,2),
                laps int,
                raceTime varchar(50),
                milliseconds varchar(20),
                fastTestLap varchar(20),
                driverRank varchar(20),
                fastTestLapTime varchar(50),
                fastTestLapSpeed varchar(50),
                statusId int
) engine= InnoDB default charset= utf8mb4;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\results.csv'
into table results
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;


drop table if exists qualifying;
create table qualifying(
			qualifyId int not null,
            raceId int,
            driverId int,
            constructorId int,
            num int,
            qualiPosition int,
            Q1 varchar(20),
            Q2 varchar(20),
            Q3 varchar(20)
) engine= InnoDb default charset= utf8mb4;


load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\qualifying_split_1.csv'
into table qualifying
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;    

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\qualifying_split_2.csv'
into table qualifying
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

drop table if exists lap_times;
create table lap_times(
				raceId int,
                driverId int,
                lap int,
                position int,
                riceTime varchar(50),
                milliseconds int
) engine= InnoDb default charset= utf8mb4;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\lap_times_split_1.csv'
into table lap_times
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\lap_times_split_2.csv'
into table lap_times
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\lap_times_split_3.csv'
into table lap_times
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\lap_times_split_4.csv'
into table lap_times
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\lap_times_split_5.csv'
into table lap_times
fields terminated by ',' enclosed by '' escaped by '' 
lines terminated by '\n' ignore 1 lines;

-- Assign primary and foreign keys to tables

alter table constructors add primary key(constructorId);
alter table drivers add primary key(driverId);
alter table lap_times add index(raceId);
alter table lap_times add index(driverId);
alter table pit_stops add primary key(stopsId);
alter table pit_stops add index(raceId);
alter table pit_stops add index(driverId);
alter table pit_stops add index(NumStop);
alter table qualifying add primary key(qualifyId);
alter table qualifying add index(raceId);
alter table qualifying add index(driverId);
alter table qualifying add index(constructorId);
alter table qualifying add index(num);
alter table races add primary key(raceId);
alter table races add index(circuitId);
alter table results add primary key(resultId);
alter table results add index(raceId);
alter table results add index(driverId);
alter table results add index(constructorId);

ALTER TABLE qualifying ADD CONSTRAINT `Driver_fk_Qualify` FOREIGN KEY (driverId) REFERENCES drivers(driverId) ON DELETE RESTRICT ON UPDATE RESTRICT;

                

             
            