USE [master]
GO
/****** Object:  Database [Exam]    Script Date: 11.06.2020 12:25:57 ******/
CREATE DATABASE [Exam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Exam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Exam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Exam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Exam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Exam] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Exam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Exam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Exam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Exam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Exam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Exam] SET ARITHABORT OFF 
GO
ALTER DATABASE [Exam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Exam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Exam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Exam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Exam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Exam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Exam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Exam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Exam] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Exam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Exam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Exam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Exam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Exam] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Exam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Exam] SET RECOVERY FULL 
GO
ALTER DATABASE [Exam] SET  MULTI_USER 
GO
ALTER DATABASE [Exam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Exam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Exam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Exam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Exam] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Exam', N'ON'
GO
ALTER DATABASE [Exam] SET QUERY_STORE = OFF
GO
USE [Exam]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11.06.2020 12:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Demand]    Script Date: 11.06.2020 12:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Surname] [varchar](max) NULL,
	[File] [varchar](max) NULL,
	[Aciklama] [varchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[ReviewDate] [datetime] NULL,
	[State] [bit] NULL,
	[UserId] [int] NULL,
	[AdminAciklama] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Demand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 11.06.2020 12:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_OperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaim]    Script Date: 11.06.2020 12:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
 CONSTRAINT [PK_UserOperationClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.06.2020 12:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Phonenumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200609080007_tst', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200609080049_asdf1', N'2.2.6-servicing-10079')
SET IDENTITY_INSERT [dbo].[Demand] ON 

INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (14, N'asdsad', N'dsadsa', N'C:\fakepath\yapılanlar.txt', N'sadsad', CAST(N'2020-06-10T14:46:08.220' AS DateTime), CAST(N'2020-06-10T15:18:12.043' AS DateTime), 1, 1, N'asdsad', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (15, N'asdsa', N'dsad', N'C:\fakepath\Users.txt', N'sadsad', CAST(N'2020-06-10T15:27:25.260' AS DateTime), CAST(N'2020-06-10T16:00:24.140' AS DateTime), 0, 1, N'asdsadsad', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (16, N'adas', N'dsadsad', N'C:\fakepath\Yeni Metin Belgesi.txt', N'sadsadsad', CAST(N'2020-06-10T16:58:29.647' AS DateTime), CAST(N'2020-06-10T19:19:48.520' AS DateTime), 0, 3, N'123123', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (17, N'asdsadsadas', N'sadsa', N'C:\fakepath\UC-c476fb62-6ab6-47cf-af50-ee0150452e58.jpg', N'asdsad', CAST(N'2020-06-10T17:06:13.047' AS DateTime), CAST(N'2020-06-10T17:11:35.540' AS DateTime), 0, 3, N'sadsadsadsad', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (18, N'asdsadsad', N'sadsad', N'C:\fakepath\UC-c476fb62-6ab6-47cf-af50-ee0150452e58.jpg', N'asdsad', CAST(N'2020-06-10T17:09:32.567' AS DateTime), CAST(N'2020-06-10T19:09:34.320' AS DateTime), 0, 3, N'sadsad', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (19, N'Utku1', N'Demir', N'C:\fakepath\Yeni Metin Belgesi.txt', N'sadsadsa', CAST(N'2020-06-10T17:21:56.063' AS DateTime), CAST(N'2020-06-10T17:23:26.250' AS DateTime), 1, 3, N'olumlu', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (20, N'Utku1', N'Demir', N'C:\fakepath\yapılanlar.txt', N'sadsadasd', CAST(N'2020-06-10T19:17:14.897' AS DateTime), CAST(N'2020-06-10T19:17:44.330' AS DateTime), 1, 3, N'asdsada1212', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (21, N'Utku1', N'Demir', N'C:\fakepath\UC-c476fb62-6ab6-47cf-af50-ee0150452e58.pdf', N'sadadsad13', CAST(N'2020-06-10T19:21:08.947' AS DateTime), CAST(N'2020-06-10T19:21:30.293' AS DateTime), 0, 3, N'14aaa', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (22, N'Utku1', N'Demir', N'C:\fakepath\Yeni Metin Belgesi.txt', N'sfdfdsfdsfds12', CAST(N'2020-06-10T19:33:30.127' AS DateTime), CAST(N'2020-06-10T19:33:48.050' AS DateTime), 1, 3, N'121adsdsdsadsad', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (23, N'Utku1', N'Demir', N'C:\fakepath\yapılanlar.txt', N'sadsadds', CAST(N'2020-06-10T19:35:18.493' AS DateTime), CAST(N'2020-06-10T19:35:36.613' AS DateTime), 1, 3, N'asdsad1313', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (24, N'Utku1', N'Demir', N'C:\fakepath\SILME.txt', N'dsadsad', CAST(N'2020-06-10T19:36:58.053' AS DateTime), CAST(N'2020-06-10T19:37:11.953' AS DateTime), 0, 3, N'121321ewsad', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (25, N'Utku1', N'Demir', N'C:\fakepath\Yeni Metin Belgesi.txt', N'asdsad123', CAST(N'2020-06-10T19:40:44.883' AS DateTime), CAST(N'2020-06-10T19:40:59.983' AS DateTime), 0, 3, N'13esadas', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (26, N'Utku1', N'Demir', N'C:\fakepath\url.html', N'adsdds', CAST(N'2020-06-10T19:43:03.177' AS DateTime), CAST(N'2020-06-10T19:43:20.537' AS DateTime), 1, 3, N'sadasdsada', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (27, N'Utku1', N'Demir', N'C:\fakepath\url.html', N'adsdds123213213', CAST(N'2020-06-10T19:43:06.810' AS DateTime), CAST(N'2020-06-10T19:44:03.600' AS DateTime), 0, 3, N'sadasd23123', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (28, N'Utku1', N'Demir', N'C:\fakepath\Yeni Metin Belgesi.txt', NULL, CAST(N'2020-06-11T11:28:53.483' AS DateTime), CAST(N'2020-06-11T11:28:53.483' AS DateTime), NULL, 3, NULL, 1)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (29, N'Utku1', N'Demir', N'C:\fakepath\Users.txt', N'vcxdfgfdg', CAST(N'2020-06-11T11:29:02.697' AS DateTime), CAST(N'2020-06-11T11:29:58.957' AS DateTime), 0, 3, N'aaa', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (30, N'Utku1', N'Demir', N'C:\fakepath\UC-c476fb62-6ab6-47cf-af50-ee0150452e58.pdf', N'wegsdgsdgs', CAST(N'2020-06-11T11:34:30.993' AS DateTime), NULL, NULL, 3, NULL, 1)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (31, N'Utku1', N'Demir', N'C:\fakepath\yapılanlar.txt', N'', CAST(N'2020-06-11T11:34:36.607' AS DateTime), CAST(N'2020-06-11T12:12:16.997' AS DateTime), 0, 3, N'asdsadsa121212', 0)
INSERT [dbo].[Demand] ([Id], [Name], [Surname], [File], [Aciklama], [CreateDate], [ReviewDate], [State], [UserId], [AdminAciklama], [Active]) VALUES (32, N'asdadaasdsa', N'dsadsa', N'C:\fakepath\yapılanlar.txt', N'adssadsad', CAST(N'2020-06-11T12:22:44.733' AS DateTime), NULL, NULL, 12, NULL, 1)
SET IDENTITY_INSERT [dbo].[Demand] OFF
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
SET IDENTITY_INSERT [dbo].[UserOperationClaim] ON 

INSERT [dbo].[UserOperationClaim] ([Id], [UserId], [OperationClaimId]) VALUES (1, 1, 1)
INSERT [dbo].[UserOperationClaim] ([Id], [UserId], [OperationClaimId]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[UserOperationClaim] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status], [Phonenumber]) VALUES (1, N'Utku', N'Demir', N'utkuudemr@gmail.com', N'123456789', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status], [Phonenumber]) VALUES (3, N'Utku1', N'Demir', N'deneme@hotmail.com', N'123456789', 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status], [Phonenumber]) VALUES (12, N'asdadaasdsa', N'dsadsa', N'fbutku-1997@hotmail.com', N'123456789', 1, N'05315857900')
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [Exam] SET  READ_WRITE 
GO
