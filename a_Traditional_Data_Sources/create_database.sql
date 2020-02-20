--- encoding: utf-8

--------------------------------------------------
-- This script contains examples to create a database structure for postgreSQL. It uses the SQL language for postgreSQL
-- It can be executed using pgadmin. This exercise aims to provide a basic example of how to create a database
-- You need either to have a connection with a postgreSQL server or a local server configured
-- To install postGIS see the documentation here https://www.postgresql.org/docs/
--------------------------------------------------
-
--------------------------------------------------
-- Author: Diego Pajarito
-- Copyright: Copyright 2020, IAAC
-- Credits: [Institute for Advanced Architecture of Catalonia -- IAAC, Advanced Architecture group]
-- License:  Apache License Version 2.0
-- Version: 1.0.0
-- Maintainer: Diego Pajarito
-- Email: diego.pajarito@iaac.net
-- Status: development
--------------------------------------------------


------------------------------------------------------
-- General database configuration

--- create user;
CREATE role mact WITH login encrypted password 'mact';

--- Create database;
CREATE DATABASE example WITH OWNER = mact;

--- Add the postgis extension to database
CREATE extension postgis;

------------------------------------------------------
--- Table districts
CREATE TABLE districts(
    code varchar PRIMARY KEY,
    name varchar);

--- (Only for information) To delete the table
DROP TABLE districts;

--- Load data into table districts
INSERT INTO districts VALUES ('01', 'Ciutat Vella');
INSERT INTO districts VALUES ('02', 'Eixample');
INSERT INTO districts VALUES ('03', 'Sants-Montjuïc');
INSERT INTO districts VALUES ('04', 'Les Corts');
INSERT INTO districts VALUES ('05', 'Sarrià-Sant Gervasi');
INSERT INTO districts VALUES ('06', 'Gràcia');
INSERT INTO districts VALUES ('07', 'Horta-Guinardó');
INSERT INTO districts VALUES ('08', 'Nou Barris');
INSERT INTO districts VALUES ('09', 'Sant Andreu');
INSERT INTO districts VALUES ('10', 'Sant Martí');

------------------------------------------------------
--- Table population
CREATE TABLE population(
    district varchar,
    neighbourhood varchar,
    year integer,
    gender varchar,
    population integer);

ALTER TABLE population ADD CONSTRAINT pk_population PRIMARY KEY (district, neighbourhood, year, gender);

--- (Only for information) To delete the table
DROP TABLE population;

--- Load data into table population
INSERT INTO population VALUES ('01','01',2017,'Male',25802);
INSERT INTO population VALUES ('01','02',2017,'Male',8354);
INSERT INTO population VALUES ('01','03',2017,'Male',7455);
INSERT INTO population VALUES ('01','04',2017,'Male',11309);
INSERT INTO population VALUES ('02','05',2017,'Male',15054);
INSERT INTO population VALUES ('02','06',2017,'Male',23587);
INSERT INTO population VALUES ('02','07',2017,'Male',20412);
INSERT INTO population VALUES ('02','08',2017,'Male',19632);
INSERT INTO population VALUES ('02','09',2017,'Male',27012);
INSERT INTO population VALUES ('02','10',2017,'Male',18165);
INSERT INTO population VALUES ('03','11',2017,'Male',19822);
INSERT INTO population VALUES ('03','12',2017,'Male',597);
INSERT INTO population VALUES ('03','13',2017,'Male',14716);
INSERT INTO population VALUES ('03','14',2017,'Male',4895);
INSERT INTO population VALUES ('03','15',2017,'Male',7604);
INSERT INTO population VALUES ('03','16',2017,'Male',8734);
INSERT INTO population VALUES ('03','17',2017,'Male',11204);
INSERT INTO population VALUES ('03','18',2017,'Male',19332);
INSERT INTO population VALUES ('04','19',2017,'Male',21364);
INSERT INTO population VALUES ('04','20',2017,'Male',11191);
INSERT INTO population VALUES ('04','21',2017,'Male',5658);
INSERT INTO population VALUES ('05','22',2017,'Male',2317);
INSERT INTO population VALUES ('05','23',2017,'Male',11640);
INSERT INTO population VALUES ('05','24',2017,'Male',7722);
INSERT INTO population VALUES ('05','25',2017,'Male',11844);
INSERT INTO population VALUES ('05','26',2017,'Male',21487);
INSERT INTO population VALUES ('05','27',2017,'Male',13392);
INSERT INTO population VALUES ('06','28',2017,'Male',7333);
INSERT INTO population VALUES ('06','29',2017,'Male',3465);
INSERT INTO population VALUES ('06','30',2017,'Male',6057);
INSERT INTO population VALUES ('06','31',2017,'Male',23035);
INSERT INTO population VALUES ('06','32',2017,'Male',15664);
INSERT INTO population VALUES ('07','33',2017,'Male',11815);
INSERT INTO population VALUES ('07','34',2017,'Male',4214);
INSERT INTO population VALUES ('07','35',2017,'Male',17018);
INSERT INTO population VALUES ('07','36',2017,'Male',4462);
INSERT INTO population VALUES ('07','37',2017,'Male',15073);
INSERT INTO population VALUES ('07','38',2017,'Male',5615);
INSERT INTO population VALUES ('07','39',2017,'Male',3198);
INSERT INTO population VALUES ('07','40',2017,'Male',2280);
INSERT INTO population VALUES ('07','41',2017,'Male',2741);
INSERT INTO population VALUES ('07','42',2017,'Male',314);
INSERT INTO population VALUES ('07','43',2017,'Male',12536);
INSERT INTO population VALUES ('08','44',2017,'Male',11776);
INSERT INTO population VALUES ('08','45',2017,'Male',11625);
INSERT INTO population VALUES ('08','46',2017,'Male',7165);
INSERT INTO population VALUES ('08','47',2017,'Male',1075);
INSERT INTO population VALUES ('08','48',2017,'Male',7040);
INSERT INTO population VALUES ('08','49',2017,'Male',3279);
INSERT INTO population VALUES ('08','50',2017,'Male',7517);
INSERT INTO population VALUES ('08','51',2017,'Male',5749);
INSERT INTO population VALUES ('08','52',2017,'Male',12375);
INSERT INTO population VALUES ('08','53',2017,'Male',3454);
INSERT INTO population VALUES ('08','54',2017,'Male',1413);
INSERT INTO population VALUES ('08','55',2017,'Male',5088);
INSERT INTO population VALUES ('08','56',2017,'Male',675);
INSERT INTO population VALUES ('09','57',2017,'Male',5147);
INSERT INTO population VALUES ('09','58',2017,'Male',1233);
INSERT INTO population VALUES ('09','59',2017,'Male',6248);
INSERT INTO population VALUES ('09','60',2017,'Male',26970);
INSERT INTO population VALUES ('09','61',2017,'Male',13598);
INSERT INTO population VALUES ('09','62',2017,'Male',6470);
INSERT INTO population VALUES ('09','63',2017,'Male',10357);
INSERT INTO population VALUES ('10','64',2017,'Male',17846);
INSERT INTO population VALUES ('10','65',2017,'Male',12938);
INSERT INTO population VALUES ('10','66',2017,'Male',7314);
INSERT INTO population VALUES ('10','67',2017,'Male',4587);
INSERT INTO population VALUES ('10','68',2017,'Male',16441);
INSERT INTO population VALUES ('10','69',2017,'Male',6699);
INSERT INTO population VALUES ('10','70',2017,'Male',11614);
INSERT INTO population VALUES ('10','71',2017,'Male',9882);
INSERT INTO population VALUES ('10','72',2017,'Male',12308);
INSERT INTO population VALUES ('10','73',2017,'Male',13621);
INSERT INTO population VALUES ('01','01',2017,'Female',21806);
INSERT INTO population VALUES ('01','02',2017,'Female',7708);
INSERT INTO population VALUES ('01','03',2017,'Female',7541);
INSERT INTO population VALUES ('01','04',2017,'Female',11412);
INSERT INTO population VALUES ('02','05',2017,'Female',16962);
INSERT INTO population VALUES ('02','06',2017,'Female',27952);
INSERT INTO population VALUES ('02','07',2017,'Female',23640);
INSERT INTO population VALUES ('02','08',2017,'Female',22652);
INSERT INTO population VALUES ('02','09',2017,'Female',31168);
INSERT INTO population VALUES ('02','10',2017,'Female',20180);
INSERT INTO population VALUES ('03','11',2017,'Female',20406);
INSERT INTO population VALUES ('03','12',2017,'Female',552);
INSERT INTO population VALUES ('03','13',2017,'Female',15868);
INSERT INTO population VALUES ('03','14',2017,'Female',5506);
INSERT INTO population VALUES ('03','15',2017,'Female',8300);
INSERT INTO population VALUES ('03','16',2017,'Female',9796);
INSERT INTO population VALUES ('03','17',2017,'Female',12783);
INSERT INTO population VALUES ('03','18',2017,'Female',21795);
INSERT INTO population VALUES ('04','19',2017,'Female',24645);
INSERT INTO population VALUES ('04','20',2017,'Female',12757);
INSERT INTO population VALUES ('04','21',2017,'Female',6418);
INSERT INTO population VALUES ('05','22',2017,'Female',2353);
INSERT INTO population VALUES ('05','23',2017,'Female',13392);
INSERT INTO population VALUES ('05','24',2017,'Female',8945);
INSERT INTO population VALUES ('05','25',2017,'Female',13930);
INSERT INTO population VALUES ('05','26',2017,'Female',26179);
INSERT INTO population VALUES ('05','27',2017,'Female',16078);
INSERT INTO population VALUES ('06','28',2017,'Female',8426);
INSERT INTO population VALUES ('06','29',2017,'Female',3947);
INSERT INTO population VALUES ('06','30',2017,'Female',7128);
INSERT INTO population VALUES ('06','31',2017,'Female',27627);
INSERT INTO population VALUES ('06','32',2017,'Female',18665);
INSERT INTO population VALUES ('07','33',2017,'Female',13857);
INSERT INTO population VALUES ('07','34',2017,'Female',4780);
INSERT INTO population VALUES ('07','35',2017,'Female',19449);
INSERT INTO population VALUES ('07','36',2017,'Female',4921);
INSERT INTO population VALUES ('07','37',2017,'Female',16478);
INSERT INTO population VALUES ('07','38',2017,'Female',6004);
INSERT INTO population VALUES ('07','39',2017,'Female',3656);
INSERT INTO population VALUES ('07','40',2017,'Female',2822);
INSERT INTO population VALUES ('07','41',2017,'Female',3043);
INSERT INTO population VALUES ('07','42',2017,'Female',296);
INSERT INTO population VALUES ('07','43',2017,'Female',14179);
INSERT INTO population VALUES ('08','44',2017,'Female',13815);
INSERT INTO population VALUES ('08','45',2017,'Female',13375);
INSERT INTO population VALUES ('08','46',2017,'Female',8302);
INSERT INTO population VALUES ('08','47',2017,'Female',1196);
INSERT INTO population VALUES ('08','48',2017,'Female',8191);
INSERT INTO population VALUES ('08','49',2017,'Female',3577);
INSERT INTO population VALUES ('08','50',2017,'Female',8073);
INSERT INTO population VALUES ('08','51',2017,'Female',6604);
INSERT INTO population VALUES ('08','52',2017,'Female',14014);
INSERT INTO population VALUES ('08','53',2017,'Female',3807);
INSERT INTO population VALUES ('08','54',2017,'Female',1443);
INSERT INTO population VALUES ('08','55',2017,'Female',5254);
INSERT INTO population VALUES ('08','56',2017,'Female',697);
INSERT INTO population VALUES ('09','57',2017,'Female',4836);
INSERT INTO population VALUES ('09','58',2017,'Female',1306);
INSERT INTO population VALUES ('09','59',2017,'Female',6312);
INSERT INTO population VALUES ('09','60',2017,'Female',30213);
INSERT INTO population VALUES ('09','61',2017,'Female',15486);
INSERT INTO population VALUES ('09','62',2017,'Female',7646);
INSERT INTO population VALUES ('09','63',2017,'Female',11772);
INSERT INTO population VALUES ('10','64',2017,'Female',20322);
INSERT INTO population VALUES ('10','65',2017,'Female',14101);
INSERT INTO population VALUES ('10','66',2017,'Female',7820);
INSERT INTO population VALUES ('10','67',2017,'Female',4780);
INSERT INTO population VALUES ('10','68',2017,'Female',17402);
INSERT INTO population VALUES ('10','69',2017,'Female',6930);
INSERT INTO population VALUES ('10','70',2017,'Female',11395);
INSERT INTO population VALUES ('10','71',2017,'Female',10605);
INSERT INTO population VALUES ('10','72',2017,'Female',13838);
INSERT INTO population VALUES ('10','73',2017,'Female',15070);