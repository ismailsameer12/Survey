USE [master]
GO
/****** Object:  Database [EventSurvey]    Script Date: 12/28/2018 6:39:53 PM ******/
CREATE DATABASE [EventSurvey]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventSurvey', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EventSurvey.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EventSurvey_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EventSurvey_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EventSurvey] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventSurvey].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventSurvey] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventSurvey] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventSurvey] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventSurvey] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventSurvey] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventSurvey] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventSurvey] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventSurvey] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventSurvey] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventSurvey] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventSurvey] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventSurvey] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventSurvey] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventSurvey] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventSurvey] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventSurvey] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventSurvey] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventSurvey] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventSurvey] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventSurvey] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventSurvey] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventSurvey] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventSurvey] SET RECOVERY FULL 
GO
ALTER DATABASE [EventSurvey] SET  MULTI_USER 
GO
ALTER DATABASE [EventSurvey] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventSurvey] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventSurvey] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventSurvey] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EventSurvey] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EventSurvey', N'ON'
GO
USE [EventSurvey]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 12/28/2018 6:39:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SurveyId] [bigint] NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[ChoiceId] [bigint] NULL,
	[AnswerDescription] [varchar](max) NULL,
	[AnsweredById] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 12/28/2018 6:39:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Choice](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionId] [bigint] NOT NULL,
	[ChoiceDescription] [varchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 12/28/2018 6:39:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SurveyId] [bigint] NOT NULL,
	[QuestionTypeId] [bigint] NOT NULL,
	[QuestionDescription] [varchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 12/28/2018 6:39:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/28/2018 6:39:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](20) NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 12/28/2018 6:39:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Survey](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[IsMailSent] [bit] NULL CONSTRAINT [DF_Survey_IsMailSent]  DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/28/2018 6:39:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[Username] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ConfirmPassword] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (12, 24, 48, NULL, N'Sameer', 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (13, 28, 52, NULL, N'Naren', 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (14, 28, 53, 30, NULL, 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (15, 28, 54, 32, NULL, 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (16, 28, 55, 34, NULL, 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (17, 27, 51, NULL, N'sameer', 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (18, 29, 56, NULL, N'kali', 16, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (19, 29, 57, 36, NULL, 16, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (20, 29, 58, 38, NULL, 16, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (21, 29, 56, NULL, N'Naren', 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (22, 29, 57, 36, NULL, 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (23, 29, 58, 39, NULL, 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (24, 30, 59, 40, NULL, 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (25, 32, 62, NULL, N'Samee', 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (26, 32, 63, 44, NULL, 5, 0)
INSERT [dbo].[Answer] ([ID], [SurveyId], [QuestionId], [ChoiceId], [AnswerDescription], [AnsweredById], [IsDeleted]) VALUES (27, 32, 64, 46, NULL, 5, 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Choice] ON 

INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (17, 42, N'Male', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (18, 42, N'Female', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (19, 43, N'Biriyani', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (20, 43, N'Meals', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (21, 43, N'Fried Rice', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (22, 44, N'Chennai', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (23, 44, N'Madurai', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (24, 46, N'Yes', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (25, 46, N'No', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (26, 47, N'yes', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (27, 47, N'no', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (28, 49, N'Veg', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (29, 49, N'Non Veg', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (30, 53, N'Male', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (31, 53, N'Female', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (32, 54, N'Biriani', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (33, 54, N'Meals', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (34, 55, N'Chennai', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (35, 55, N'Madurai', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (36, 57, N'Programmer', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (37, 57, N'Designer', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (38, 58, N'ej Grid', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (39, 58, N'ej DashBoard', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (40, 59, N'Male', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (41, 59, N'Female', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (42, 61, N'Food', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (43, 61, N'Playing', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (44, 63, N'Male', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (45, 63, N'Female', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (46, 64, N'Meals', 0)
INSERT [dbo].[Choice] ([ID], [QuestionId], [ChoiceDescription], [IsDeleted]) VALUES (47, 64, N'Fried Rice', 0)
SET IDENTITY_INSERT [dbo].[Choice] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (41, 20, 1, N'Fill Name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (42, 20, 3, N'Gender', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (43, 20, 4, N'Favorite Food', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (44, 20, 5, N'Location', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (45, 22, 1, N'name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (46, 23, 4, N'Are you Vegetarian?', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (47, 23, 5, N'Are you diabetic?', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (48, 24, 1, N'Fill Name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (49, 24, 3, N'Select Food', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (50, 26, 1, N'Name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (51, 27, 1, N'Name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (52, 28, 1, N'Fill Name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (53, 28, 3, N'Gender', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (54, 28, 4, N'Fav Food', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (55, 28, 5, N'Place', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (56, 29, 1, N'Fill Name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (57, 29, 3, N'Profession', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (58, 29, 4, N'Fav controls', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (59, 30, 4, N'Gender', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (60, 31, 1, N'What is your name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (61, 31, 3, N'Select your favorite', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (62, 32, 1, N'Fill Name', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (63, 32, 3, N'Gender', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionTypeId], [QuestionDescription], [IsDeleted]) VALUES (64, 32, 4, N'Fav Food', 0)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionType] ON 

INSERT [dbo].[QuestionType] ([Id], [Type], [IsDeleted]) VALUES (1, N'Text', 0)
INSERT [dbo].[QuestionType] ([Id], [Type], [IsDeleted]) VALUES (2, N'Text', 1)
INSERT [dbo].[QuestionType] ([Id], [Type], [IsDeleted]) VALUES (3, N'SingleChoice', 0)
INSERT [dbo].[QuestionType] ([Id], [Type], [IsDeleted]) VALUES (4, N'MultiChoice', 0)
INSERT [dbo].[QuestionType] ([Id], [Type], [IsDeleted]) VALUES (5, N'Dropdown', 0)
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Role], [IsDeleted]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Role] ([Id], [Role], [IsDeleted]) VALUES (2, N'User', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Survey] ON 

INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (20, N'Testing Event', N'Testing Event', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (21, N'test', N'test', 0, NULL)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (22, N'hackathon', N'hack', 0, NULL)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (23, N'Food corner', N'Your opinion about the food we provide', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (24, N'Hackthan Food 20th', N'Hackthan Food', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (25, N'test', N'test', 0, NULL)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (26, N'Sample', N'sample', 0, NULL)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (27, N'new', N'test', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (28, N'Sample', N'Event Survey', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (29, N'Controls', N'Controls', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (30, N'event', N'event', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (31, N'New event', N'Event', 0, 1)
INSERT [dbo].[Survey] ([Id], [Name], [Description], [IsDeleted], [IsMailSent]) VALUES (32, N'Testing Events', N'Testing Events', 0, 1)
SET IDENTITY_INSERT [dbo].[Survey] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (1, 1, N'admin', N'admin', N'A', N'admin', N'admin', N'admin@gmail.com', 0)
INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (2, 2, N'naren', NULL, NULL, N'naren', NULL, N'narendransrinivasan@syncfusion.com', 0)
INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (5, 2, N'sameer', NULL, NULL, N'sameer', NULL, N'misameer12@gmail.com', 0)
INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (14, 2, N'mohamed', NULL, NULL, N'test', NULL, N'ismailsameer12@gmail.com', 0)
INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (15, 2, N'karthiga', NULL, NULL, N'karthiga', NULL, N's.karthiga95@gmail.com', 0)
INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (16, 2, N'kali', NULL, NULL, N'kalidasan', NULL, N'kalidasan96@gmail.com', 0)
INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (17, 2, N'karthi', NULL, NULL, N'karthi', NULL, N'kartheeswari.selvaraj@syncfusion.com', 0)
INSERT [dbo].[User] ([Id], [RoleId], [Username], [FirstName], [LastName], [Password], [ConfirmPassword], [Email], [IsDeleted]) VALUES (18, 2, N'girija', NULL, NULL, N'1234567', NULL, N'girija.rajendran@syncfusion.com', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([ChoiceId])
REFERENCES [dbo].[Choice] ([ID])
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([QuestionTypeId])
REFERENCES [dbo].[QuestionType] ([Id])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
USE [master]
GO
ALTER DATABASE [EventSurvey] SET  READ_WRITE 
GO
