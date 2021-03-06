USE [master]
GO
/****** Object:  Database [StudentInformation]    Script Date: 10/5/2018 12:56:16 PM ******/
CREATE DATABASE [StudentInformation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentInformation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StudentInformation.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentInformation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StudentInformation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentInformation] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentInformation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentInformation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentInformation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentInformation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentInformation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentInformation] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentInformation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentInformation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentInformation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentInformation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentInformation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentInformation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentInformation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentInformation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentInformation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentInformation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentInformation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentInformation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentInformation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentInformation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentInformation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentInformation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentInformation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentInformation] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentInformation] SET  MULTI_USER 
GO
ALTER DATABASE [StudentInformation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentInformation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentInformation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentInformation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StudentInformation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentInformation', N'ON'
GO
USE [StudentInformation]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 10/5/2018 12:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](20) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/5/2018 12:56:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[ClassId] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (1, N'Grade 1')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (2, N'Grade 2')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (3, N'Grade 3')
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Address], [ClassId]) VALUES (1, N'Anil Rajbanshi', N'Swayanbhu', NULL)
INSERT [dbo].[Student] ([Id], [Name], [Address], [ClassId]) VALUES (2, N'Bibash Pariyar', N'Baneshwor ', 2)
INSERT [dbo].[Student] ([Id], [Name], [Address], [ClassId]) VALUES (3, N'Sakshi Shrestha', N'Chabahil', NULL)
INSERT [dbo].[Student] ([Id], [Name], [Address], [ClassId]) VALUES (4, N'Palistha Shrestha', N'Sakhnu', 3)
SET IDENTITY_INSERT [dbo].[Student] OFF
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Student] FOREIGN KEY([Id])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Student]
GO
USE [master]
GO
ALTER DATABASE [StudentInformation] SET  READ_WRITE 
GO
