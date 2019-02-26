CREATE TABLE [dbo].[Category]
(
[CategoryID] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD CONSTRAINT [PK__Category__19093A2B64636962] PRIMARY KEY CLUSTERED  ([CategoryID]) ON [PRIMARY]
GO
