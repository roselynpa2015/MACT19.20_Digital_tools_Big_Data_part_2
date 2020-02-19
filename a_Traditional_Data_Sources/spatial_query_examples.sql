--- encoding: utf-8

--------------------------------------------------
-- This script contains examples of queries involving spatial features using the SQL language for postgreSQL
-- It can be executed using pgadmin. This exercise aims to show the potential use of spatial relationships in spatial databases.
-- You need either to have a connection with a postgreSQL server and a postgis-enabled database or a local server configured
-- To install postGIS see the documentation here https://www.postgresql.org/docs/
-- To enable postGIS see the documentation here https://postgis.net/install/
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
-- What are the district areas? 

SELECT d.name, sum(st_area(n.geometry)) area_sqm -- A combination of spatial and aggregation functions
FROM neighbourhoods n, districts d
WHERE n.district = d.code 	-- We only consider rows matching codes
GROUP BY d.name;		-- Try cnanging the district code


-- Query 2
-- Spatially Aggregate neighbourhoods into districts

CREATE VIEW districts_aggregated AS
SELECT n.district, d.name, st_union(n.geometry) geometry
FROM districts d, neighbourhoods n
WHERE d.code = n.district
GROUP BY n.district, d.name;	-- We use year to prevent from issues with larger datasets
-- If we need to delete this view, we can also do it
DROP VIEW districts_aggregated;


-- Query 3
-- What is the population density per district? 

-- First, we can create a view to summarise population in 2017 per district
CREATE VIEW population_per_district AS
SELECT p.district, sum(p.population) population
FROM population p, districts d
WHERE p.district = d.code AND
    p.year = 2017
GROUP BY p.year, p.district;
-- If we need to delete this view, we can also do it
DROP VIEW population_per_district;

-- Second, we can use views to simplify our query
SELECT d.name, st_area(d.geometry) area_sqm, p.population, 
    p.population / (st_area(d.geometry)/10000) population_density_iph -- density is estimated as inhabitants per hectare
FROM districts_aggregated d, population_per_district p
WHERE d.district = p.district;

