CREATE TABLE [dbo].[OrderDetails]
(
[OrderID] [int] NOT NULL IDENTITY(1, 1),
[BookID] [int] NOT NULL,
[Quantity] [int] NOT NULL,
[Price] [decimal] (18, 2) NOT NULL,
[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [PK__OrderDet__C3905BAF0F591EA7] PRIMARY KEY CLUSTERED  ([OrderID]) ON [PRIMARY]
GO
