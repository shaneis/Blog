USE [__DBA];
GO

IF OBJECT_ID(N'dbo.dbachecksStaging', N'U') IS NULL BEGIN
    CREATE TABLE dbo.dbachecksStaging (
        ServerName              varchar(50)     NOT NULL,
        TestName                varchar(128)    NOT NULL,
        TestDescription         varchar(255)    NOT NULL,
        TestDate                date            NOT NULL,
        TestPassed              bit             NOT NULL,
        FailMessage             varchar(2000)   NULL,
        DurationMilliseconds    int             NOT NULL
    );
    RAISERROR(N'Table dbo.dbachecksStaging created.', 0, 1) WITH NOWAIT;
END; ELSE BEGIN
    RAISERROR(N'Table dbo.dbachecksStaging present.', 0, 1) WITH NOWAIT;
END;

SELECT
    *
FROM dbo.dbachecksStaging;
GO

TRUNCATE TABLE dbo.dbachecksStaging;
GO
