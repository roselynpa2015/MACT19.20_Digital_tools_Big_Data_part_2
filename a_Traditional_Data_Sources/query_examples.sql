--- encoding: utf-8

--------------------------------------------------
-- This script contains examples of queries to test within the class using the SQL language for postgreSQL
-- It can be executed using pgadmin. This exercise aims to provide a set of queries and the introduction to relational algebra.
-- You need either to have a connection with a postgreSQL server or a local server configured
-- To install postGIS see the documentation here https://www.postgresql.org/docs/
--------------------------------------------------

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

-- Query 1
-- What neighbourhoods are part of district X

SELECT name			-- Try changing name for *
FROM neighbourhoods
WHERE district = '01';		-- Try cnanging the district code


-- Query 2
-- What is the population per district?

SELECT year, district, sum(population) population
FROM population
GROUP BY year, district;	-- We use year to prevent from issues with larger datasets


-- Query 3
-- How many people live in district X?

SELECT year, district, sum(population) population
FROM population
WHERE district = '01'
GROUP BY year, district;	-- We use year to prevent from issues with larger datasets


-- Query 4
-- Order Barcelona districts using population

SELECT p.year, d.name, p.district, sum(p.population) population
FROM population p, districts d	-- Now we use two relations/tables to combine data
WHERE p.district = d.code	-- We need to work only with rows matching codes
GROUP BY p.year, d.name, p.district
ORDER BY sum(p.population) DESC;	-- We can now use a function to orther the results
