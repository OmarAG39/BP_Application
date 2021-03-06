USE [master]
GO
/****** Object:  Database [DBPichincha]    Script Date: 06/19/2022 17:23:01 ******/
CREATE DATABASE [DBPichincha] ON  PRIMARY 
( NAME = N'DBPichincha', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER_2008\MSSQL\DATA\DBPichincha.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBPichincha_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER_2008\MSSQL\DATA\DBPichincha_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBPichincha] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBPichincha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBPichincha] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DBPichincha] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DBPichincha] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DBPichincha] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DBPichincha] SET ARITHABORT OFF
GO
ALTER DATABASE [DBPichincha] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DBPichincha] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DBPichincha] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DBPichincha] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DBPichincha] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DBPichincha] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DBPichincha] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DBPichincha] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DBPichincha] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DBPichincha] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DBPichincha] SET  DISABLE_BROKER
GO
ALTER DATABASE [DBPichincha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DBPichincha] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DBPichincha] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DBPichincha] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DBPichincha] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DBPichincha] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DBPichincha] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DBPichincha] SET  READ_WRITE
GO
ALTER DATABASE [DBPichincha] SET RECOVERY FULL
GO
ALTER DATABASE [DBPichincha] SET  MULTI_USER
GO
ALTER DATABASE [DBPichincha] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DBPichincha] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBPichincha', N'ON'
GO
USE [DBPichincha]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 06/19/2022 17:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[BusinessName] [nvarchar](max) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Contact] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[RUC] [nvarchar](max) NOT NULL,
	[Tradename] [nvarchar](max) NOT NULL,
	[UserName] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Client_Id] ON [dbo].[Client] 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogueDetail]    Script Date: 06/19/2022 17:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogueDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BusinessCode] [nvarchar](max) NULL,
	[CatalogueDetailParentId] [bigint] NULL,
	[CatalogueId] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[Order] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_CatalogueDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CatalogueDetail_CatalogueDetailParentId] ON [dbo].[CatalogueDetail] 
(
	[CatalogueDetailParentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogue]    Script Date: 06/19/2022 17:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CatalogueParentId] [bigint] NULL,
	[Code] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsExternal] [bit] NOT NULL,
	[IsSystem] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Catalogue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Catalogue_CatalogueParentId] ON [dbo].[Catalogue] 
(
	[CatalogueParentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLog]    Script Date: 06/19/2022 17:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[ServiceName] [nvarchar](max) NULL,
	[MethodName] [nvarchar](max) NULL,
	[Parameters] [nvarchar](max) NULL,
	[ReturnValue] [nvarchar](max) NULL,
	[ExecutionTime] [datetime2](7) NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ClientIpAddress] [nvarchar](max) NULL,
	[ClientName] [nvarchar](max) NULL,
	[BrowserInfo] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[ImpersonatorUserId] [bigint] NULL,
	[CustomData] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditDescription]    Script Date: 06/19/2022 17:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditDescription](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NameService] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_AuditDescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 06/19/2022 17:23:03 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 06/19/2022 17:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[Estateid] [int] NOT NULL,
	[InsuranceCarrierId] [int] NOT NULL,
	[OriginPolicyNumber] [nvarchar](max) NULL,
	[PolicyNumber] [nvarchar](max) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ValidSince] [datetime2](7) NOT NULL,
	[ValidUntil] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Policy_ClientId] ON [dbo].[Policy] 
(
	[ClientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_CatalogueDetail_CatalogueDetail_CatalogueDetailParentId]    Script Date: 06/19/2022 17:23:03 ******/
ALTER TABLE [dbo].[CatalogueDetail]  WITH CHECK ADD  CONSTRAINT [FK_CatalogueDetail_CatalogueDetail_CatalogueDetailParentId] FOREIGN KEY([CatalogueDetailParentId])
REFERENCES [dbo].[CatalogueDetail] ([Id])
GO
ALTER TABLE [dbo].[CatalogueDetail] CHECK CONSTRAINT [FK_CatalogueDetail_CatalogueDetail_CatalogueDetailParentId]
GO
/****** Object:  ForeignKey [FK_Catalogue_Catalogue_CatalogueParentId]    Script Date: 06/19/2022 17:23:03 ******/
ALTER TABLE [dbo].[Catalogue]  WITH CHECK ADD  CONSTRAINT [FK_Catalogue_Catalogue_CatalogueParentId] FOREIGN KEY([CatalogueParentId])
REFERENCES [dbo].[Catalogue] ([Id])
GO
ALTER TABLE [dbo].[Catalogue] CHECK CONSTRAINT [FK_Catalogue_Catalogue_CatalogueParentId]
GO
/****** Object:  ForeignKey [FK_Policy_Client_ClientId]    Script Date: 06/19/2022 17:23:03 ******/
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_Client_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_Client_ClientId]
GO
