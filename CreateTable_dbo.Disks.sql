CREATE TABLE [dbo].[Disks] (
    [Id]        INT         IDENTITY (1, 1)     NOT NULL,
    [Artist]    NVARCHAR (200)  NOT NULL,
    [Country]   NCHAR (50)      NULL,
    [Style]     NCHAR (50)      NULL,
    [Album]     NVARCHAR (300)  NULL,
    [Year]      DECIMAL (18)    NOT NULL,
    [Label]     NVARCHAR (50)   NULL,
    [Number]    NVARCHAR (50)   NULL,
    [Licensing] NCHAR (10)      NULL,
    [Price]     DECIMAL (18)    NOT NULL,
    [Cover]     CHAR (10)       NULL,
    [Booklet]   CHAR (10)       NULL,
    [Picture]   IMAGE           NULL,
    [Tracks]    NVARCHAR (1000) NULL,
    [Category]  NVARCHAR (30)   NULL,
    [Quantity]  INT             NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

