-- Database Restoration
-- Restore an existing database

-- Specify the database name and backup file path
USE master;
RESTORE DATABASE UniversityDB
FROM DISK = 'C:\Path\To\Your\UniversityDB.bak'
WITH REPLACE; -- Use REPLACE if you are overwriting an existing database
