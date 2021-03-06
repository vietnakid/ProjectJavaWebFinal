USE [master]
GO
USE [ChatApp]
GO
/****** Object:  Table [dbo].[BannedWords]    Script Date: 10/31/2017 16:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannedWords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bannedWord] [nvarchar](50) NULL,
 CONSTRAINT [PK_BannedWords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/31/2017 16:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [char](50) NULL,
	[date_of_birth] [date] NULL,
	[pw] [char](50) NULL,
	[sex] [char](10) NULL,
 CONSTRAINT [PK__users__CBA1B25707020F21] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 10/31/2017 16:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rooms](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_name] [char](99) NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomMembers]    Script Date: 10/31/2017 16:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomMembers](
	[room_member_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_RoomMembers] PRIMARY KEY CLUSTERED 
(
	[room_member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 10/31/2017 16:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Messages](
	[Messages_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[userid] [int] NULL,
	[To_userid] [char](50) NULL,
	[text_content] [char](999) NULL,
	[TimeStamps] [datetime] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Messages_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_RoomMembers_rooms]    Script Date: 10/31/2017 16:16:30 ******/
ALTER TABLE [dbo].[RoomMembers]  WITH CHECK ADD  CONSTRAINT [FK_RoomMembers_rooms] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[RoomMembers] CHECK CONSTRAINT [FK_RoomMembers_rooms]
GO
/****** Object:  ForeignKey [FK_RoomMembers_users]    Script Date: 10/31/2017 16:16:30 ******/
ALTER TABLE [dbo].[RoomMembers]  WITH CHECK ADD  CONSTRAINT [FK_RoomMembers_users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[RoomMembers] CHECK CONSTRAINT [FK_RoomMembers_users]
GO
/****** Object:  ForeignKey [FK_Messages_rooms]    Script Date: 10/31/2017 16:16:30 ******/
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_rooms] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_rooms]
GO
/****** Object:  ForeignKey [FK_Messages_users]    Script Date: 10/31/2017 16:16:30 ******/
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_users]
GO
