USE tempdb;
GO

IF OBJECT_ID(N'dbo.Header2', N'U') IS NOT NULL DROP TABLE dbo.Header2;
GO
CREATE TABLE dbo.Header2 (
    Id TINYINT NOT NULL CONSTRAINT PK_Header2_Id PRIMARY KEY,
    CreateDate DATE NOT NULL CONSTRAINT DF_Header2_CreateDate_SYSDATETIME DEFAULT SYSDATETIME(),
    RandomData CHAR(52) NOT NULL
);
GO

IF OBJECT_ID(N'dbo.Header', N'U') IS NOT NULL DROP TABLE dbo.Header;
GO
CREATE TABLE dbo.Header (
    Id TINYINT NOT NULL IDENTITY(1, 1) CONSTRAINT PK_Header_Id PRIMARY KEY,
    CreateDate DATE NOT NULL CONSTRAINT DF_Header_CreateDate_SYSDATETIME DEFAULT SYSDATETIME(),
    RandomData CHAR(50) NOT NULL CONSTRAINT DF_Header_RandomData_X DEFAULT (REPLICATE('X', 50))
);
GO

INSERT INTO dbo.Header2 (Id, RandomData) 
SELECT Id, REPLICATE('Y', Id)
FROM (
    INSERT INTO dbo.Header (CreateDate)
    OUTPUT inserted.CreateDate, inserted.Id, inserted.RandomData
    SELECT TOP (50) SYSDATETIME() FROM master.dbo.spt_values
) AS DataInsert
WHERE DataInsert.Id % 2 = 0;    -- Only insert into dbo.Header2 when the Id is a multiple of 2.
GO

ALTER TABLE dbo.Header2 ADD CONSTRAINT FK_Header2_Header_Id_Id FOREIGN KEY (Id) REFERENCES dbo.Header(Id);
GO

SELECT * FROM dbo.Header;
SELECT * FROM dbo.Header2;
GO

IF OBJECT_ID(N'dbo.GetHeaders', N'P') IS NOT NULL DROP PROCEDURE dbo.GetHeaders;
GO
CREATE PROCEDURE dbo.GetHeaders (@Id tinyint)
AS
SELECT h.Id, h.CreateDate, h.RandomData
FROM dbo.Header AS h
WHERE h.Id = @id;

SELECT h2.Id, h2.CreateDate, h2.RandomData
FROM dbo.Header2 AS h2
WHERE h2.Id = @Id;
GO

EXECUTE dbo.GetHeaders @Id = 6
WITH RESULT SETS (
    (   -- Header data Set...Why not rename these columns...
        HeaderId tinyint NOT NULL,
        HeaderCreatedDate date NOT NULL,
        HeaderRandomness char(50) NOT NULL
    ),
    (   -- Header2 data set...
        Header2Id tinyint NOT NULL,
        Header2CreatedDate date NOT NULL,
        Header2Randomnessness char(52) NOT NULL
    )
);
GO

EXECUTE dbo.GetHeaders @Id = 5
WITH RESULT SETS (
    (   -- Header data Set...Why not rename these columns...
        HeaderId tinyint NOT NULL,
        HeaderCreatedDate date NOT NULL,
        HeaderRandomness char(50) NOT NULL
    ),
    (   -- Header2 data set...
        Header2Id tinyint NOT NULL,
        Header2CreatedDate date NOT NULL,
        Header2Randomnessness char(52) NOT NULL
    )
);
GO
