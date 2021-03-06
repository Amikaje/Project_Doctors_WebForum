USE [master]
GO
/****** Object:  Database [Project_Doctors_WebForum]    Script Date: 7/22/2019 9:34:46 AM ******/
CREATE DATABASE [Project_Doctors_WebForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_Doctors_WebForum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Project_Doctors_WebForum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_Doctors_WebForum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Project_Doctors_WebForum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Project_Doctors_WebForum] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_Doctors_WebForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_Doctors_WebForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET RECOVERY FULL 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET  MULTI_USER 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_Doctors_WebForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_Doctors_WebForum] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_Doctors_WebForum', N'ON'
GO
ALTER DATABASE [Project_Doctors_WebForum] SET QUERY_STORE = OFF
GO
USE [Project_Doctors_WebForum]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/22/2019 9:34:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentContent] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[Post_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 7/22/2019 9:34:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[Birthday] [datetime] NULL,
	[Gender] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[StatusBlock] [bit] NOT NULL,
	[RegistrationStatus] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Role] [bit] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikePosts]    Script Date: 7/22/2019 9:34:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikePosts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusLike] [bit] NULL,
	[Post_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
 CONSTRAINT [PK_LikePosts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 7/22/2019 9:34:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](200) NULL,
	[PostContent] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[Views] [int] NULL,
	[StatusBlock] [bit] NOT NULL,
	[Topic_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyComments]    Script Date: 7/22/2019 9:34:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentContent] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[Comment_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
 CONSTRAINT [PK_ReplyComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialize]    Script Date: 7/22/2019 9:34:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecializeName] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Specialize_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 7/22/2019 9:34:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Specialize_ID] [int] NOT NULL,
 CONSTRAINT [PK_Specialize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CommentContent], [CommentDate], [Post_ID], [Doctor_ID]) VALUES (128, N'<p>tra loi bai viet</p>', CAST(N'2019-07-22T08:34:35.730' AS DateTime), 1124, 1079)
INSERT [dbo].[Comments] ([Id], [CommentContent], [CommentDate], [Post_ID], [Doctor_ID]) VALUES (129, N'<p>bai viet hay <br></p>', CAST(N'2019-07-22T08:38:47.220' AS DateTime), 1124, 1080)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([Id], [Firstname], [Lastname], [Phone], [Address], [Email], [Username], [Password], [Image], [Birthday], [Gender], [CreateDate], [StatusBlock], [RegistrationStatus], [Active], [Role]) VALUES (47, N'Admin ', N'Admin', NULL, N'230-nam hòa', N'nhannguyen@gmail.com', N'admin', N'$2a$10$Cyk4pxpyRpA0h5kHkbsWM.559E71BJegh9uctE4PiG6lBOJq11X52', N'25594149_166156604139677_5193082862228513790_n.jpg', CAST(N'1989-02-13T00:00:00.000' AS DateTime), N'Nam', CAST(N'2019-07-01T12:48:04.407' AS DateTime), 0, 1, 1, 1)
INSERT [dbo].[Doctors] ([Id], [Firstname], [Lastname], [Phone], [Address], [Email], [Username], [Password], [Image], [Birthday], [Gender], [CreateDate], [StatusBlock], [RegistrationStatus], [Active], [Role]) VALUES (1079, N'nhan', N'nguyen', NULL, NULL, N'nhannguyen060819999@gmail.com', N'nhannguyen', N'$2a$10$M6tIQqo9RYnbP.RMZZ8Ff.PecLhasEEDekACLknd7XUQ/Z.y2cobO', NULL, CAST(N'1990-04-09T00:00:00.000' AS DateTime), N'Nam', CAST(N'2019-07-22T08:27:05.527' AS DateTime), 0, 1, 0, 0)
INSERT [dbo].[Doctors] ([Id], [Firstname], [Lastname], [Phone], [Address], [Email], [Username], [Password], [Image], [Birthday], [Gender], [CreateDate], [StatusBlock], [RegistrationStatus], [Active], [Role]) VALUES (1080, N'tan ', N'vu', NULL, NULL, N'tanvu1020@gmail.com', N'tan', N'$2a$10$14VWmmFxwuyAPKlIGc4FduIpxxCoTQ34CDtVaOwIRYS8ABLOGPi4i', NULL, CAST(N'1988-07-13T00:00:00.000' AS DateTime), N'Nam', CAST(N'2019-07-22T08:37:21.130' AS DateTime), 0, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
SET IDENTITY_INSERT [dbo].[LikePosts] ON 

INSERT [dbo].[LikePosts] ([Id], [StatusLike], [Post_ID], [Doctor_ID]) VALUES (196, 1, 1124, 1079)
INSERT [dbo].[LikePosts] ([Id], [StatusLike], [Post_ID], [Doctor_ID]) VALUES (197, 1, 1124, 1080)
SET IDENTITY_INSERT [dbo].[LikePosts] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [PostName], [PostContent], [Description], [CreateDate], [Views], [StatusBlock], [Topic_ID], [Doctor_ID]) VALUES (1124, N'bai viet 1', N'<p><span style="background-color: rgb(255, 255, 0);">noi dung bai viet 1</span></p><p><span style="background-color: rgb(255, 255, 0);"><br></span></p>', NULL, CAST(N'2019-07-22T08:33:54.560' AS DateTime), NULL, 0, 2, 1079)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Specialize] ON 

INSERT [dbo].[Specialize] ([Id], [SpecializeName], [Description]) VALUES (1, N'Tim mạch', N'khu vực thảo luận về các chủ đề về bệnh tim mach')
INSERT [dbo].[Specialize] ([Id], [SpecializeName], [Description]) VALUES (2, N'Tai mũi họng', N'khu vực thảo luận các chủ đề về các bệnh Tai mũi họng')
INSERT [dbo].[Specialize] ([Id], [SpecializeName], [Description]) VALUES (3, N'Mắt', N'khu vực thảo luận các chủ đề các bệnh về Mắt')
INSERT [dbo].[Specialize] ([Id], [SpecializeName], [Description]) VALUES (4, N'Xương khớp', N'khu vực thảo luận về các chủ đề về các bệnh Xương khớp')
INSERT [dbo].[Specialize] ([Id], [SpecializeName], [Description]) VALUES (5, N'Ung bứu', N'khu vực thảo luận về các chủ đề về các bệnh Ung bứu 
')
INSERT [dbo].[Specialize] ([Id], [SpecializeName], [Description]) VALUES (14, N'chuyem mon 1', N'test')
SET IDENTITY_INSERT [dbo].[Specialize] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (1, N'Cao huyết áp', N'chuyên các bài viết về cao huyết áp nè', 1)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (2, N'Đao ', N'Đao nè', 1)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (3, N'Hở van tim', N'Hở van tim nè', 1)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (4, N'Viêm xoang', N'Viêm xoang nè', 2)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (5, N'Viêm họng', N'Viêm họng nè', 2)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (8, N'Tật khúc xạ', N'Tật khúc xạ nè', 3)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (9, N'Đục thủy tinh thể', N'Đục thủy tinh thể nè', 3)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (10, N'Đau mắt đỏ', N'Đau mắt đỏ', 3)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (11, N'Thoái hóa', N'Thoái hóa', 4)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (12, N'Chân khớp', N'Chân khớp', 4)
INSERT [dbo].[Topics] ([Id], [TopicName], [Description], [Specialize_ID]) VALUES (13, N'Hạch', N'Hạch nè', 5)
SET IDENTITY_INSERT [dbo].[Topics] OFF
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([Post_ID])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[LikePosts]  WITH CHECK ADD  CONSTRAINT [FK_LikePosts_Posts] FOREIGN KEY([Post_ID])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[LikePosts] CHECK CONSTRAINT [FK_LikePosts_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Doctors] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Doctors]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Topics] FOREIGN KEY([Topic_ID])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Topics]
GO
ALTER TABLE [dbo].[ReplyComments]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComments_Comments] FOREIGN KEY([Comment_ID])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[ReplyComments] CHECK CONSTRAINT [FK_ReplyComments_Comments]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_Topics_Specialize] FOREIGN KEY([Specialize_ID])
REFERENCES [dbo].[Specialize] ([Id])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_Topics_Specialize]
GO
USE [master]
GO
ALTER DATABASE [Project_Doctors_WebForum] SET  READ_WRITE 
GO
