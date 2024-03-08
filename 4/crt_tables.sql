/* Drop the table before creating it to make sure that any old table is also dropped*/
DROP TABLE hydro_data;
CREATE TABLE hydro_data (Location_ID   VARCHAR2(100),
                         Location_Name VARCHAR2(100),  
                         Status        VARCHAR2(100),  
                         Latitude      VARCHAR2(100),  
                         Longitude     VARCHAR2(100),  
                         Local_Year    VARCHAR2(100),
                         Local_Month   VARCHAR2(100),
                         Value         VARCHAR2(100),  
                         Unit          VARCHAR2(100),
                         PRIMARY KEY (Local_Year, Local_Month, Location_ID, Location_Name));



DROP TABLE weather_data;
CREATE TABLE weather_data (x                   VARCHAR2(100), 
                           y                   VARCHAR2(100), 
                           STATION_NAME        VARCHAR2(100), 
                           TOTAL_PRECIPITATION VARCHAR2(100), 
                           LOCAL_YEAR          VARCHAR2(100), 
                           LOCAL_DAY           VARCHAR2(100), 
                           MEAN_TEMPERATURE    VARCHAR2(100), 
                           LOCAL_MONTH         VARCHAR2(100),
                           PRIMARY KEY (LOCAL_YEAR, LOCAL_DAY, LOCAL_MONTH, STATION_NAME));


DROP TABLE wildfire_data;
CREATE TABLE wildfire_data (﻿Year           VARCHAR2(100), 
                            Total_Hectares   VARCHAR2(100), 
                            Number_of_Fires  VARCHAR2(100), 
                            Max_Fire_Size_ha VARCHAR2(100),
                            PRIMARY KEY (Year));

