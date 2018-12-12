--thanks to https://dba.stackexchange.com/a/160930/137462

CREATE DATABASE RecursiveTreeDemo
GO

USE RecursiveTreeDemo
GO

--create table
CREATE TABLE Category(
Id int identity(1,1) not null primary key,
[Name] nvarchar(50) not null,
ParentId int null)


--create some data
INSERT INTO Category(Name, ParentId) VALUES('Computer',NULL)
	declare @computer int  =@@IDENTITY
INSERT INTO Category(Name, ParentId) VALUES('Notebook',@computer)
	declare @notebook int  =@@IDENTITY
INSERT INTO Category(Name, ParentId) VALUES('Dell Xps 13',@notebook)
INSERT INTO Category(Name, ParentId) VALUES('Macbook Pro',@notebook)


INSERT INTO Category(Name, ParentId) VALUES('Music',NULL)
	declare @music int  =@@IDENTITY
INSERT INTO Category(Name, ParentId) VALUES('Instruments',@music)
	declare @instruments int  =@@IDENTITY
INSERT INTO Category(Name, ParentId) VALUES('Guitar',@instruments)
	declare @guitar int  =@@IDENTITY
INSERT INTO Category(Name, ParentId) VALUES('Electric',@guitar)
INSERT INTO Category(Name, ParentId) VALUES('Acoustic',@guitar)
INSERT INTO Category(Name, ParentId) VALUES('Classic',@guitar)
INSERT INTO Category(Name, ParentId) VALUES('Drums',@instruments)