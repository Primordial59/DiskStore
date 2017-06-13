CREATE TABLE Orders (
	[OrderId] INT Identity NOT NULL,
	[Family] NVARCHAR(MAX) NULL,
	[Name] NVARCHAR(MAX) NULL,
	[SecondName] NVARCHAR(MAX) NULL,
	[E-Mail] NVARCHAR(MAX) NULL,
	[Index] NVARCHAR(MAX) NULL,
	[City] NVARCHAR(MAX) NULL,
	[Address] NVARCHAR(MAX) NULL,
	[GiftWrap] BIT NOT NULL,
	[Dispatched] BIT NOT NULL,
	CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED ([OrderId] ASC)
);

CREATE TABLE OrderLines (
	[OrderLineId] INT IDENTITY NOT NULL,
	[Quantity] INT NOT NULL,
	[Disk_ID] INT NULL,
	[Order_OrderId] INT NULL,
	CONSTRAINT [PK_dbo.OrderLines] PRIMARY KEY CLUSTERED ([OrderLineId] ASC),
	CONSTRAINT [FK_dbo.OrderLines_dbo.Disks_ID] FOREIGN KEY
		([Disk_ID]) REFERENCES [dbo].[Disks] ([ID]),
	CONSTRAINT [FK_dbo.OrderLines_dbo.Order_OrderId] FOREIGN KEY
		([Order_OrderId]) REFERENCES [dbo].[Orders] ([OrderId])
);