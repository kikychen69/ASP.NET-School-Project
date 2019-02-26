CREATE TABLE [dbo].[UserTable]
(
[UserID] [int] NOT NULL IDENTITY(1, 1),
[FirstName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneNo] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PostalCode] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Address] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserTable] ADD CONSTRAINT [PK__UserTabl__1788CCACCD5BBF6E] PRIMARY KEY CLUSTERED  ([UserID]) ON [PRIMARY]
GO
