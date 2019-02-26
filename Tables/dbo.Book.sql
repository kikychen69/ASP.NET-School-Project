CREATE TABLE [dbo].[Book]
(
[BookID] [int] NOT NULL IDENTITY(1, 1),
[Title] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CategoryID] [int] NOT NULL,
[ISBN] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Author] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Stock] [int] NOT NULL,
[Price] [decimal] (18, 2) NOT NULL,
[DiscountPercent] [real] NOT NULL,
[IsDiscount] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book] ADD CONSTRAINT [PK__Book__3DE0C22775CD6960] PRIMARY KEY CLUSTERED  ([BookID]) ON [PRIMARY]
GO
