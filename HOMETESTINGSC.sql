USE [master]
GO
/****** Object:  Database [FluJab]    Script Date: 23/11/2020 09:58:20 ******/
CREATE DATABASE [FluJab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FluJab', FILENAME = N'D:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Data\FluJab.mdf' , SIZE = 28608KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'FluJab_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Log\FluJab_log.ldf' , SIZE = 234944KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FluJab] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FluJab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FluJab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FluJab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FluJab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FluJab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FluJab] SET ARITHABORT OFF 
GO
ALTER DATABASE [FluJab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FluJab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FluJab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FluJab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FluJab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FluJab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FluJab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FluJab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FluJab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FluJab] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FluJab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FluJab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FluJab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FluJab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FluJab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FluJab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FluJab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FluJab] SET RECOVERY FULL 
GO
ALTER DATABASE [FluJab] SET  MULTI_USER 
GO
ALTER DATABASE [FluJab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FluJab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FluJab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FluJab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FluJab] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FluJab] SET QUERY_STORE = OFF
GO
USE [FluJab]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [FluJab]
GO
/****** Object:  User [svc-LinkedSvr]    Script Date: 23/11/2020 09:58:20 ******/
CREATE USER [svc-LinkedSvr] FOR LOGIN [svc-LinkedSvr] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JPAGET\sayerg]    Script Date: 23/11/2020 09:58:20 ******/
CREATE USER [JPAGET\sayerg] FOR LOGIN [JPAGET\sayerg] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JPAGET\pearcer]    Script Date: 23/11/2020 09:58:20 ******/
CREATE USER [JPAGET\pearcer] FOR LOGIN [JPAGET\pearcer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JPAGET\DevAdmin04]    Script Date: 23/11/2020 09:58:20 ******/
CREATE USER [JPAGET\DevAdmin04] FOR LOGIN [JPAGET\DevAdmin04] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JPAGET\DevAdmin02]    Script Date: 23/11/2020 09:58:20 ******/
CREATE USER [JPAGET\DevAdmin02] FOR LOGIN [JPAGET\DevAdmin02] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FluDatabaseUser]    Script Date: 23/11/2020 09:58:20 ******/
CREATE USER [FluDatabaseUser] FOR LOGIN [FluDatabaseUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [svc-LinkedSvr]
GO
ALTER ROLE [db_datareader] ADD MEMBER [JPAGET\sayerg]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [JPAGET\sayerg]
GO
ALTER ROLE [db_datareader] ADD MEMBER [JPAGET\pearcer]
GO
ALTER ROLE [db_owner] ADD MEMBER [JPAGET\DevAdmin02]
GO
ALTER ROLE [db_datareader] ADD MEMBER [JPAGET\DevAdmin02]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [JPAGET\DevAdmin02]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FluDatabaseUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [FluDatabaseUser]
GO
/****** Object:  Schema [HomeTestingSch]    Script Date: 23/11/2020 09:58:20 ******/
CREATE SCHEMA [HomeTestingSch]
GO
/****** Object:  Table [dbo].[tbl_AssignmentCats]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AssignmentCats](
	[AssCatID] [int] IDENTITY(1,1) NOT NULL,
	[Catergory] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_AssignmentCats] PRIMARY KEY CLUSTERED 
(
	[AssCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AssignmentStatus]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AssignmentStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentStatus] [varchar](500) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_AssignmentStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Audit]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [nvarchar](150) NULL,
	[FirstName] [nvarchar](150) NULL,
	[LastName] [nvarchar](150) NULL,
	[AddedBy] [varchar](550) NULL,
	[AddedDate] [datetime2](7) NULL,
	[Notes] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[VaccStatus] [varchar](max) NULL,
	[VaccStatusBy] [varchar](max) NULL,
	[VaccLocation] [varchar](max) NULL,
	[VaccName] [varchar](max) NULL,
	[VaccBatch] [varchar](max) NULL,
	[VaccDate] [datetime2](7) NULL,
	[DecReason] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Audit] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DeclinedReasons]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DeclinedReasons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeclinedReason] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_DeclinedReasons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Departments]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Departments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_Departments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Divisions]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Divisions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Division] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_Divisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FacingGroups]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FacingGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FacingGroup] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_FacingGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HighRiskAreas]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HighRiskAreas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RiskArea] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_HighRiskAreas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HomeTesting]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HomeTesting](
	[HTId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNumber] [nvarchar](15) NULL,
	[TestingKitIssued] [bit] NOT NULL,
	[LotNumber] [varchar](max) NULL,
	[Qty] [int] NULL,
	[IssuedBy] [varchar](500) NULL,
	[IssueDate] [datetime2](7) NULL,
	[Ward] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[ExpiryDate] [datetime2](7) NULL,
	[FirstName] [varchar](max) NULL,
	[Surname] [varchar](max) NULL,
	[Division] [varchar](max) NULL,
	[Department] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_HomeTesting] PRIMARY KEY CLUSTERED 
(
	[HTId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Professions]    Script Date: 23/11/2020 09:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Professions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Profession] [varchar](550) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_Professions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_StaffFacingGroups]    Script Date: 23/11/2020 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StaffFacingGroups](
	[Employee Number] [float] NULL,
	[Facing Group] [nvarchar](255) NULL,
	[FrontLineStaff] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_StaffGroups]    Script Date: 23/11/2020 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StaffGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StaffGroup] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_StaffGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VaccBatch]    Script Date: 23/11/2020 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VaccBatch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[ExpiryDate] [date] NULL,
 CONSTRAINT [PK_tbl_VaccBatch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Vaccinators]    Script Date: 23/11/2020 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vaccinators](
	[VacID] [int] IDENTITY(1,1) NOT NULL,
	[VaccName] [varchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Vaccinators] PRIMARY KEY CLUSTERED 
(
	[VacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VaccManus]    Script Date: 23/11/2020 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VaccManus](
	[VacManID] [int] IDENTITY(1,1) NOT NULL,
	[VaccManName] [varchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_VaccManus] PRIMARY KEY CLUSTERED 
(
	[VacManID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStaff]    Script Date: 23/11/2020 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaff](
	[Title] [nvarchar](10) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmployeeNumber] [nvarchar](15) NOT NULL,
	[Division] [nvarchar](100) NULL,
	[Department] [nvarchar](100) NULL,
	[AssignmentStatus] [nvarchar](50) NULL,
	[StaffGroup] [nvarchar](100) NULL,
	[Role] [nvarchar](100) NULL,
	[AssignmentCategory] [nvarchar](50) NULL,
	[Paypoint] [nvarchar](50) NULL,
	[CostCentre] [nvarchar](10) NULL,
	[Profession] [nvarchar](50) NULL,
	[VaccinationStatus] [nvarchar](250) NULL,
	[Notes] [nvarchar](255) NULL,
	[Comments] [nvarchar](555) NULL,
	[VaccinationStatusBy] [nvarchar](250) NULL,
	[VaccinationLocation] [nvarchar](250) NULL,
	[VaccinatorName] [nvarchar](250) NULL,
	[VaccinatorDateTime] [datetime2](7) NULL,
	[VaccinationBatchNumber] [nvarchar](150) NULL,
	[AddedByUser] [varchar](250) NULL,
	[DateAddedToDB] [datetime2](7) NULL,
	[EditedDate] [datetime2](7) NULL,
	[DeclinedReason] [varchar](max) NULL,
	[FrontLineStaff] [bit] NULL,
	[AddedStaffToDB] [bit] NULL,
	[ActiveStaff] [bit] NULL,
	[AnatomicalSiteOfVaccination] [varchar](max) NULL,
	[HighRisk] [bit] NULL,
	[HighRiskArea] [varchar](max) NULL,
	[PatientFacingGroup] [varchar](max) NULL,
	[VerbalConstent] [varchar](max) NULL,
	[AreYouWellToday] [bit] NULL,
	[AllergicToEggs] [bit] NULL,
	[Allergies] [bit] NULL,
	[ProblemsFromAFluInjection] [bit] NULL,
	[ConditionAffectingImmune] [bit] NULL,
	[VaccExpiryDate] [varchar](250) NULL,
	[VaccManu] [varchar](max) NULL,
 CONSTRAINT [PK_tblStaff] PRIMARY KEY CLUSTERED 
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStaff201920]    Script Date: 23/11/2020 09:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaff201920](
	[Title] [nvarchar](10) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmployeeNumber] [nvarchar](15) NOT NULL,
	[Division] [nvarchar](100) NULL,
	[Department] [nvarchar](100) NULL,
	[AssignmentStatus] [nvarchar](50) NULL,
	[StaffGroup] [nvarchar](100) NULL,
	[Role] [nvarchar](100) NULL,
	[AssignmentCategory] [nvarchar](50) NULL,
	[Paypoint] [nvarchar](50) NULL,
	[CostCentre] [nvarchar](10) NULL,
	[Profession] [nvarchar](50) NULL,
	[VaccinationStatus] [nvarchar](250) NULL,
	[Notes] [nvarchar](255) NULL,
	[Comments] [nvarchar](555) NULL,
	[VaccinationStatusBy] [nvarchar](250) NULL,
	[VaccinationLocation] [nvarchar](250) NULL,
	[VaccinatorName] [nvarchar](250) NULL,
	[VaccinatorDateTime] [datetime2](7) NULL,
	[VaccinationBatchNumber] [nvarchar](150) NULL,
	[AddedByUser] [varchar](250) NULL,
	[DateAddedToDB] [datetime2](7) NULL,
	[EditedDate] [datetime2](7) NULL,
	[DeclinedReason] [varchar](max) NULL,
	[FrontLineStaff] [bit] NULL,
	[AddedStaffToDB] [bit] NULL,
	[ActiveStaff] [bit] NULL,
	[AnatomicalSiteOfVaccination] [varchar](max) NULL,
	[HighRisk] [bit] NOT NULL,
	[HighRiskArea] [varchar](max) NULL,
	[PatientFacingGroup] [varchar](max) NULL,
	[VerbalConstent] [varchar](max) NULL,
	[AreYouWellToday] [bit] NULL,
	[AllergicToEggs] [bit] NULL,
	[Allergies] [bit] NULL,
	[ProblemsFromAFluInjection] [bit] NULL,
	[ConditionAffectingImmune] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [FluJab] SET  READ_WRITE 
GO
