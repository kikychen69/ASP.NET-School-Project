CREATE TABLE [dbo].[Orders]
(
[OrderID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[BookID] [int] NOT NULL,
[Quantity] [int] NOT NULL,
[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK__Orders__C3905BAF1B91A0B6] PRIMARY KEY CLUSTERED  ([OrderID]) ON [PRIMARY]
GO
