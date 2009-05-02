USE [master]
GO
/****** Object:  Database [SportsTracker]    Script Date: 05/02/2009 00:43:01 ******/
CREATE DATABASE [SportsTracker] ON  PRIMARY 
( NAME = N'SportsTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\SportsTracker.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SportsTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\SportsTracker_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SportsTracker] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportsTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportsTracker] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SportsTracker] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SportsTracker] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SportsTracker] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SportsTracker] SET ARITHABORT OFF
GO
ALTER DATABASE [SportsTracker] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SportsTracker] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SportsTracker] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SportsTracker] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SportsTracker] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SportsTracker] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SportsTracker] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SportsTracker] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SportsTracker] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SportsTracker] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SportsTracker] SET  DISABLE_BROKER
GO
ALTER DATABASE [SportsTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SportsTracker] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SportsTracker] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SportsTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SportsTracker] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SportsTracker] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SportsTracker] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SportsTracker] SET  READ_WRITE
GO
ALTER DATABASE [SportsTracker] SET RECOVERY FULL
GO
ALTER DATABASE [SportsTracker] SET  MULTI_USER
GO
ALTER DATABASE [SportsTracker] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SportsTracker] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SportsTracker', N'ON'
GO
USE [SportsTracker]
GO
ALTER TABLE [dbo].[RegisteredUser] DROP CONSTRAINT [DF_RegisteredUser_IsAdmin]
GO
/****** Object:  ForeignKey [FK_League_RegisteredUser]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[League] DROP CONSTRAINT [FK_League_RegisteredUser]
GO
/****** Object:  ForeignKey [FK_League_Sport]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[League] DROP CONSTRAINT [FK_League_Sport]
GO
/****** Object:  ForeignKey [FK_Prediction_Game]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[Prediction] DROP CONSTRAINT [FK_Prediction_Game]
GO
/****** Object:  ForeignKey [FK_Comment_Game]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_Game]
GO
/****** Object:  ForeignKey [FK_Team_League]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[Team] DROP CONSTRAINT [FK_Team_League]
GO
/****** Object:  StoredProcedure [dbo].[GetGameToDisplay]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetGameToDisplay]
GO
/****** Object:  StoredProcedure [dbo].[GetPredictionByGameAndUserID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetPredictionByGameAndUserID]
GO
/****** Object:  StoredProcedure [dbo].[GetTeams]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetTeams]
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsByLeagueID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetTeamsByLeagueID]
GO
/****** Object:  StoredProcedure [dbo].[Team_Delete]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Team_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Team_Insert]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Team_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Team_Select]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Team_Select]
GO
/****** Object:  StoredProcedure [dbo].[Team_Update]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Team_Update]
GO
/****** Object:  StoredProcedure [dbo].[GetScheduleByDateRange]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetScheduleByDateRange]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 05/02/2009 00:43:06 ******/
DROP TABLE [dbo].[Team]
GO
/****** Object:  StoredProcedure [dbo].[GetPredictionResultsByGameID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetPredictionResultsByGameID]
GO
/****** Object:  StoredProcedure [dbo].[GetPredictions]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetPredictions]
GO
/****** Object:  StoredProcedure [dbo].[GetLeagues]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetLeagues]
GO
/****** Object:  StoredProcedure [dbo].[GetLeaguesBySportID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetLeaguesBySportID]
GO
/****** Object:  StoredProcedure [dbo].[GetLeaguesByUserID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetLeaguesByUserID]
GO
/****** Object:  StoredProcedure [dbo].[League_Delete]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[League_Delete]
GO
/****** Object:  StoredProcedure [dbo].[League_Insert]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[League_Insert]
GO
/****** Object:  StoredProcedure [dbo].[League_Select]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[League_Select]
GO
/****** Object:  StoredProcedure [dbo].[League_Update]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[League_Update]
GO
/****** Object:  StoredProcedure [dbo].[Prediction_Delete]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Prediction_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Prediction_Insert]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Prediction_Insert]
GO
/****** Object:  View [dbo].[PredictionResults]    Script Date: 05/02/2009 00:43:06 ******/
DROP VIEW [dbo].[PredictionResults]
GO
/****** Object:  StoredProcedure [dbo].[Comment_Delete]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Comment_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Comment_Insert]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Comment_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Comment_Select]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Comment_Select]
GO
/****** Object:  StoredProcedure [dbo].[Comment_Update]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Comment_Update]
GO
/****** Object:  StoredProcedure [dbo].[GetComments]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetComments]
GO
/****** Object:  StoredProcedure [dbo].[GetCommentsByGameID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetCommentsByGameID]
GO
/****** Object:  StoredProcedure [dbo].[GetCommentsByUserID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetCommentsByUserID]
GO
/****** Object:  StoredProcedure [dbo].[GetGames]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetGames]
GO
/****** Object:  StoredProcedure [dbo].[GetGamesByTeamID]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetGamesByTeamID]
GO
/****** Object:  StoredProcedure [dbo].[Game_Delete]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Game_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Game_Insert]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Game_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Game_Select]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Game_Select]
GO
/****** Object:  StoredProcedure [dbo].[Game_Update]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[Game_Update]
GO
/****** Object:  StoredProcedure [dbo].[AuthorizeUser]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[AuthorizeUser]
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[ChangePassword]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 05/02/2009 00:43:06 ******/
DROP TABLE [dbo].[Comment]
GO
/****** Object:  StoredProcedure [dbo].[CountEmailsRegistered]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[CountEmailsRegistered]
GO
/****** Object:  Table [dbo].[Prediction]    Script Date: 05/02/2009 00:43:06 ******/
DROP TABLE [dbo].[Prediction]
GO
/****** Object:  StoredProcedure [dbo].[GetRegisteredUsers]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetRegisteredUsers]
GO
/****** Object:  Table [dbo].[League]    Script Date: 05/02/2009 00:43:06 ******/
DROP TABLE [dbo].[League]
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Delete]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[RegisteredUser_Delete]
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Insert]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[RegisteredUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Select]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[RegisteredUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Update]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[RegisteredUser_Update]
GO
/****** Object:  StoredProcedure [dbo].[GetSports]    Script Date: 05/02/2009 00:43:06 ******/
DROP PROCEDURE [dbo].[GetSports]
GO
/****** Object:  View [dbo].[TeamRecord]    Script Date: 05/02/2009 00:43:06 ******/
DROP VIEW [dbo].[TeamRecord]
GO
/****** Object:  StoredProcedure [dbo].[Sport_Delete]    Script Date: 05/02/2009 00:43:05 ******/
DROP PROCEDURE [dbo].[Sport_Delete]
GO
/****** Object:  StoredProcedure [dbo].[Sport_Insert]    Script Date: 05/02/2009 00:43:05 ******/
DROP PROCEDURE [dbo].[Sport_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Sport_Select]    Script Date: 05/02/2009 00:43:05 ******/
DROP PROCEDURE [dbo].[Sport_Select]
GO
/****** Object:  StoredProcedure [dbo].[Sport_Update]    Script Date: 05/02/2009 00:43:05 ******/
DROP PROCEDURE [dbo].[Sport_Update]
GO
/****** Object:  Table [dbo].[Sport]    Script Date: 05/02/2009 00:43:03 ******/
DROP TABLE [dbo].[Sport]
GO
/****** Object:  Table [dbo].[RegisteredUser]    Script Date: 05/02/2009 00:43:03 ******/
DROP TABLE [dbo].[RegisteredUser]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 05/02/2009 00:43:03 ******/
DROP TABLE [dbo].[Game]
GO
/****** Object:  User [SportsTracker]    Script Date: 05/02/2009 00:43:01 ******/
DROP USER [SportsTracker]
GO
/****** Object:  User [SportsTracker]    Script Date: 05/02/2009 00:43:01 ******/
CREATE USER [SportsTracker] FOR LOGIN [SportsTracker] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 05/02/2009 00:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HomeTeamID] [int] NOT NULL,
	[AwayTeamID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[HomeScore] [int] NULL,
	[AwayScore] [int] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Game] ON
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (3, 7, 8, CAST(0x00009BF1013A7BD0 AS DateTime), 60, 45)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (4, 16, 14, CAST(0x00009BFC00EA0240 AS DateTime), 4, 20)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (6, 15, 17, CAST(0x00009C1700C6DA40 AS DateTime), 0, 0)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (7, 15, 16, CAST(0x00009C1701090B90 AS DateTime), 0, 0)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (8, 26, 25, CAST(0x00009BFC013A7BD0 AS DateTime), 26, 5)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (9, 36, 35, CAST(0x00009BFC013A7BD0 AS DateTime), 4, 7)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (10, 21, 126, CAST(0x00009BFC013A7BD0 AS DateTime), 9, 29)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (11, 35, 43, CAST(0x00009BFC013A7BD0 AS DateTime), 28, 26)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (12, 42, 39, CAST(0x00009BFC013A7BD0 AS DateTime), 30, 22)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (13, 23, 19, CAST(0x00009BFC013B0870 AS DateTime), 5, 12)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (14, 33, 40, CAST(0x00009BFC014159A0 AS DateTime), 27, 16)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (15, 22, 20, CAST(0x00009BFC01438C20 AS DateTime), 19, 15)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (16, 41, 44, CAST(0x00009BFC014AF690 AS DateTime), 13, 7)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (17, 31, 38, CAST(0x00009BFC014AF690 AS DateTime), 7, 16)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (18, 28, 27, CAST(0x00009BFC014C5620 AS DateTime), 23, 22)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (19, 47, 29, CAST(0x00009BFC014C5620 AS DateTime), 30, 0)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (20, 46, 47, CAST(0x00009BFC016D4BA0 AS DateTime), 15, 25)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (21, 48, 45, CAST(0x00009BFC016EAB30 AS DateTime), 28, 10)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (22, 39, 33, CAST(0x00009BF700000000 AS DateTime), 8, 2)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (23, 39, 40, CAST(0x00009BF800000000 AS DateTime), 1, 4)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (24, 39, 40, CAST(0x00009BF900000000 AS DateTime), 3, 8)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (25, 39, 40, CAST(0x00009BFA00000000 AS DateTime), 3, 0)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (26, 31, 29, CAST(0x00009BFB00000000 AS DateTime), 2, 4)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (27, 42, 39, CAST(0x00009BFC00000000 AS DateTime), 0, 4)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (28, 40, 39, CAST(0x00009BF100000000 AS DateTime), 3, 4)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (29, 38, 39, CAST(0x00009BF200000000 AS DateTime), 7, 2)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (30, 40, 46, CAST(0x00009BF200000000 AS DateTime), 8, 5)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (31, 38, 39, CAST(0x00009BF300000000 AS DateTime), 0, 3)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (32, 40, 46, CAST(0x00009BF300000000 AS DateTime), 6, 5)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (33, 38, 39, CAST(0x00009BF400000000 AS DateTime), 1, 7)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (34, 40, 46, CAST(0x00009BF400000000 AS DateTime), 0, 2)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (35, 39, 33, CAST(0x00009BF500000000 AS DateTime), 3, 4)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (36, 40, 41, CAST(0x00009BF500000000 AS DateTime), 2, 5)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (37, 39, 33, CAST(0x00009BF600000000 AS DateTime), 2, 10)
INSERT [dbo].[Game] ([ID], [HomeTeamID], [AwayTeamID], [Date], [HomeScore], [AwayScore]) VALUES (38, 40, 41, CAST(0x00009BF500000000 AS DateTime), 8, 9)
SET IDENTITY_INSERT [dbo].[Game] OFF
/****** Object:  Table [dbo].[RegisteredUser]    Script Date: 05/02/2009 00:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_RegisteredUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RegisteredUser] ON
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (2, N'asdf@asdf.com', N'asdf', N'asdf', N'4ef578d295a1859c6ab72b2e77521556', 1)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (3, N'jkl@jkl.com', N'jkl', N'jkl', N'699a474e923b8da5d7aefbfc54a8a2bd', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (4, N'1234', N'1234 1234', N'1234', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (7, N'christian_cox50@eku.edu', N'Christian', N'Cox', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (8, N'phitaucox@gmail.com', N'Steven', N'Stevey', N'81dc9bdb52d04dc20036dbd8313ed055', 1)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (9, N'wahwah@jones.com', N'Wah Wah', N'Jones', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (10, N'wally@world.com', N'Wally', N'World', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (11, N'pen@pens.com', N'Pen', N'Pens', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (12, N'bada@bing.com', N'Bada', N'Bing', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (13, N'occas@ional.com', N'Occas', N'Ional', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (14, N'wal@mart.com', N'Wal', N'Mart', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (15, N'sorry@goodbye.com', N'Sorry', N'Goodby', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (16, N'youcant@stopme.com', N'Youcant', N'Stopme', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (17, N'whoa@whoa.com', N'Whoa', N'Whoa', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (18, N'drop@zone.com', N'Drop', N'Zone', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (19, N'data@base.com', N'Data', N'Base', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[RegisteredUser] ([ID], [Email], [FirstName], [LastName], [Password], [IsAdmin]) VALUES (20, N'sam@frodo.com', N'Sam', N'Frodo', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
SET IDENTITY_INSERT [dbo].[RegisteredUser] OFF
/****** Object:  Table [dbo].[Sport]    Script Date: 05/02/2009 00:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Sport] ON
INSERT [dbo].[Sport] ([ID], [Name]) VALUES (1, N'Basketball')
INSERT [dbo].[Sport] ([ID], [Name]) VALUES (2, N'Baseball')
INSERT [dbo].[Sport] ([ID], [Name]) VALUES (3, N'Soccer')
INSERT [dbo].[Sport] ([ID], [Name]) VALUES (4, N'Football')
INSERT [dbo].[Sport] ([ID], [Name]) VALUES (5, N'Tennis')
INSERT [dbo].[Sport] ([ID], [Name]) VALUES (6, N'Cricket')
INSERT [dbo].[Sport] ([ID], [Name]) VALUES (7, N'Foosball')
SET IDENTITY_INSERT [dbo].[Sport] OFF
/****** Object:  StoredProcedure [dbo].[Sport_Update]    Script Date: 05/02/2009 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sport_Update] (
	@ID int=null,
	@Name nvarchar(50)=null
) AS

	SET NOCOUNT ON

	UPDATE [Sport]
	SET
	[Name] = @Name
	WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Sport_Select]    Script Date: 05/02/2009 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sport_Select] (@ID int) AS 

	SET NOCOUNT ON

	SELECT * FROM [Sport] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Sport_Insert]    Script Date: 05/02/2009 00:43:05 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sport_Insert] (
	@Name nvarchar(50)=null
) AS 

	SET NOCOUNT ON

	INSERT INTO [Sport] 
	(
	[Name]
	)
	VALUES
	(
	@Name
	)
GO
/****** Object:  StoredProcedure [dbo].[Sport_Delete]    Script Date: 05/02/2009 00:43:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sport_Delete] (@ID int) AS 


	SET NOCOUNT ON

	DELETE FROM [Sport] WHERE [ID] = @ID
GO
/****** Object:  View [dbo].[TeamRecord]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TeamRecord]
AS
SELECT     TeamID, Wins, Losses, Wins + Losses AS GamesPlayed, CAST(Wins AS FLOAT) / (Wins + Losses) AS WinningPercentage
FROM         (SELECT     ISNULL(WinRecord.TeamID, LossRecord.TeamID) AS TeamID, ISNULL(WinRecord.Wins, 0) AS Wins, ISNULL(LossRecord.Losses, 0) AS Losses
                       FROM          (SELECT     TeamID, SUM(Wins) AS Wins
                                               FROM          (SELECT     HomeTeamID AS TeamID, COUNT(*) AS Wins
                                                                       FROM          dbo.Game
                                                                       WHERE      (HomeScore > AwayScore)
                                                                       GROUP BY HomeTeamID
                                                                       UNION
                                                                       SELECT     AwayTeamID AS TeamID, COUNT(*) AS Wins
                                                                       FROM         dbo.Game AS Game_3
                                                                       WHERE     (AwayScore > HomeScore)
                                                                       GROUP BY AwayTeamID) AS WinRecord_1
                                               GROUP BY TeamID) AS WinRecord LEFT OUTER JOIN
                                                  (SELECT     TeamID, SUM(Losses) AS Losses
                                                    FROM          (SELECT     HomeTeamID AS TeamID, COUNT(*) AS Losses
                                                                            FROM          dbo.Game AS Game_2
                                                                            WHERE      (HomeScore < AwayScore)
                                                                            GROUP BY HomeTeamID
                                                                            UNION
                                                                            SELECT     AwayTeamID AS TeamID, COUNT(*) AS Losses
                                                                            FROM         dbo.Game AS Game_1
                                                                            WHERE     (AwayScore < HomeScore)
                                                                            GROUP BY AwayTeamID) AS LossRecord_1
                                                    GROUP BY TeamID) AS LossRecord ON WinRecord.TeamID = LossRecord.TeamID) AS TeamRecord_1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[14] 4[14] 2[53] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TeamRecord_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 108
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TeamRecord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TeamRecord'
GO
/****** Object:  StoredProcedure [dbo].[GetSports]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetSports] AS

	SET NOCOUNT ON

	SELECT * FROM [Sport]
	ORDER BY Name
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Update]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[RegisteredUser_Update] (
	@ID int=null,
	@Email nvarchar(100)=null,
	@FirstName nvarchar(50)=null,
	@LastName nvarchar(50)=null,
	@Password nvarchar(50)=null,
	@IsAdmin bit=null
) AS

	SET NOCOUNT ON

	UPDATE [RegisteredUser]
	SET
	[Email] = @Email,
	[FirstName] = @FirstName,
	[LastName] = @LastName,
	[Password] = @Password,
	[IsAdmin] = @IsAdmin
	WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Select]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisteredUser_Select] (@ID int) AS 

	SET NOCOUNT ON

	SELECT * FROM [RegisteredUser] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Insert]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[RegisteredUser_Insert] (
	@Email nvarchar(100)=null,
	@FirstName nvarchar(50)=null,
	@LastName nvarchar(50)=null,
	@Password nvarchar(50)=null,
	@IsAdmin bit=null
) AS 

	SET NOCOUNT ON

	INSERT INTO [RegisteredUser] 
	(
		[Email],
		[FirstName],
		[LastName],
		[Password],
		[IsAdmin]
	)
	VALUES
	(
		@Email,
		@FirstName,
		@LastName,
		@Password,
		@IsAdmin
	)
GO
/****** Object:  StoredProcedure [dbo].[RegisteredUser_Delete]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisteredUser_Delete] (@ID int) AS 


	SET NOCOUNT ON

	DELETE FROM [RegisteredUser] WHERE [ID] = @ID
GO
/****** Object:  Table [dbo].[League]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[League](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SportID] [int] NOT NULL,
	[RegisteredUserID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_League] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[League] ON
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (1, 1, 2, N'NBA')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (3, 1, 2, N'NCAA - Men')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (5, 2, 2, N'MLB')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (8, 5, 2, N'ATP')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (10, 1, 2, N'NCAA - Women')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (11, 6, 2, N'ICL')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (12, 3, 2, N'MLS')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (13, 4, 2, N'NFL')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (15, 7, 4, N'South District A')
INSERT [dbo].[League] ([ID], [SportID], [RegisteredUserID], [Name]) VALUES (16, 2, 4, N'North District')
SET IDENTITY_INSERT [dbo].[League] OFF
/****** Object:  StoredProcedure [dbo].[GetRegisteredUsers]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetRegisteredUsers] AS

	SET NOCOUNT ON

	SELECT * FROM [RegisteredUser]
GO
/****** Object:  Table [dbo].[Prediction]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prediction](
	[GameID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_Prediction] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (3, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (4, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 28, 39)
GO
print 'Processed 100 total records'
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (7, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (8, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (9, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 18, 28)
GO
print 'Processed 200 total records'
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (10, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (11, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (12, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 8, 25)
GO
print 'Processed 300 total records'
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (13, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (14, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 35, 33)
GO
print 'Processed 400 total records'
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (15, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (16, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (17, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 25, 39)
GO
print 'Processed 500 total records'
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (18, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (19, 38, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 1, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 2, 2)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 3, 8)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 4, 14)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 6, 17)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 7, 16)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 8, 25)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 9, 36)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 10, 21)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 11, 35)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 12, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 13, 19)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 14, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 15, 22)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 16, 44)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 17, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 18, 28)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 19, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 20, 47)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 21, 48)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 22, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 23, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 24, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 25, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 26, 31)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 27, 42)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 28, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 29, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 30, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 31, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 32, 46)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 33, 38)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 34, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 35, 33)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 36, 40)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 37, 39)
INSERT [dbo].[Prediction] ([GameID], [UserID], [TeamID]) VALUES (20, 38, 40)
/****** Object:  StoredProcedure [dbo].[CountEmailsRegistered]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountEmailsRegistered]
(  
	@Email nvarchar(100)
)
AS
	SET NOCOUNT ON
	
	SELECT COUNT(*) UsersFoundWithEmailAddress
	FROM [RegisteredUser]
	WHERE Email = @Email
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[Type] [smallint] NULL,
	[Timestamp] [datetime] NOT NULL,
	[Text] [nvarchar](300) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ChangePassword]
(  
	@Email nvarchar(100),
	@Password nvarchar(50)
)
AS

	SET NOCOUNT ON

	UPDATE [RegisteredUser]
	SET [Password] = @Password
	WHERE Email = @Email
GO
/****** Object:  StoredProcedure [dbo].[AuthorizeUser]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[AuthorizeUser]
(  
	@Email nvarchar(100),
	@Password nvarchar(50)
)
AS

	SET NOCOUNT ON

	SELECT * FROM [RegisteredUser]
	WHERE Email = @Email
		AND [Password] = @Password
GO
/****** Object:  StoredProcedure [dbo].[Game_Update]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Game_Update] (
	@ID int=null,
	@HomeTeamID int=null,
	@AwayTeamID int=null,
	@Date datetime=null,
	@HomeScore int=null,
	@AwayScore int=null
) AS

	SET NOCOUNT ON

	UPDATE [Game]
	SET
	[HomeTeamID] = @HomeTeamID,
	[AwayTeamID] = @AwayTeamID,
	[Date] = @Date,
	[HomeScore] = @HomeScore,
	[AwayScore] = @AwayScore
	WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Game_Select]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Game_Select] (@ID int) AS 

	SET NOCOUNT ON

	SELECT * FROM [Game] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Game_Insert]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Game_Insert] (
	@HomeTeamID int=null,
	@AwayTeamID int=null,
	@Date datetime=null,
	@HomeScore int=null,
	@AwayScore int=null
) AS 

	SET NOCOUNT ON

	INSERT INTO [Game] 
	(
	[HomeTeamID],
	[AwayTeamID],
	[Date],
	[HomeScore],
	[AwayScore]
	)
	VALUES
	(
	@HomeTeamID,
	@AwayTeamID,
	@Date,
	@HomeScore,
	@AwayScore
	)
GO
/****** Object:  StoredProcedure [dbo].[Game_Delete]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Game_Delete] (@ID int) AS 


	SET NOCOUNT ON

	DELETE FROM [Game] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetGamesByTeamID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGamesByTeamID]
( @TeamID int, @HomeOnly bit = 0, @AwayOnly bit = 0)
AS

	SET NOCOUNT ON

	SELECT *
	FROM [Game]
	WHERE (HomeTeamID = @TeamID AND @AwayOnly != 1)
		OR (AwayTeamID = @TeamID AND @HomeOnly != 1)
GO
/****** Object:  StoredProcedure [dbo].[GetGames]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGames] AS

	SET NOCOUNT ON

	SELECT * FROM [Game]
GO
/****** Object:  StoredProcedure [dbo].[GetCommentsByUserID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCommentsByUserID]
( @UserID int )
 AS

	SET NOCOUNT ON

	SELECT * FROM [Comment] WHERE UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetCommentsByGameID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetCommentsByGameID]
( @GameID int )
 AS

	SET NOCOUNT ON

	SELECT RegisteredUser.FirstName, Comment.ID AS CommentID, Comment.Type, Comment.Timestamp, Comment.Text
	FROM Comment
		JOIN RegisteredUser ON Comment.UserID = RegisteredUser.ID
	WHERE GameID = @GameID
GO
/****** Object:  StoredProcedure [dbo].[GetComments]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetComments] AS

	SET NOCOUNT ON

	SELECT * FROM [Comment]
GO
/****** Object:  StoredProcedure [dbo].[Comment_Update]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Comment_Update] (
	@ID int=null,
	@UserID int=null,
	@GameID int=null,
	@Type smallint=null,
	@Timestamp datetime=null,
	@Text nvarchar(1000)=null
) AS

	SET NOCOUNT ON

	UPDATE [Comment]
	SET [UserID] = @UserID,
		[GameID] = @GameID,
		[Type] = @Type,
		[Timestamp] = @Timestamp,
		[Text] = @Text
	WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Comment_Select]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comment_Select] (@ID int) AS 

	SET NOCOUNT ON

	SELECT * FROM [Comment] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Comment_Insert]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Comment_Insert] (
	@UserID int=null,
	@GameID int=null,
	@Type smallint=null,
	@Timestamp datetime=null,
	@Text nvarchar(1000)=null
) AS 

	SET NOCOUNT ON

	INSERT INTO [Comment] 
	(
		[UserID],
		[GameID],
		[Type],
		[Timestamp],
		[Text]
	)
	VALUES
	(
		@UserID,
		@GameID,
		@Type,
		@Timestamp,
		@Text
	)
GO
/****** Object:  StoredProcedure [dbo].[Comment_Delete]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comment_Delete] (@ID int) AS 


	SET NOCOUNT ON

	DELETE FROM [Comment] WHERE [ID] = @ID
GO
/****** Object:  View [dbo].[PredictionResults]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PredictionResults]
AS
SELECT     TeamID, COUNT(*) AS Votes
FROM         dbo.Prediction
GROUP BY TeamID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Prediction"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 246
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PredictionResults'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PredictionResults'
GO
/****** Object:  StoredProcedure [dbo].[Prediction_Insert]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Prediction_Insert] (
	@GameID int=null,
	@UserID int=null,
	@TeamID int=null
) AS 

	SET NOCOUNT ON

	INSERT INTO [Prediction] 
	(
		[GameID],
	[UserID],
	[TeamID]
	)
	VALUES
	(
		@GameID,
	@UserID,
	@TeamID
	)
GO
/****** Object:  StoredProcedure [dbo].[Prediction_Delete]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Prediction_Delete] (
	@GameID int=null,
	@UserID int=null,
	@TeamID int=null
) AS 

	SET NOCOUNT ON

	DELETE FROM [Prediction]  WHERE GameID=@GameID AND UserID=@UserID AND TeamID=@TeamID
GO
/****** Object:  StoredProcedure [dbo].[League_Update]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[League_Update] (
	@ID int=null,
	@SportID int=null,
	@RegisteredUserID int=null,
	@Name nvarchar(50)=null
) AS

	SET NOCOUNT ON

	UPDATE [League]
	SET
	[SportID] = @SportID,
	[RegisteredUserID] = @RegisteredUserID,
	[Name] = @Name
	WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[League_Select]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[League_Select] (@ID int) AS 

	SET NOCOUNT ON

	SELECT * FROM [League] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[League_Insert]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[League_Insert] (
	@SportID int=null,
	@RegisteredUserID int=null,
	@Name nvarchar(50)=null
) AS 

	SET NOCOUNT ON

	INSERT INTO [League] 
	(
	[SportID],
	[RegisteredUserID],
	[Name]
	)
	VALUES
	(
	@SportID,
	@RegisteredUserID,
	@Name
	)
GO
/****** Object:  StoredProcedure [dbo].[League_Delete]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[League_Delete] (@ID int) AS 


	SET NOCOUNT ON

	DELETE FROM [League] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetLeaguesByUserID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetLeaguesByUserID]
( @UserID int)
AS

	SET NOCOUNT ON

	SELECT *
	FROM [League]
	WHERE RegisteredUserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetLeaguesBySportID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetLeaguesBySportID]
(
	@SportID int 
)
 AS

	SET NOCOUNT ON

	SELECT * FROM League
	WHERE SportID = @SportID
	ORDER BY Name
GO
/****** Object:  StoredProcedure [dbo].[GetLeagues]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetLeagues] AS

	SET NOCOUNT ON

	SELECT * FROM [League]
GO
/****** Object:  StoredProcedure [dbo].[GetPredictions]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPredictions] AS

	SET NOCOUNT ON

	SELECT * FROM [Prediction]
GO
/****** Object:  StoredProcedure [dbo].[GetPredictionResultsByGameID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetPredictionResultsByGameID]
( @GameID int )
AS

	SET NOCOUNT ON

	SELECT TeamID, COUNT(*) AS Vote
	FROM [Prediction]
	WHERE GameID = @GameID
	GROUP BY TeamID
GO
/****** Object:  Table [dbo].[Team]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LeagueID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Team] ON
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (7, 3, N'Kentucky Wildcats')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (8, 3, N'Duke Blue Devils')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (11, 11, N'Team B')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (12, 11, N'Team C')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (13, 16, N'DDJA - South')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (14, 15, N'Pirates')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (15, 15, N'Legends')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (16, 15, N'Mints')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (17, 15, N'DDJA - B')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (19, 5, N'Baltimore Orioles')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (20, 5, N'Boston Red Sox')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (21, 5, N'New York Yankees')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (22, 5, N'Tampa Bay Rays')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (23, 5, N'Toronto Blue Jays')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (24, 5, N'Chicago White Sox')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (25, 5, N'Cleveland Indians')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (26, 5, N'Detroit Tigers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (27, 5, N'Kansas City Royals')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (28, 5, N'Minnesota Twins')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (29, 5, N'Oakland Athletics')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (30, 5, N'Seattle Mariners')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (31, 5, N'Texas Rangers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (33, 5, N'Atlanta Braves')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (34, 5, N'Florida Marlins')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (35, 5, N'New York Mets')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (36, 5, N'Philadelphia Phillies')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (37, 5, N'Washington Nationals')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (38, 5, N'Chicago Cubs')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (39, 5, N'Cincinnati Reds')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (40, 5, N'Houston Astros')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (41, 5, N'Milwaukee Brewers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (42, 5, N'Pittsburgh Pirates')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (43, 5, N'St. Louis Cardinals')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (44, 5, N'Arizona Diamondbacks')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (45, 5, N'Colorado Rockies')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (46, 5, N'Los Angeles Dodgers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (47, 5, N'San Diego Padres')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (48, 5, N'San Francisco Giants')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (49, 1, N'Boston Celtics')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (50, 1, N'New Jersey Nets')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (51, 1, N'New York Knicks')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (52, 1, N'Philadelphia 76ers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (53, 1, N'Toronto Raptors')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (54, 1, N'Chicago Bulls')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (55, 1, N'Cleveland Cavaliers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (56, 1, N'Detroit Pistons')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (57, 1, N'Indiana Pacers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (58, 1, N'Milwaukee Bucks')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (59, 1, N'Atlanta Hawks')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (60, 1, N'Charlotte Bobcats')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (61, 1, N'Miami Heat')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (62, 1, N'Orlando Magic')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (63, 1, N'Washington Wizards')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (64, 1, N'Dallas Mavericks')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (65, 1, N'Houston Rockets')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (66, 1, N'Memphis Grizzlies')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (67, 1, N'New Orleans Hornets')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (68, 1, N'San Antonio Spurs')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (69, 1, N'Golden State Warriors')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (70, 1, N'Los Angeles Clippers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (71, 1, N'Los Angeles Lakers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (72, 1, N'Phoenix Suns')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (73, 1, N'Sacramento Kings')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (74, 1, N'Denver Nuggets')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (75, 1, N'Minnesota Timberwolves')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (76, 1, N'Portland Trail Blazers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (77, 1, N'Oklahoma City Thunder')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (78, 1, N'Utah Jazz')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (79, 13, N'Buffalo Bills')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (80, 13, N'Miami Dolphins')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (81, 13, N'New England Patriots')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (82, 13, N'New York Jets')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (83, 13, N'Baltimore Ravens')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (84, 13, N'Cincinnati Bengals')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (85, 13, N'Cleveland Browns')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (86, 13, N'Pittsburgh Steelers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (87, 13, N'Houston Texans')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (88, 13, N'Indianapolis Colts')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (89, 13, N'Jacksonville Jaguars')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (90, 13, N'Tennessee Titans')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (91, 13, N'Denver Broncos')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (92, 13, N'Kansas City Chiefs')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (93, 13, N'Oakland Raiders')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (94, 13, N'San Diego Chargers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (95, 13, N'Dallas Cowboys')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (96, 13, N'New York Giants')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (97, 13, N'Philadelphia Eagles')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (98, 13, N'Washington Redskins')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (99, 13, N'Chicago Bears')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (100, 13, N'Detroit Lions')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (101, 13, N'Green Bay Packers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (102, 13, N'Minnesota Vikings')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (103, 13, N'Atlanta Falcons')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (104, 13, N'Carolina Panthers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (105, 13, N'New Orleans Saints')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (106, 13, N'Tampa Bay Buccaneers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (107, 13, N'Arizona Cardinals')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (108, 13, N'St. Louis Rams')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (109, 13, N'San Francisco 49ers')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (110, 13, N'Seattle Seahawks')
GO
print 'Processed 100 total records'
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (111, 12, N'Chicago Fire')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (112, 12, N'Columbus Crew')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (113, 12, N'D.C. United')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (114, 12, N'Kansas City Wizards')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (115, 12, N'New England Revolution')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (116, 12, N'New York Red Bulls')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (117, 12, N'Toronto FC')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (118, 12, N'Chivas USA')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (119, 12, N'Colorado Rapids')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (120, 12, N'FC Dallas')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (121, 12, N'Houston Dynamo')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (122, 12, N'Los Angeles Galaxy')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (123, 12, N'Real Salt Lake')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (124, 12, N'San Jose Earthquakes')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (125, 12, N'Seattle Sounders FC')
INSERT [dbo].[Team] ([ID], [LeagueID], [Name]) VALUES (126, 5, N'LA Angels')
SET IDENTITY_INSERT [dbo].[Team] OFF
/****** Object:  StoredProcedure [dbo].[GetScheduleByDateRange]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetScheduleByDateRange]
(
	@LeagueID INT,
	@From DATE,
	@To DATE
)
 AS

	SET NOCOUNT ON

	SELECT Game.ID AS GameID, Game.Date, awayTeam.Name AS AwayTeam, homeTeam.Name AS HomeTeam
	FROM Game
		JOIN Team awayTeam ON awayTeam.ID = Game.AwayTeamID
		JOIN Team homeTeam ON homeTeam.ID = Game.HomeTeamID
	WHERE homeTeam.LeagueID = @LeagueID
		AND [Date] >= @From AND [Date] <= @To
	ORDER BY [Date]
GO
/****** Object:  StoredProcedure [dbo].[Team_Update]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Team_Update] (
	@ID int=null,
	@LeagueID int=null,
	@Name nvarchar(100)=null
) AS

	SET NOCOUNT ON

	UPDATE [Team]
	SET
	[LeagueID] = @LeagueID,
	[Name] = @Name
	WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Team_Select]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Team_Select] (@ID int) AS 

	SET NOCOUNT ON

	SELECT * FROM [Team] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[Team_Insert]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Team_Insert] (
	@LeagueID int=null,
	@Name nvarchar(100)=null
) AS 

	SET NOCOUNT ON

	INSERT INTO [Team] 
	(
	[LeagueID],
	[Name]
	)
	VALUES
	(
	@LeagueID,
	@Name
	)
GO
/****** Object:  StoredProcedure [dbo].[Team_Delete]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Team_Delete] (@ID int) AS 


	SET NOCOUNT ON

	DELETE FROM [Team] WHERE [ID] = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsByLeagueID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTeamsByLeagueID]
( @LeagueID int )
 AS

	SET NOCOUNT ON

	SELECT * FROM [Team]
	WHERE LeagueID = @LeagueID
	ORDER BY Name
GO
/****** Object:  StoredProcedure [dbo].[GetTeams]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetTeams] AS

	SET NOCOUNT ON

	SELECT * FROM [Team]
GO
/****** Object:  StoredProcedure [dbo].[GetPredictionByGameAndUserID]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPredictionByGameAndUserID]
(  
	@GameID int,
	@UserID int
)
AS
	SET NOCOUNT ON
	
	SELECT Team.Name
	FROM Prediction 
		JOIN Team on Prediction.TeamID = Team.ID
	WHERE Prediction.GameID = @GameID
		AND Prediction.UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetGameToDisplay]    Script Date: 05/02/2009 00:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetGameToDisplay]
( @GameID int )
 AS

	SET NOCOUNT ON

	SELECT Game.Date GameDate, AwayTeam.Name AwayTeam, HomeTeam.Name HomeTeam, Game.AwayScore, Game.HomeScore,
			AwayTeamVotes.Votes AwayTeamVotes, HomeTeamVotes.Votes HomeTeamVotes,
			AwayRecord.Wins AwayWins, HomeRecord.Losses AwayLosses, AwayRecord.WinningPercentage AwayWinningPercentage,
			HomeRecord.Wins HomeWins, HomeRecord.Losses HomeLosses, HomeRecord.WinningPercentage HomeWinningPercentage
	FROM Game
		JOIN Team AwayTeam ON Game.AwayTeamID = AwayTeam.ID
		JOIN Team HomeTeam ON Game.HomeTeamID = HomeTeam.ID
		LEFT JOIN PredictionResults AwayTeamVotes ON AwayTeamVotes.TeamID = AwayTeam.ID
		LEFT JOIN PredictionResults HomeTeamVotes ON HomeTeamVotes.TeamID = HomeTeam.ID
		LEFT JOIN TeamRecord AwayRecord ON AwayRecord.TeamID = AwayTeam.ID
		LEFT JOIN TeamRecord HomeRecord ON HomeRecord.TeamID = HomeTeam.ID
	WHERE Game.ID = @GameID
GO
/****** Object:  Default [DF_RegisteredUser_IsAdmin]    Script Date: 05/02/2009 00:43:03 ******/
ALTER TABLE [dbo].[RegisteredUser] ADD  CONSTRAINT [DF_RegisteredUser_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
/****** Object:  ForeignKey [FK_League_RegisteredUser]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[League]  WITH CHECK ADD  CONSTRAINT [FK_League_RegisteredUser] FOREIGN KEY([RegisteredUserID])
REFERENCES [dbo].[RegisteredUser] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[League] CHECK CONSTRAINT [FK_League_RegisteredUser]
GO
/****** Object:  ForeignKey [FK_League_Sport]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[League]  WITH CHECK ADD  CONSTRAINT [FK_League_Sport] FOREIGN KEY([SportID])
REFERENCES [dbo].[Sport] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[League] CHECK CONSTRAINT [FK_League_Sport]
GO
/****** Object:  ForeignKey [FK_Prediction_Game]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[Prediction]  WITH CHECK ADD  CONSTRAINT [FK_Prediction_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([ID])
GO
ALTER TABLE [dbo].[Prediction] CHECK CONSTRAINT [FK_Prediction_Game]
GO
/****** Object:  ForeignKey [FK_Comment_Game]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Game]
GO
/****** Object:  ForeignKey [FK_Team_League]    Script Date: 05/02/2009 00:43:06 ******/
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_League] FOREIGN KEY([LeagueID])
REFERENCES [dbo].[League] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_League]
GO
