DROP DATABASE IF EXISTS stocks CASCADE;CREATE DATABASE stocks;USE stocks;

DROP TABLE IF EXISTS t_raw_daily_prices;
CREATE EXTERNAL TABLE t_raw_daily_prices(xchange STRING,  symbol STRING,  trdate STRING,  open FLOAT,  high FLOAT,  low FLOAT,  close FLOAT,  volume INT,  adj_close FLOAT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","  
STORED AS TEXTFILE LOCATION '/dataops/stocks/stage/daily_prices';

SELECT * FROM t_raw_daily_prices LIMIT 10;

DROP TABLE IF EXISTS t_orc_daily_prices;
CREATE TABLE t_orc_daily_prices(xchange STRING,  symbol STRING,  trdate STRING,  open FLOAT,  high FLOAT,  low FLOAT,  close FLOAT,  volume INT,  adj_close FLOAT) 
STORED AS ORC tblproperties ("orc.compress"="NONE");

INSERT INTO stocks.t_orc_daily_prices SELECT * FROM stocks.t_raw_daily_prices;

SELECT * FROM t_orc_daily_prices LIMIT 10;

--select symbol,year(trdate),avg(open),avg(high),avg(low),avg(close),avg(adj_close),avg(volume) from stocks.t_raw_daily_prices group by symbol, year(trdate) order by symbol desc, year(trdate) asc;
--select symbol,year(trdate),avg(open),avg(high),avg(low),avg(close),avg(adj_close),avg(volume) from stocks.t_orc_daily_prices group by symbol, year(trdate) order by symbol desc, year(trdate) asc;

--=================================================================================================================================================================================
DROP DATABASE IF EXISTS airport CASCADE;CREATE DATABASE airport;USE airport;

DROP TABLE IF EXISTS t_raw_flightdata;
CREATE EXTERNAL TABLE t_raw_flightdata(year INT, month INT,dayofmonth INT,dayofweek INT,deptime INT,crsdeptime INT,arrtime INT,crsarrtime INT,uniquecarrier STRING,flightnum INT,tailnum STRING,actualelapsedtime INT,crselapsedtime INT,airtime INT,arrdelay INT,depdelay INT,origin STRING,dest STRING,distance INT,taxiin INT,taxiout INT,cancelled INT,cancellationcode STRING,diverted INT,carrierdelay INT,weatherdelay INT,nasdelay INT,securitydelay INT,lateaircraftdelay INT,isarrdelayed STRING,isdepdelayed STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE LOCATION '/dataops/airport/stage/flightdata';

SELECT * FROM t_raw_flightdata LIMIT 10;

DROP TABLE IF EXISTS t_orc_flightdata;
CREATE TABLE t_orc_flightdata(year INT, month INT,dayofmonth INT,dayofweek INT,deptime INT,crsdeptime INT,arrtime INT,crsarrtime INT,uniquecarrier STRING,flightnum INT,tailnum STRING,actualelapsedtime INT,crselapsedtime INT,airtime INT,arrdelay INT,depdelay INT,origin STRING,dest STRING,distance INT,taxiin INT,taxiout INT,cancelled INT,cancellationcode STRING,diverted INT,carrierdelay INT,weatherdelay INT,nasdelay INT,securitydelay INT,lateaircraftdelay INT,isarrdelayed STRING,isdepdelayed STRING)
STORED AS ORC tblproperties ("orc.compress"="NONE");

INSERT INTO t_orc_flightdata SELECT * FROM t_raw_flightdata;

SELECT * FROM t_orc_flightdata LIMIT 10;

--select uniquecarrier,origin,dest,count(*) as counts from airport.t_raw_flightdata group by uniquecarrier,origin,dest;
--select uniquecarrier,origin,dest,count(*) as counts from airport.t_orc_flightdata group by uniquecarrier,origin,dest;
