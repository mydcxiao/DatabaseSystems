-- software: Postgres app
--           Postico

-- table creation command
CREATE TABLE locdata (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    loc geography(Point,4326)
);

-- insert data into Postgres DB

-- DELETE FROM locdata;
-- ALTER SEQUENCE locdata_id_seq RESTART WITH 1;
INSERT INTO locdata (name, loc) VALUES ('Home', 'SRID=4326;POINT(-118.272608942037 34.027350612036194)');
INSERT INTO locdata (name, loc) VALUES ('Leavey Library', 'SRID=4326;POINT(-118.28304275126855 34.02167573271006)');
INSERT INTO locdata (name, loc) VALUES ('Doheny Library', 'SRID=4326;POINT(-118.2840443224339 34.0203046616926)');
INSERT INTO locdata (name, loc) VALUES ('EastAsian Lib', 'SRID=4326;POINT(-118.28343140265576 34.02064083976218)');
INSERT INTO locdata (name, loc) VALUES ('CinematArts Lib', 'SRID=4326;POINT(-118.28354532472655 34.019924995912724)');
INSERT INTO locdata (name, loc) VALUES ('Law Library', 'SRID=4326;POINT(-118.28495982114066 34.018998406859225)');
INSERT INTO locdata (name, loc) VALUES ('Hoose Lib', 'SRID=4326;POINT(-118.28664120466127 34.01900065622015)');
INSERT INTO locdata (name, loc) VALUES ('Fountain1', 'SRID=4326;POINT(-118.28456729661514 34.02050593405413)');
INSERT INTO locdata (name, loc) VALUES ('Dry pool', 'SRID=4326;POINT(-118.28497700404216 34.019113364661216)');
INSERT INTO locdata (name, loc) VALUES ('Fast pool', 'SRID=4326;POINT(-118.28670082624842 34.018632327238116)');
INSERT INTO locdata (name, loc) VALUES ('Fountain2', 'SRID=4326;POINT(-118.28531716702426 34.02020652748128)');
INSERT INTO locdata (name, loc) VALUES ('Pit pool', 'SRID=4326;POINT(-118.28561602439056 34.022221505919326)');
INSERT INTO locdata (name, loc) VALUES ('Gate pool', 'SRID=4326;POINT(-118.28385462591636 34.02259087916958)');
-- SELECT * FROM locdata;

-- compute convex hull 
SELECT ST_AsText(ST_ConvexHull(ST_Collect(loc::geometry))::geography)
    FROM locdata;
    
-- compute nearest neighbor
SELECT ST_AsText(loc) FROM locdata 
    ORDER BY loc <-> (SELECT loc FROM locdata WHERE name = 'Home')
    LIMIT 1
    OFFSET 1;