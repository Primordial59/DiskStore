CREATE TABLE [dbo].[Disks] (
    [Id]        INT             NOT NULL,
    [Artist]    NVARCHAR (200)  NOT NULL,
    [Country]   NCHAR (50)      NULL,
    [Style]     NCHAR (50)      NULL,
    [Album]     NVARCHAR (300)  NULL,
    [Year]      DECIMAL             NOT NULL,
    [Label]     NVARCHAR (50)   NULL,
    [Number]    NVARCHAR (50)   NULL,
    [Licensing] NCHAR (10)      NULL,
    [Price]     DECIMAL             NOT NULL,
    [Cover]     CHAR (10)       NULL,
    [Booklet]   CHAR (10)       NULL,
    [Picture]   IMAGE           NULL,
    [Tracks]    NVARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

