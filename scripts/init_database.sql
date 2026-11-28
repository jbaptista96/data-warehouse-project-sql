/*
-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
CREATE DATABASE AND SCHEMAS
-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

SCRIPT PURPOSE
This script creates a new database named 'Datawarehouse' after checking if it already exists.
If the database exists, it's dropped and recreated. Also, this script sets up 3 schemas within the
Datawarehouse database: 'bronze', 'silver' and 'gold'.

WARNING
RUNNING THIS SCRIPT WILL DROP THE ENTIRE 'Datawarehouse' DATABASE. ALL DATA IN THE DATABASE WILL BE
PERMANENTLY DELETED. PROCEED WITH CAUTION AND ENSURE THAT YOU HAVE PROPER BACKUPS BEFORE RUNNING THIS SCRIPT.
*/

USE MASTER;
GO

-- Drop and Recreate the entire 'Datawarehouse' Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
  ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE Datawarehouse;
END;
GO

-- Create the Datawarehouse database
CREATE DATABASE Datawarehouse;
GO
USE Datawarehouse;
GO

-- Creating the bronze, silver and gold schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
