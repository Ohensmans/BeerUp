USE [master]
GO
/****** Object:  Database [BeerUp]    Script Date: 26-03-21 08:56:46 ******/
CREATE DATABASE [BeerUp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeerUp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\BeerUp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeerUp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\BeerUp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BeerUp] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeerUp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeerUp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeerUp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeerUp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeerUp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeerUp] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeerUp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeerUp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeerUp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeerUp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeerUp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeerUp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeerUp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeerUp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeerUp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeerUp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeerUp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeerUp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeerUp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeerUp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeerUp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeerUp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeerUp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeerUp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BeerUp] SET  MULTI_USER 
GO
ALTER DATABASE [BeerUp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeerUp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeerUp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeerUp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeerUp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeerUp] SET QUERY_STORE = OFF
GO
USE [BeerUp]
GO
/****** Object:  Table [dbo].[AchatsVues]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchatsVues](
	[Ach.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Trans.Id] [uniqueidentifier] NOT NULL,
	[Eta.Id] [uniqueidentifier] NULL,
	[TarifsVueEtab.Id] [uniqueidentifier] NULL,
	[TarifsVueBie.Id] [uniqueidentifier] NULL,
	[Bie.Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AchatsVues] PRIMARY KEY CLUSTERED 
(
	[Ach.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdressesFacturation]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdressesFacturation](
	[AdrFac.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[AdrFac.Rue] [nvarchar](200) NULL,
	[AdrFac.Num] [nvarchar](50) NULL,
	[AdrFac.CP] [nvarchar](50) NULL,
	[AdrFac.Vil] [nvarchar](100) NULL,
	[AdrFac.Pays] [nvarchar](50) NULL,
	[AdrFac.DateAjout] [datetime] NULL,
	[Org.Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AdressesFacturation] PRIMARY KEY CLUSTERED 
(
	[AdrFac.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AvisBiereUser]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvisBiereUser](
	[AviBieUser.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Bie.Id] [uniqueidentifier] NOT NULL,
	[User.Id] [uniqueidentifier] NOT NULL,
	[AviBieUser.DateAvis] [datetime] NOT NULL,
	[AviBieUser.Actif] [bit] NOT NULL,
	[Avis.Acid] [int] NOT NULL,
	[Avis.Cafe] [int] NOT NULL,
	[Avis.Cara] [int] NOT NULL,
	[Avis.Fruit] [int] NOT NULL,
	[Avis.Houb] [int] NOT NULL,
	[Avis.Malt] [int] NOT NULL,
	[Avis.Sucr] [int] NOT NULL,
	[Avis.NoteGlob] [int] NULL,
	[Org.Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AvisBiereUser] PRIMARY KEY CLUSTERED 
(
	[AviBieUser.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bieres]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bieres](
	[Bie.Id] [uniqueidentifier] NOT NULL,
	[Eta.Id] [uniqueidentifier] NOT NULL,
	[TypBie.Id] [uniqueidentifier] NOT NULL,
	[Bie.Nom] [nvarchar](100) NOT NULL,
	[Bie.Desc] [nvarchar](1000) NULL,
	[Bie.Photo] [nvarchar](200) NULL,
	[Bie.NbVu] [bigint] NOT NULL,
	[Bie.DateCre] [datetime] NOT NULL,
	[Bie.Valide] [bit] NOT NULL,
	[Bie.Actif] [bit] NOT NULL,
	[User.Id] [uniqueidentifier] NOT NULL,
	[Bie.DegreAlcool] [decimal](2, 1) NOT NULL,
 CONSTRAINT [PK_Bieres] PRIMARY KEY CLUSTERED 
(
	[Bie.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etablissements]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etablissements](
	[Eta.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Org.Id] [uniqueidentifier] NULL,
	[TypEta.Id] [uniqueidentifier] NOT NULL,
	[Eta.Nom] [nvarchar](200) NOT NULL,
	[Eta.Tva] [nvarchar](50) NULL,
	[Eta.Rue] [nvarchar](200) NULL,
	[Eta.Num] [nvarchar](50) NULL,
	[Eta.CP] [nvarchar](50) NULL,
	[Eta.Ville] [nvarchar](100) NULL,
	[Eta.Email] [nvarchar](100) NULL,
	[Eta.Web] [nvarchar](100) NULL,
	[Eta.Photo] [nvarchar](200) NULL,
	[Eta.NbVu] [bigint] NULL,
	[Eta.CoordLong] [nvarchar](100) NULL,
	[Eta.Actif] [bit] NOT NULL,
	[Eta.Pays] [nvarchar](100) NULL,
	[Eta.CoordLat] [nvarchar](100) NULL,
 CONSTRAINT [PK_Etablissements] PRIMARY KEY CLUSTERED 
(
	[Eta.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factures]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factures](
	[Fac.Id] [int] IDENTITY(1,1) NOT NULL,
	[Trans.Id] [uniqueidentifier] NOT NULL,
	[AdrFac.Id] [uniqueidentifier] NOT NULL,
	[Fac.Date] [datetime] NOT NULL,
	[Fac.Motif] [varchar](255) NULL,
 CONSTRAINT [PK_Factures] PRIMARY KEY CLUSTERED 
(
	[Fac.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horaires]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horaires](
	[Hor.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Eta.Id] [uniqueidentifier] NOT NULL,
	[Hor.Jour] [nvarchar](20) NOT NULL,
	[Hor.Debut] [time](7) NOT NULL,
	[Hor.Fin] [time](7) NOT NULL,
 CONSTRAINT [PK_Horaires] PRIMARY KEY CLUSTERED 
(
	[Hor.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoursFermeture]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoursFermeture](
	[Jou.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Eta.Id] [uniqueidentifier] NOT NULL,
	[Jou.Date] [datetime] NOT NULL,
 CONSTRAINT [PK_JoursFermeture] PRIMARY KEY CLUSTERED 
(
	[Jou.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrairieUserBieres]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrairieUserBieres](
	[Bie.Id] [uniqueidentifier] NOT NULL,
	[User.Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LibrairieUserBieres] PRIMARY KEY CLUSTERED 
(
	[Bie.Id] ASC,
	[User.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organisations]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organisations](
	[Org.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Org.Nom] [nvarchar](200) NULL,
	[Org.Tva] [nvarchar](50) NULL,
	[Org.Rue] [nvarchar](200) NULL,
	[Org.Num] [nvarchar](50) NULL,
	[Org.CP] [nvarchar](50) NULL,
	[Org.Ville] [nvarchar](100) NULL,
	[Org.Pays] [nvarchar](50) NULL,
	[Org.Email] [nvarchar](100) NULL,
	[Org.Web] [nvarchar](100) NULL,
	[Org.Photo] [nvarchar](200) NULL,
 CONSTRAINT [PK_Organisations] PRIMARY KEY CLUSTERED 
(
	[Org.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifsVueBie]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifsVueBie](
	[TarifsVueBie.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TarifsVueBie.NbVue] [bigint] NOT NULL,
	[TarifsVueBie.Prix] [decimal](8, 2) NOT NULL,
	[TarifsVueBie.DateDebut] [datetime] NOT NULL,
	[TarifsVueBie.DateFin] [datetime] NOT NULL,
	[TarifsVueBie.Actif] [bit] NOT NULL,
 CONSTRAINT [PK_TarifsVueBie] PRIMARY KEY CLUSTERED 
(
	[TarifsVueBie.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifsVueEtab]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifsVueEtab](
	[TarifsVueEtab.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TarifsVueEtab.NbVue] [bigint] NOT NULL,
	[TarifsVueEtab.Prix] [decimal](8, 2) NOT NULL,
	[TarifsVueEtab.DateDebut] [datetime] NOT NULL,
	[TarifsVueEtab.DateFin] [datetime] NOT NULL,
	[TarifsVueEtab.Actif] [bit] NOT NULL,
 CONSTRAINT [PK_TarifsVueEtab] PRIMARY KEY CLUSTERED 
(
	[TarifsVueEtab.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Trans.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Org.Id] [uniqueidentifier] NOT NULL,
	[Trans.Status] [nvarchar](255) NOT NULL,
	[Trans.Date] [datetime] NOT NULL,
	[Stripe.Id] [nvarchar](255) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Trans.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesBiere]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesBiere](
	[TypBie.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TypBie.Nom] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypesBiere] PRIMARY KEY CLUSTERED 
(
	[TypBie.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesEtablissement]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesEtablissement](
	[TypEta.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TypEta.Nom] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TypesEtablissement] PRIMARY KEY CLUSTERED 
(
	[TypEta.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesServices]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesServices](
	[TypServ.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TypSer.Libelle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TypesServices] PRIMARY KEY CLUSTERED 
(
	[TypServ.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VenteBiereEta]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VenteBiereEta](
	[VenteBiereEta.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Eta.Id] [uniqueidentifier] NOT NULL,
	[Bie.Id] [uniqueidentifier] NOT NULL,
	[TypServ.Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_VenteBiereEta] PRIMARY KEY CLUSTERED 
(
	[VenteBiereEta.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'654291e6-9072-ff44-e9b6-0876b8a116cd', N'6a87d96e-855e-a41f-f24e-a5a32a7d1782', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'db8a6e05-19b6-dcdb-c645-20625c6a52ad', N'd0abd32d-8894-e75b-88ee-0f2b1f50bba4', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'99747bbf-2396-3f54-e419-28d19e236139', N'9fb4f527-edf8-0ff0-73c4-50b6cb3eece2', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'2482177a-b262-ab53-b5c1-29467a96464d', N'0f495d30-5342-9851-76b7-26e3db20319f', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'a986460a-2e08-3f80-42b4-3467216ebfe5', N'943ee363-6456-2d15-5582-2ca662a21b9c', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'5cc503f9-eaa2-fd1d-bb7d-36335a53173b', N'd70d1c60-88b0-80be-8b33-8414194b2156', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'f5da358c-a47b-4cfd-65e5-37d1c92c529a', N'6ff85aca-34e4-d53d-4533-bf8777d77d04', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'42222398-d473-89ae-2608-3c3c15fd4d03', N'4275e580-8419-ac11-7111-0974fc90e300', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'735cc1d0-0f78-7b2c-b63b-3ca434819178', N'eaa97f8f-d14e-b8fa-e2c3-7aff3cac7de5', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'89f78c9d-5bbe-4438-bd30-208518019894')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'06c41582-de6b-f3c5-6222-5b01e33957b2', N'796c758a-eb1f-550f-df88-322b1a15c32f', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'5828e9dd-84eb-4506-89c9-a33502de3c51', NULL, NULL)
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'15922749-9669-a559-cbe5-69ba6886c5e9', N'd49d0192-45c7-7ccf-13b2-42078436d96d', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'6deb3514-49c8-f770-f504-73c2dde17900', N'ba4ecca3-b5f0-0dab-0033-5e1b3af11295', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'b1d55ea2-b648-448f-f2a3-79857fa2362c', N'3dc84404-2ec1-9b78-17a5-80e895bafac8', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'58a67908-aaa8-57fc-6104-79f844a703eb', N'0a70fee7-fae3-4922-5f4e-7d8c35aa4551', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'2ea4b566-945b-49a8-29f1-82cec7ca5793', N'e17908a0-5275-82d0-2be4-123da388849e', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'42b77234-2fcb-6604-c693-8c2cc32fc6f2', N'346d2d5e-5e46-a163-ae5e-b32a69fc2230', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'89f78c9d-5bbe-4438-bd30-208518019894')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'd7bfe709-d470-6c81-39f3-8c7d3da87b37', N'c951e39e-e429-e27d-0e9c-f89ffc7292dd', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'89f78c9d-5bbe-4438-bd30-208518019894')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'9f982ba1-f8c3-72c3-c8cb-8fd7ad32c636', N'3bf685f0-7c9f-e219-c58e-f07ff6f43055', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'de6f8833-214d-7bbf-950a-93138cd1594d', N'024c5330-b004-e62d-89a3-9963e0f4390b', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'89f78c9d-5bbe-4438-bd30-208518019894')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'c195a26e-84bb-3512-827b-99d8c6d43f6a', N'772cc06f-dfff-6a8e-97ad-a33a1b983276', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'c6622223-c745-920f-fe8c-9b64bb445b2d', N'b48fb218-8881-0d4f-bd07-8cf79c0d6903', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'89f78c9d-5bbe-4438-bd30-208518019894')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'2f63872b-06a5-183e-2f5d-a00940fbe76f', N'66018a1f-292e-7e33-3451-0049be07916a', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'bd25961f-a58a-6e2c-5fc4-a1253071b51d', N'334af9ba-7a1a-620d-e161-ef79082dc26a', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'89f78c9d-5bbe-4438-bd30-208518019894')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'cb0d6ba2-e998-2bee-9834-aec33547270e', N'ccc5cb22-82e0-1b80-3e83-5d087702c13d', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'5828e9dd-84eb-4506-89c9-a33502de3c51', NULL, NULL)
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'21603184-15b7-6f03-2c3d-cc86b0b2887a', N'3738fc6d-9f73-0ecc-48ab-aff88b35bda0', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'5828e9dd-84eb-4506-89c9-a33502de3c51', NULL, NULL)
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'd0cbaa99-a2d9-9ed6-f6cc-dfdf226cb5e9', N'76ad1507-54c6-b67e-9e6b-f29dea6ef024', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'0f9c5f45-4648-2d07-a42a-eb9066b58239', N'a89e96d1-28e7-78d7-1899-e24e92a1b091', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'7a3a078f-5eae-409e-9c8a-cbc966c07893')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'b4a35de7-7969-401d-7bf0-edfc212804fd', N'c08474e0-1060-613f-b6ce-842d7472c18a', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'478c3f4f-d441-af62-f4d4-f3f429601ee0', N'c3b866db-c5c5-7080-63ff-d351ded0f192', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Trans.Id], [Eta.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'230ce4aa-779a-c2ab-f05f-f92a33038d2c', N'8c2367ff-a171-4bf9-b8c6-6584a8737b82', NULL, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'77e9ac7d-92ae-423c-9384-cd6613b50e37')
INSERT [dbo].[AdressesFacturation] ([AdrFac.Id], [AdrFac.Rue], [AdrFac.Num], [AdrFac.CP], [AdrFac.Vil], [AdrFac.Pays], [AdrFac.DateAjout], [Org.Id]) VALUES (N'3173d404-8c53-a6d3-824a-5ba95808e58e', N'Rue de la chèvre', N'77', N'1000', N'Bruxelles', N'Belgique', CAST(N'2021-03-14T11:14:14.440' AS DateTime), N'1dba25dc-9759-4969-9aac-2a43d2530e55')
INSERT [dbo].[AdressesFacturation] ([AdrFac.Id], [AdrFac.Rue], [AdrFac.Num], [AdrFac.CP], [AdrFac.Vil], [AdrFac.Pays], [AdrFac.DateAjout], [Org.Id]) VALUES (N'dad73af9-8b7b-441f-9f50-788adf97bfbe', N'Rue du dédale', N'77', N'1000', N'Bruxelles', N'Belgique', CAST(N'2021-02-14T11:14:14.440' AS DateTime), N'1dba25dc-9759-4969-9aac-2a43d2530e55')
INSERT [dbo].[AdressesFacturation] ([AdrFac.Id], [AdrFac.Rue], [AdrFac.Num], [AdrFac.CP], [AdrFac.Vil], [AdrFac.Pays], [AdrFac.DateAjout], [Org.Id]) VALUES (N'51239f8a-223f-4744-a01a-9156f68d9d9c', N'Rue au bois', N'11', N'1000', N'Bruxelles', N'Belgique', CAST(N'2021-03-13T16:46:15.273' AS DateTime), N'e17db048-7f28-4d66-96c5-bf39167d1556')
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'a73e5e12-ac0f-46ad-bddb-071a9aef89f4', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T09:32:01.607' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'2335134a-4d52-4cb0-bc88-1d14119fe6c6', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'00000000-0000-0000-0000-000000000000', CAST(N'2021-03-06T09:00:01.810' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'5dda8b88-7d86-97c3-c845-22db73d4bfb7', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:40:36.243' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'e31f27b9-f65d-516e-b2fa-254332866b60', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:24:42.870' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'3306b0c4-691b-4219-e4e7-318d1431af29', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:29:31.093' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'6dc8847f-4128-4314-a594-406dedb39089', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T09:34:41.047' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'267b3a41-a02b-e6ee-3bcc-50a643888eaf', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:29:08.083' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'7f49ccf4-f47c-c173-c681-773ad65779f4', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T12:54:59.590' AS DateTime), 1, 3, 0, 0, 5, 0, 0, 4, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'456a1616-4982-9f6b-bf5d-7fb26261b935', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T11:55:00.280' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'6fa854ba-1953-c8ad-eaa7-91cf315ea9e9', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:45:55.003' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'539dbb80-4cd3-85d3-fcc8-9f76fd468b21', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:30:30.860' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'a6a7fc74-2af3-6f17-1a0b-ab15d0cb7ee1', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T09:46:14.720' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'dd396c77-7b17-0ad3-8009-ae8c508da718', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T11:53:11.770' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'988a512f-a115-7178-50ae-b2fa1290adb5', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T12:53:25.477' AS DateTime), 1, 3, 0, 0, 5, 0, 0, 4, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'20f733df-0334-ae2e-9dde-c393fa52d443', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T12:39:16.640' AS DateTime), 1, 3, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'e17d9b5c-2fc2-9c27-4a82-cb7e4298397e', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T09:51:14.257' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'dbcf86b1-c15c-f28e-211a-ce6bae69f2d1', N'6cb609b2-467b-cecd-f2ac-e908d9f7fd65', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T13:01:39.637' AS DateTime), 1, 0, 0, 0, 2, 0, 4, 2, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'afcc6d59-df6f-67dc-9226-d5af8aa97d9a', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T09:36:13.457' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'8287125d-0767-d161-d33f-dd2ec5cdb669', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:23:38.573' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'6bd9947d-f950-1cb2-59f7-ec7f2d207b08', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:41:21.237' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'0a5f21ba-2289-4162-52d5-f07e2c558bb1', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2021-03-06T10:27:50.267' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Org.Id]) VALUES (N'b1e56a71-359d-4614-bae7-f9ed9e11136b', N'64d76149-f428-0e74-fc92-73ef285e2a19', N'00000000-0000-0000-0000-000000000000', CAST(N'2021-03-06T09:06:49.177' AS DateTime), 0, 4, 0, 0, 5, 0, 0, 4, 0, NULL)
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'e7c5ddaf-6b96-43ba-afca-08addb7623fb', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay Red Cap
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(7.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'89f78c9d-5bbe-4438-bd30-208518019894', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay Grande Reserve
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(9.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'64d76149-f428-0e74-fc92-73ef285e2a19', N'6f721dec-1c12-4624-a23d-76d8a1110398', N'2f71579c-d1d1-4a4c-925b-cf5863e01527', N'Kriek', N'', N'', 0, CAST(N'2021-03-06T08:49:01.253' AS DateTime), 1, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(6.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'fd32fe70-1129-4d6e-a187-76828bb770b6', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay ''Premiere''
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(7.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'd0578872-27dc-4fff-8faa-7fdfb6a1288c', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay White Cap
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(8.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'7a3a078f-5eae-409e-9c8a-cbc966c07893', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay 500ieme
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(8.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'77e9ac7d-92ae-423c-9384-cd6613b50e37', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay Blue Cap
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(9.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'38412ac3-8a47-7f75-fb1f-dbf5cc75e473', N'86e7bfbf-326c-458d-bcf0-ec6b00115a90', N'4d36af66-e7d6-40fc-977c-bf53a4011dee', N'Maes', N'', N'', 0, CAST(N'2021-02-21T16:52:02.163' AS DateTime), 1, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(5.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'6cb609b2-467b-cecd-f2ac-e908d9f7fd65', N'48e3133b-c0ba-4e2b-8df5-bbf3be1faf63', N'4d36af66-e7d6-40fc-977c-bf53a4011dee', N'Stella Artois', N'', N'', 0, CAST(N'2021-03-06T08:26:02.847' AS DateTime), 1, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(5.3 AS Decimal(2, 1)))
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Brass. Cochon Vapeur
', N'', N'', N'', N'', N'', N'', N'', N'Resources\Images\Etab\424063c9-fabe-4fe4-be81-7bf58b3392bfchimay-bleu-33cl.jpg', 0, N'', 0, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Abbaye de Scourmont
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'4738f501-0a06-413f-8b2d-6f3af66de361', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Brasserie d''Achouffe
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'6f721dec-1c12-4624-a23d-76d8a1110398', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Belle-Vue
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'caf947c9-3669-4b25-ad3a-877ecf272974', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Bavik
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'3e685c6c-91d7-4c83-b691-a1c201ecd664', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Bosteels
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'4722273e-4ccb-42d3-bad2-b9ba42153306', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Bockor (Vanderghinste)
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'ac590a6f-09d8-4597-9c1e-ba9715234d68', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Brasserie d''Avignon
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'48e3133b-c0ba-4e2b-8df5-bbf3be1faf63', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Artois
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'831a120f-3073-4dc3-bca7-d77b7d3e01ed', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Bios
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'9ce9a979-f72b-4f9e-b024-eb0b33e1c028', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Allard & Groetembril
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'86e7bfbf-326c-458d-bcf0-ec6b00115a90', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Alken-Maes
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
INSERT [dbo].[Etablissements] ([Eta.Id], [Org.Id], [TypEta.Id], [Eta.Nom], [Eta.Tva], [Eta.Rue], [Eta.Num], [Eta.CP], [Eta.Ville], [Eta.Email], [Eta.Web], [Eta.Photo], [Eta.NbVu], [Eta.CoordLong], [Eta.Actif], [Eta.Pays], [Eta.CoordLat]) VALUES (N'000a0ec1-97e5-48cc-8956-ff0b6873f89e', N'00000000-0000-0000-0000-000000000000', N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Brabrux
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, N'Belgique', NULL)
SET IDENTITY_INSERT [dbo].[Factures] ON 

INSERT [dbo].[Factures] ([Fac.Id], [Trans.Id], [AdrFac.Id], [Fac.Date], [Fac.Motif]) VALUES (1, N'd0abd32d-8894-e75b-88ee-0f2b1f50bba4', N'3173d404-8c53-a6d3-824a-5ba95808e58e', CAST(N'2021-03-19T13:22:33.847' AS DateTime), NULL)
INSERT [dbo].[Factures] ([Fac.Id], [Trans.Id], [AdrFac.Id], [Fac.Date], [Fac.Motif]) VALUES (2, N'772cc06f-dfff-6a8e-97ad-a33a1b983276', N'3173d404-8c53-a6d3-824a-5ba95808e58e', CAST(N'2021-03-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Factures] ([Fac.Id], [Trans.Id], [AdrFac.Id], [Fac.Date], [Fac.Motif]) VALUES (3, N'334af9ba-7a1a-620d-e161-ef79082dc26a', N'3173d404-8c53-a6d3-824a-5ba95808e58e', CAST(N'2021-03-22T08:26:04.063' AS DateTime), N'Youplali')
INSERT [dbo].[Factures] ([Fac.Id], [Trans.Id], [AdrFac.Id], [Fac.Date], [Fac.Motif]) VALUES (4, N'4275e580-8419-ac11-7111-0974fc90e300', N'3173d404-8c53-a6d3-824a-5ba95808e58e', CAST(N'2021-03-22T08:32:07.060' AS DateTime), N'Youplali')
SET IDENTITY_INSERT [dbo].[Factures] OFF
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'5c292861-cab5-4964-a64d-39abce3f1623', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Lundi', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'818dab87-96f6-85b6-bff6-53d8df36a4bc', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Dimanche', CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'3c4a9ba9-edf9-b48d-b82f-b9b0ecf6370a', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Mercredi', CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'808b1dc6-3b0b-a6a1-913f-baaaaa9ea217', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'Mercredi', CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'860c52f4-dc56-1f7f-2ab9-cb2edf8c8248', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Samedi', CAST(N'02:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[JoursFermeture] ([Jou.Id], [Eta.Id], [Jou.Date]) VALUES (N'f56c16f9-1135-26e8-7982-286ad870c8f6', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', CAST(N'2021-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[JoursFermeture] ([Jou.Id], [Eta.Id], [Jou.Date]) VALUES (N'4f8336b8-78d2-3e4a-5178-f8d5315df3c9', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', CAST(N'2021-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'00000000-0000-0000-0000-000000000000', N'Administration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'1e157edc-5dfd-46e5-8a7f-017072059a26', N'Vilain Petit Canard', N'tete', N'Rue de la mare', N'59', N'1000', N'Bruxelles', N'Belgique', N'info@petitcanard.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'0c3be60c-9d26-4cbb-bcc5-0ad0cffcbe45', N'Pain d''épices', N'youpla', N'Rue au bois', N'13', N'1000', N'Bruxelles', N'Belgique', N'info@paindepices.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'd6eb4682-2de0-42a8-860e-1fcb0f875fa6', N'sdfsdf', N'fsfsdf', N'fsdfsfs', N'50', N'12123', N'JKjkfjskl', N'qfkfjskl', N'ofskfjkls@fsjkklfjskdl.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'Au Pays des Rêves', N'Be0001', N'Rue des Reves', N'41', N'1000', N'Bruxelles', N'Belgique', N'reves@pays.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'b0cea5f0-1ee8-46d5-bf21-31ebb83f715a', N'Cadeaux', N'Be0002', N'Pole', N'11', N'1000', N'Bruxelles', N'Belgique', N'nord@pole.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'da6d5bba-c807-46ce-82ea-4fb9ee753cd4', N'Océan', N'tetet', N'Rue de la mer', N'52', N'1000', N'Bruxelles', N'Belgique', N'info@ocean.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'bcb27a9b-8f31-4254-91f9-86fe7b65d078', N'Le Loup', N'tetetete', N'Rue du loup', N'53', N'1000', N'Bruxelles', N'Belgique', N'info@leloup.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'e17db048-7f28-4d66-96c5-bf39167d1556', N'Bois Dormant', N'tete', N'Rue du bois', N'11', N'1000', N'Bruxelles', N'Belgique', N'info@boisdormant.be', NULL, NULL)
INSERT [dbo].[TarifsVueBie] ([TarifsVueBie.Id], [TarifsVueBie.NbVue], [TarifsVueBie.Prix], [TarifsVueBie.DateDebut], [TarifsVueBie.DateFin], [TarifsVueBie.Actif]) VALUES (N'465cc609-f1d6-4399-ad43-547b5ba2457b', 10000, CAST(45.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[TarifsVueBie] ([TarifsVueBie.Id], [TarifsVueBie.NbVue], [TarifsVueBie.Prix], [TarifsVueBie.DateDebut], [TarifsVueBie.DateFin], [TarifsVueBie.Actif]) VALUES (N'a1daed6d-650b-4bcb-ac86-6e586441d440', 1000, CAST(5.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'1626b738-0b84-4ca1-8e35-150f53e7b20d', 20000, CAST(95.00 AS Decimal(8, 2)), CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'36372880-07e2-43a0-ab3c-43e7a1eaa391', 10000, CAST(50.00 AS Decimal(8, 2)), CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5645cd32-6f01-4065-b08d-8acc4d5d859e', 350, CAST(2.00 AS Decimal(8, 2)), CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5c14b7d9-7eca-4509-8d0d-a051b4257c9a', 100000, CAST(400.00 AS Decimal(8, 2)), CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5828e9dd-84eb-4506-89c9-a33502de3c51', 500, CAST(3.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'd8841a00-2330-4171-b24a-b295e753f9d2', 750, CAST(22.00 AS Decimal(8, 2)), CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'66018a1f-292e-7e33-3451-0049be07916a', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-21T14:45:27.460' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'4275e580-8419-ac11-7111-0974fc90e300', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CORRECTION', CAST(N'2021-03-22T08:32:23.167' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'd0abd32d-8894-e75b-88ee-0f2b1f50bba4', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T13:22:33.847' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'e17908a0-5275-82d0-2be4-123da388849e', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-22T08:07:29.243' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'0f495d30-5342-9851-76b7-26e3db20319f', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T12:35:39.350' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'943ee363-6456-2d15-5582-2ca662a21b9c', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-21T13:28:38.600' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'796c758a-eb1f-550f-df88-322b1a15c32f', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-20T09:42:55.550' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'd49d0192-45c7-7ccf-13b2-42078436d96d', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T12:34:36.790' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'4801342b-0f54-c705-16d5-4b9582c4cc22', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T14:13:06.080' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'9fb4f527-edf8-0ff0-73c4-50b6cb3eece2', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-21T14:44:03.940' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'9996fd93-44f3-7599-cf03-57b2fda387db', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T14:14:25.870' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'ccc5cb22-82e0-1b80-3e83-5d087702c13d', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-20T09:49:11.717' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'ba4ecca3-b5f0-0dab-0033-5e1b3af11295', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CORRECTION', CAST(N'2021-03-22T07:51:02.720' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'8c2367ff-a171-4bf9-b8c6-6584a8737b82', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-21T14:35:09.973' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'eaa97f8f-d14e-b8fa-e2c3-7aff3cac7de5', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T14:16:52.557' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'0a70fee7-fae3-4922-5f4e-7d8c35aa4551', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-20T09:41:12.437' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'3dc84404-2ec1-9b78-17a5-80e895bafac8', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-21T14:55:36.197' AS DateTime), N'cs_test_a1zFtXEz9S54Gc1k2uTXG2bCxg4K0tY3vaYXa7DEjiJwEGL7T7BPcLDOhZ')
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'd70d1c60-88b0-80be-8b33-8414194b2156', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CORRECTION', CAST(N'2021-03-22T07:59:46.553' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'c08474e0-1060-613f-b6ce-842d7472c18a', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-21T14:53:56.427' AS DateTime), N'cs_test_a19GebNrp5MasHCNz71w1OxYGzMnlfm5CmTsupdVSZ6NHDxG0Ocyb3d7Sm')
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'cd3288e8-2d1f-0a77-e84d-8756220bdeb4', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T12:36:14.470' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'b48fb218-8881-0d4f-bd07-8cf79c0d6903', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CORRECTION', CAST(N'2021-03-22T08:16:08.297' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'debc7a63-9442-d3f2-dff4-94fe7b2106e2', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T12:34:49.990' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'024c5330-b004-e62d-89a3-9963e0f4390b', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T13:15:24.280' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'772cc06f-dfff-6a8e-97ad-a33a1b983276', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CONFIRMED', CAST(N'2021-03-21T15:00:06.883' AS DateTime), N'cs_test_a1JASgFob5XDmTqMh0hlPeVMCKY90Nk4rYYbw1yMmY9Teygnonme8HUkBo')
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'6a87d96e-855e-a41f-f24e-a5a32a7d1782', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-21T14:47:35.717' AS DateTime), N'cs_test_a1vMZnT7fK1S3Jo6M56yeSyKiRCMgkuSXSPosyq9nZ6MkLlVevqrFktjkh')
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'3738fc6d-9f73-0ecc-48ab-aff88b35bda0', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-20T10:21:09.823' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'346d2d5e-5e46-a163-ae5e-b32a69fc2230', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T13:10:47.310' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'c538836e-9957-b8e1-ad8f-b9bc5f2a1f36', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T14:12:18.633' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'c0385f70-a595-6623-b66b-bbaa6fc52819', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-22T08:10:32.893' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'6ff85aca-34e4-d53d-4533-bf8777d77d04', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T13:19:49.103' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'c3b866db-c5c5-7080-63ff-d351ded0f192', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-19T13:23:39.847' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'a89e96d1-28e7-78d7-1899-e24e92a1b091', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-20T09:45:48.677' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'0a041ae3-4bc5-14cd-a0f1-eaa4a258d596', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CORRECTION', CAST(N'2021-03-22T07:48:34.197' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'334af9ba-7a1a-620d-e161-ef79082dc26a', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CORRECTION', CAST(N'2021-03-22T08:26:22.993' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'3bf685f0-7c9f-e219-c58e-f07ff6f43055', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-20T09:39:47.853' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'76ad1507-54c6-b67e-9e6b-f29dea6ef024', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'CORRECTION', CAST(N'2021-03-22T08:08:24.890' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([Trans.Id], [Org.Id], [Trans.Status], [Trans.Date], [Stripe.Id]) VALUES (N'c951e39e-e429-e27d-0e9c-f89ffc7292dd', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'NEW', CAST(N'2021-03-22T08:09:55.377' AS DateTime), NULL)
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'01fbab19-7f61-4ff7-9241-20541152dfb5', N'Blanche')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'3fe1c4f0-ec48-45da-9e1d-957edf66c584', N'Blonde')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'eb8c0896-8a1d-488e-a7be-de3c393c5ae2', N'Brune')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'2f71579c-d1d1-4a4c-925b-cf5863e01527', N'Fruitée')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'b7b2fc14-f09d-4a96-8a5e-095684a608eb', N'Gueuze')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'0881d68e-1abe-4bbd-a077-bb001456153b', N'IPA')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'd06aa710-a47e-4458-9b34-30f11ffb8dc8', N'Noire')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'4d36af66-e7d6-40fc-977c-bf53a4011dee', N'Pils')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'315bfa61-0464-4123-b9bc-6e1332ab3efa', N'Rouge')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'1e668bda-27b8-4828-83ba-c7284a04256d', N'Saison')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Trappiste')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'88d01c50-bc66-4f56-9c63-8ea8725e8c93', N'Triple')
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'1a4397a6-e82d-45af-9e4a-83e138a7f06b', N'Bar')
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Brasserie')
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'34b7a374-3b45-4d69-8484-3be114130c63', N'Magasin')
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'f17d9968-3715-42f8-b7d7-d1abf436c300', N'Restaurant')
INSERT [dbo].[TypesServices] ([TypServ.Id], [TypSer.Libelle]) VALUES (N'61c9074c-f858-4e77-b772-4dcd3a652f41', N'Bouteille')
INSERT [dbo].[TypesServices] ([TypServ.Id], [TypSer.Libelle]) VALUES (N'5a1bc9ac-5e9d-4ee0-a572-12b469b126b5', N'Bouteille & Fût')
INSERT [dbo].[TypesServices] ([TypServ.Id], [TypSer.Libelle]) VALUES (N'306d9375-d60d-47a0-83b0-b9b16305a980', N'Fût')
INSERT [dbo].[VenteBiereEta] ([VenteBiereEta.Id], [Eta.Id], [Bie.Id], [TypServ.Id]) VALUES (N'b565e5f6-756a-1743-73c1-011833455d42', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'fd32fe70-1129-4d6e-a187-76828bb770b6', N'5a1bc9ac-5e9d-4ee0-a572-12b469b126b5')
INSERT [dbo].[VenteBiereEta] ([VenteBiereEta.Id], [Eta.Id], [Bie.Id], [TypServ.Id]) VALUES (N'45041de2-677b-213d-86f6-f2625d82c8c9', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'89f78c9d-5bbe-4438-bd30-208518019894', N'61c9074c-f858-4e77-b772-4dcd3a652f41')
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypesBiere.Nom]    Script Date: 26-03-21 08:56:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypesBiere.Nom] ON [dbo].[TypesBiere]
(
	[TypBie.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypEta.Nom]    Script Date: 26-03-21 08:56:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypEta.Nom] ON [dbo].[TypesEtablissement]
(
	[TypEta.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypesServices.Nom]    Script Date: 26-03-21 08:56:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypesServices.Nom] ON [dbo].[TypesServices]
(
	[TypSer.Libelle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AchatsVues] ADD  CONSTRAINT [DF_AchatsVues_Ach.id]  DEFAULT (newid()) FOR [Ach.Id]
GO
ALTER TABLE [dbo].[AdressesFacturation] ADD  CONSTRAINT [DF_AdressesFacturation_AdrFac.Id]  DEFAULT (newid()) FOR [AdrFac.Id]
GO
ALTER TABLE [dbo].[AvisBiereUser] ADD  CONSTRAINT [DF_AvisBiereUser_AviBieUser.Id]  DEFAULT (newid()) FOR [AviBieUser.Id]
GO
ALTER TABLE [dbo].[Etablissements] ADD  CONSTRAINT [DF_Etablissements_Eta.Id]  DEFAULT (newid()) FOR [Eta.Id]
GO
ALTER TABLE [dbo].[Horaires] ADD  CONSTRAINT [DF_Horaires_Hor.Id]  DEFAULT (newid()) FOR [Hor.Id]
GO
ALTER TABLE [dbo].[JoursFermeture] ADD  CONSTRAINT [DF_JoursFermeture_Jou.Id]  DEFAULT (newid()) FOR [Jou.Id]
GO
ALTER TABLE [dbo].[Organisations] ADD  CONSTRAINT [DF_Organisations_Org.Id]  DEFAULT (newid()) FOR [Org.Id]
GO
ALTER TABLE [dbo].[TarifsVueBie] ADD  CONSTRAINT [DF_TarifsVueBie_TarifsVueBie.Id]  DEFAULT (newid()) FOR [TarifsVueBie.Id]
GO
ALTER TABLE [dbo].[TarifsVueEtab] ADD  CONSTRAINT [DF_TarifsVueEtab_TarifsVueEtab.Id]  DEFAULT (newid()) FOR [TarifsVueEtab.Id]
GO
ALTER TABLE [dbo].[TypesBiere] ADD  CONSTRAINT [DF_TypesBiere_TypBie.Id]  DEFAULT (newid()) FOR [TypBie.Id]
GO
ALTER TABLE [dbo].[TypesEtablissement] ADD  CONSTRAINT [DF_TypesEtablissement_TypEta.Id]  DEFAULT (newid()) FOR [TypEta.Id]
GO
ALTER TABLE [dbo].[TypesServices] ADD  CONSTRAINT [DF_TypesServices_TypServ.Id]  DEFAULT (newid()) FOR [TypServ.Id]
GO
ALTER TABLE [dbo].[VenteBiereEta] ADD  CONSTRAINT [DF_VenteBiereEta_VenteBiereEta.Id]  DEFAULT (newid()) FOR [VenteBiereEta.Id]
GO
ALTER TABLE [dbo].[AchatsVues]  WITH CHECK ADD  CONSTRAINT [FK_AchatsVues_Bieres] FOREIGN KEY([Bie.Id])
REFERENCES [dbo].[Bieres] ([Bie.Id])
GO
ALTER TABLE [dbo].[AchatsVues] CHECK CONSTRAINT [FK_AchatsVues_Bieres]
GO
ALTER TABLE [dbo].[AchatsVues]  WITH CHECK ADD  CONSTRAINT [FK_AchatsVues_Etablissements] FOREIGN KEY([Eta.Id])
REFERENCES [dbo].[Etablissements] ([Eta.Id])
GO
ALTER TABLE [dbo].[AchatsVues] CHECK CONSTRAINT [FK_AchatsVues_Etablissements]
GO
ALTER TABLE [dbo].[AchatsVues]  WITH CHECK ADD  CONSTRAINT [FK_AchatsVues_TarifsVueBie] FOREIGN KEY([TarifsVueBie.Id])
REFERENCES [dbo].[TarifsVueBie] ([TarifsVueBie.Id])
GO
ALTER TABLE [dbo].[AchatsVues] CHECK CONSTRAINT [FK_AchatsVues_TarifsVueBie]
GO
ALTER TABLE [dbo].[AchatsVues]  WITH CHECK ADD  CONSTRAINT [FK_AchatsVues_TarifsVueEtab] FOREIGN KEY([TarifsVueEtab.Id])
REFERENCES [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id])
GO
ALTER TABLE [dbo].[AchatsVues] CHECK CONSTRAINT [FK_AchatsVues_TarifsVueEtab]
GO
ALTER TABLE [dbo].[AchatsVues]  WITH CHECK ADD  CONSTRAINT [FK_AchatsVues_Transactions] FOREIGN KEY([Trans.Id])
REFERENCES [dbo].[Transactions] ([Trans.Id])
GO
ALTER TABLE [dbo].[AchatsVues] CHECK CONSTRAINT [FK_AchatsVues_Transactions]
GO
ALTER TABLE [dbo].[AdressesFacturation]  WITH CHECK ADD  CONSTRAINT [FK_AdressesFacturation_Organisations] FOREIGN KEY([Org.Id])
REFERENCES [dbo].[Organisations] ([Org.Id])
GO
ALTER TABLE [dbo].[AdressesFacturation] CHECK CONSTRAINT [FK_AdressesFacturation_Organisations]
GO
ALTER TABLE [dbo].[AvisBiereUser]  WITH CHECK ADD  CONSTRAINT [FK_AvisBiereUser_Bieres] FOREIGN KEY([Bie.Id])
REFERENCES [dbo].[Bieres] ([Bie.Id])
GO
ALTER TABLE [dbo].[AvisBiereUser] CHECK CONSTRAINT [FK_AvisBiereUser_Bieres]
GO
ALTER TABLE [dbo].[Bieres]  WITH CHECK ADD  CONSTRAINT [FK_Bieres_Etablissements] FOREIGN KEY([Eta.Id])
REFERENCES [dbo].[Etablissements] ([Eta.Id])
GO
ALTER TABLE [dbo].[Bieres] CHECK CONSTRAINT [FK_Bieres_Etablissements]
GO
ALTER TABLE [dbo].[Bieres]  WITH CHECK ADD  CONSTRAINT [FK_Bieres_TypesBiere] FOREIGN KEY([TypBie.Id])
REFERENCES [dbo].[TypesBiere] ([TypBie.Id])
GO
ALTER TABLE [dbo].[Bieres] CHECK CONSTRAINT [FK_Bieres_TypesBiere]
GO
ALTER TABLE [dbo].[Etablissements]  WITH CHECK ADD  CONSTRAINT [FK_Etablissements_Organisations] FOREIGN KEY([Org.Id])
REFERENCES [dbo].[Organisations] ([Org.Id])
GO
ALTER TABLE [dbo].[Etablissements] CHECK CONSTRAINT [FK_Etablissements_Organisations]
GO
ALTER TABLE [dbo].[Etablissements]  WITH CHECK ADD  CONSTRAINT [FK_Etablissements_TypesEtablissement] FOREIGN KEY([TypEta.Id])
REFERENCES [dbo].[TypesEtablissement] ([TypEta.Id])
GO
ALTER TABLE [dbo].[Etablissements] CHECK CONSTRAINT [FK_Etablissements_TypesEtablissement]
GO
ALTER TABLE [dbo].[Factures]  WITH CHECK ADD  CONSTRAINT [FK_Factures_AdressesFacturation] FOREIGN KEY([AdrFac.Id])
REFERENCES [dbo].[AdressesFacturation] ([AdrFac.Id])
GO
ALTER TABLE [dbo].[Factures] CHECK CONSTRAINT [FK_Factures_AdressesFacturation]
GO
ALTER TABLE [dbo].[Factures]  WITH CHECK ADD  CONSTRAINT [FK_Factures_Transactions] FOREIGN KEY([Trans.Id])
REFERENCES [dbo].[Transactions] ([Trans.Id])
GO
ALTER TABLE [dbo].[Factures] CHECK CONSTRAINT [FK_Factures_Transactions]
GO
ALTER TABLE [dbo].[Horaires]  WITH CHECK ADD  CONSTRAINT [FK_Horaires_Etablissements] FOREIGN KEY([Eta.Id])
REFERENCES [dbo].[Etablissements] ([Eta.Id])
GO
ALTER TABLE [dbo].[Horaires] CHECK CONSTRAINT [FK_Horaires_Etablissements]
GO
ALTER TABLE [dbo].[JoursFermeture]  WITH CHECK ADD  CONSTRAINT [FK_JoursFermeture_Etablissements] FOREIGN KEY([Eta.Id])
REFERENCES [dbo].[Etablissements] ([Eta.Id])
GO
ALTER TABLE [dbo].[JoursFermeture] CHECK CONSTRAINT [FK_JoursFermeture_Etablissements]
GO
ALTER TABLE [dbo].[LibrairieUserBieres]  WITH CHECK ADD  CONSTRAINT [FK_LibrairieUserBieres_Bieres] FOREIGN KEY([Bie.Id])
REFERENCES [dbo].[Bieres] ([Bie.Id])
GO
ALTER TABLE [dbo].[LibrairieUserBieres] CHECK CONSTRAINT [FK_LibrairieUserBieres_Bieres]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Organisations] FOREIGN KEY([Org.Id])
REFERENCES [dbo].[Organisations] ([Org.Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Organisations]
GO
ALTER TABLE [dbo].[VenteBiereEta]  WITH CHECK ADD  CONSTRAINT [FK_VenteBiereEta_Bieres1] FOREIGN KEY([Bie.Id])
REFERENCES [dbo].[Bieres] ([Bie.Id])
GO
ALTER TABLE [dbo].[VenteBiereEta] CHECK CONSTRAINT [FK_VenteBiereEta_Bieres1]
GO
ALTER TABLE [dbo].[VenteBiereEta]  WITH CHECK ADD  CONSTRAINT [FK_VenteBiereEta_Etablissements] FOREIGN KEY([Eta.Id])
REFERENCES [dbo].[Etablissements] ([Eta.Id])
GO
ALTER TABLE [dbo].[VenteBiereEta] CHECK CONSTRAINT [FK_VenteBiereEta_Etablissements]
GO
ALTER TABLE [dbo].[VenteBiereEta]  WITH CHECK ADD  CONSTRAINT [FK_VenteBiereEta_TypeServices] FOREIGN KEY([TypServ.Id])
REFERENCES [dbo].[TypesServices] ([TypServ.Id])
GO
ALTER TABLE [dbo].[VenteBiereEta] CHECK CONSTRAINT [FK_VenteBiereEta_TypeServices]
GO
/****** Object:  StoredProcedure [dbo].[GetAchatBieresFacture]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatBieresFacture]
	@FacId INT
AS
BEGIN
	SELECT fact.[Fac.Id], trans.[Org.Id], b.[Bie.Nom],  tvb.[TarifsVueBie.NbVue] AS BieNbVuAch, 
		 tvb.[TarifsVueBie.Prix] AS BiePrix, av.[Ach.Id]
	FROM Factures AS fact 
	INNER JOIN Transactions as trans ON fact.[Trans.Id] = trans.[Trans.Id]
	INNER JOIN AchatsVues AS av ON fact.[Trans.Id] = av.[Trans.Id]
	INNER JOIN TarifsVueBie AS tvb ON av.[TarifsVueBie.Id] = tvb.[TarifsVueBie.Id]
	INNER JOIN Bieres as b ON av.[Bie.Id] = b.[Bie.Id]
	WHERE fact.[Fac.Id] = @FacId;
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatBieresFactureAll]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatBieresFactureAll]

AS
BEGIN
	SELECT fact.[Fac.Id], trans.[Org.Id], b.[Bie.Nom],  tvb.[TarifsVueBie.NbVue] AS BieNbVuAch, 
		 tvb.[TarifsVueBie.Prix] AS BiePrix, av.[Ach.Id]
	FROM Factures AS fact 
	INNER JOIN Transactions as trans ON fact.[Trans.Id] = trans.[Trans.Id]
	INNER JOIN AchatsVues AS av ON fact.[Trans.Id] = av.[Trans.Id]
	INNER JOIN TarifsVueBie AS tvb ON av.[TarifsVueBie.Id] = tvb.[TarifsVueBie.Id]
	INNER JOIN Bieres as b ON av.[Bie.Id] = b.[Bie.Id]
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatBieresFactureOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatBieresFactureOrga]
	@OrgId uniqueidentifier
AS
BEGIN
SELECT fact.[Fac.Id], trans.[Org.Id], b.[Bie.Nom],  tvb.[TarifsVueBie.NbVue] AS BieNbVuAch, 
		 tvb.[TarifsVueBie.Prix] AS BiePrix, av.[Ach.Id]
	FROM Factures AS fact 
	INNER JOIN Transactions as trans ON fact.[Trans.Id] = trans.[Trans.Id]
	INNER JOIN AchatsVues AS av ON fact.[Trans.Id] = av.[Trans.Id]
	INNER JOIN TarifsVueBie AS tvb ON av.[TarifsVueBie.Id] = tvb.[TarifsVueBie.Id]
	INNER JOIN Bieres as b ON av.[Bie.Id] = b.[Bie.Id]
	WHERE trans.[Org.Id] = @OrgId
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatBieresOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatBieresOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT bi.[Bie.Id] AS BieId, bi.[Bie.Nom] as BieNom ,bi.[Bie.NbVu] as BieNbVu, SUM(tvb.[TarifsVueBie.NbVue]) as TVBVueAch
	FROM Bieres AS bi
	INNER JOIN Etablissements AS etab ON bi.[Eta.Id] = etab.[Eta.Id]
	INNER JOIN AchatsVues AS av ON bi.[Bie.Id] = av.[Bie.Id]
	INNER JOIN TarifsVueBie AS tvb ON av.[TarifsVueBie.Id] = tvb.[TarifsVueBie.Id]
	INNER JOIN Transactions as trans ON av.[Trans.Id] = trans.[Trans.Id]
	WHERE etab.[Org.Id] = @OrgId
	AND (trans.[Trans.Status] = 'CONFIRMED'
	OR trans.[Trans.Status] = 'CORRECTION')
	GROUP BY bi.[Bie.Id], bi.[Bie.NbVu], bi.[Bie.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatEtabFacture]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatEtabFacture]
	@FacId INT
AS
BEGIN
	SELECT fact.[Fac.Id], trans.[Org.Id],  e.[Eta.Nom], 
		tve.[TarifsVueEtab.NbVue] AS EtaNbVuAch,  tve.[TarifsVueEtab.Prix] AS EtaPrix, av.[Ach.Id]
	FROM Factures AS fact 
	INNER JOIN Transactions as trans ON fact.[Trans.Id] = trans.[Trans.Id]
	INNER JOIN AchatsVues AS av ON fact.[Trans.Id] = av.[Trans.Id]
	INNER JOIN TarifsVueEtab AS tve ON av.[TarifsVueEtab.Id] = tve.[TarifsVueEtab.Id]
	INNER JOIN Etablissements as e ON av.[Eta.Id] = e.[Eta.Id]
	WHERE fact.[Fac.Id] = @FacId;
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatEtabFactureAll]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatEtabFactureAll]

AS
BEGIN
	SELECT fact.[Fac.Id], trans.[Org.Id],  e.[Eta.Nom], 
		tve.[TarifsVueEtab.NbVue] AS EtaNbVuAch, tve.[TarifsVueEtab.Prix] AS EtaPrix, av.[Ach.Id]
	FROM Factures AS fact 
	INNER JOIN Transactions as trans ON fact.[Trans.Id] = trans.[Trans.Id]
	INNER JOIN AchatsVues AS av ON fact.[Trans.Id] = av.[Trans.Id]
	INNER JOIN TarifsVueEtab AS tve ON av.[TarifsVueEtab.Id] = tve.[TarifsVueEtab.Id]
	INNER JOIN Etablissements as e ON av.[Eta.Id] = e.[Eta.Id]
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatEtabFactureOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatEtabFactureOrga]
	@OrgId uniqueidentifier
AS
BEGIN
SELECT fact.[Fac.Id], trans.[Org.Id], e.[Eta.Nom],
		tve.[TarifsVueEtab.NbVue] AS EtaNbVuAch, tve.[TarifsVueEtab.Prix] AS EtaPrix, av.[Ach.Id]
	FROM Factures AS fact 
	INNER JOIN Transactions as trans ON fact.[Trans.Id] = trans.[Trans.Id]
	INNER JOIN AchatsVues AS av ON fact.[Trans.Id] = av.[Trans.Id]
	INNER JOIN TarifsVueEtab AS tve ON av.[TarifsVueEtab.Id] = tve.[TarifsVueEtab.Id]
	INNER JOIN Etablissements as e ON av.[Eta.Id] = e.[Eta.Id]
	WHERE trans.[Org.Id] = @OrgId
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatEtabsOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAchatEtabsOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT etab.[Eta.Id] as EtaId, etab.[Eta.Nom] as EtaNom, etab.[Eta.NbVu] as EtaNbVu, SUM(tve.[TarifsVueEtab.NbVue]) as TVEVueAch
	FROM Etablissements AS etab
	INNER JOIN AchatsVues AS av ON etab.[Eta.Id] = av.[Eta.Id]
	INNER JOIN TarifsVueEtab AS tve ON av.[TarifsVueEtab.Id] = tve.[TarifsVueEtab.Id]
	INNER JOIN Transactions as trans ON av.[Trans.Id] = trans.[Trans.Id]
	WHERE etab.[Org.Id] = @OrgId
	AND (trans.[Trans.Status] = 'CONFIRMED'
	OR trans.[Trans.Status] = 'CORRECTION')
	GROUP BY etab.[Eta.Id], etab.[Eta.NbVu], etab.[Eta.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAdresseFact]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdresseFact]
	@FacId INT
AS
BEGIN
	SELECT af.[AdrFac.Id], af.[AdrFac.CP], af.[AdrFac.DateAjout], af.[AdrFac.Num], af.[AdrFac.Pays], af.[AdrFac.Rue], af.[AdrFac.Vil], af.[Org.Id]
	FROM Factures as fac
	INNER JOIN AdressesFacturation as af ON fac.[AdrFac.Id] = af.[AdrFac.Id]
	WHERE fac.[Fac.Id] = @FacId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdressesOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdressesOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM AdressesFacturation
	WHERE [Org.Id] = @OrgId

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAchatBieresOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAchatBieresOrga]
AS
BEGIN
	SELECT bi.[Bie.Id] AS BieId, bi.[Bie.Nom] as BieNom ,bi.[Bie.NbVu] as BieNbVu, SUM(tvb.[TarifsVueBie.NbVue]) as TVBVueAch
	FROM Bieres AS bi
	INNER JOIN Etablissements AS etab ON bi.[Eta.Id] = etab.[Eta.Id]
	INNER JOIN AchatsVues AS av ON bi.[Bie.Id] = av.[Bie.Id]
	INNER JOIN TarifsVueBie AS tvb ON av.[TarifsVueBie.Id] = tvb.[TarifsVueBie.Id]
	INNER JOIN Transactions as trans ON av.[Trans.Id] = trans.[Trans.Id]
	WHERE (trans.[Trans.Status] = 'CONFIRMED'
	OR trans.[Trans.Status] = 'CORRECTION')
	GROUP BY bi.[Bie.Id], bi.[Bie.NbVu], bi.[Bie.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAchatEtabsOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAchatEtabsOrga]
AS
BEGIN
	SELECT etab.[Eta.Id] as EtaId, etab.[Eta.Nom] as EtaNom, etab.[Eta.NbVu] as EtaNbVu, SUM(tve.[TarifsVueEtab.NbVue]) as TVEVueAch
	FROM Etablissements AS etab
	INNER JOIN AchatsVues AS av ON etab.[Eta.Id] = av.[Eta.Id]
	INNER JOIN TarifsVueEtab AS tve ON av.[TarifsVueEtab.Id] = tve.[TarifsVueEtab.Id]
	INNER JOIN Transactions as trans ON av.[Trans.Id] = trans.[Trans.Id]
	WHERE (trans.[Trans.Status] = 'CONFIRMED'
	OR trans.[Trans.Status] = 'CORRECTION')
	GROUP BY etab.[Eta.Id], etab.[Eta.NbVu], etab.[Eta.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAvisBiereOrgaToDesactivate]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvisBiereOrgaToDesactivate]
	@OrgaId uniqueidentifier,
	@BieId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM AvisBiereUser
	WHERE [Org.Id] = @OrgaId 
	AND [Bie.Id] = @BieId 
	AND [AviBieUser.Actif] = 1
	AND [AviBieUser.DateAvis] NOT IN (SELECT MAX([AviBieUser.DateAvis])
								FROM AvisBiereUser
								WHERE [Org.Id] = @OrgaId 
								AND [Bie.Id] = @BieId )

END
GO
/****** Object:  StoredProcedure [dbo].[GetAvisBiereUserToDesactivate]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvisBiereUserToDesactivate]
	@UserId uniqueidentifier,
	@BieId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM AvisBiereUser
	WHERE [User.Id] = @UserId 
	AND [Bie.Id] = @BieId 
	AND [AviBieUser.Actif] = 1
	AND [AviBieUser.DateAvis] NOT IN (SELECT MAX([AviBieUser.DateAvis])
								FROM AvisBiereUser
								WHERE [User.Id] = @UserId
								AND [Bie.Id] = @BieId )

END
GO
/****** Object:  StoredProcedure [dbo].[GetBieresOrganistion]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBieresOrganistion]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT bi.[Bie.Id], bi.[Eta.Id] ,bi.[TypBie.Id], bi.[Bie.Nom], bi.[Bie.Desc], bi.[Bie.Photo], bi.[Bie.NbVu], bi.[Bie.DateCre], bi.[Bie.Valide], bi.[User.Id],bi.[Bie.DegreAlcool], bi.[Bie.Actif]
	FROM Bieres AS bi
	INNER JOIN Etablissements AS etab ON bi.[Eta.Id] = etab.[Eta.Id]
	WHERE etab.[Org.Id] = @OrgId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetBieresServiesEtab]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBieresServiesEtab]
	@EtaId uniqueidentifier
AS
BEGIN
	SELECT bi.[Bie.Id], bi.[Eta.Id] ,bi.[TypBie.Id], bi.[Bie.Nom], bi.[Bie.Desc], bi.[Bie.Photo], bi.[Bie.NbVu], bi.[Bie.DateCre], bi.[Bie.Valide], bi.[User.Id],bi.[Bie.DegreAlcool], bi.[Bie.Actif]
	FROM Bieres AS bi
	INNER JOIN VenteBiereEta AS vb ON bi.[Bie.Id] = vb.[Bie.Id]
	WHERE vb.[Eta.Id] = @EtaId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesBieres]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletablesBieres]

AS
BEGIN
	
	SELECT *
	FROM Bieres AS bi
	WHERE bi.[Bie.Id] NOT IN (
		SELECT biere.[Bie.Id]
		FROM Bieres AS biere
		INNER JOIN AchatsVues AS av ON biere.[Bie.Id] = av.[Bie.Id]
		INNER JOIN Factures as fact ON av.[Trans.Id] = fact.[Trans.Id]);


END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesBieresOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletablesBieresOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	
	SELECT bi.[Bie.Id], bi.[Eta.Id] ,bi.[TypBie.Id], bi.[Bie.Nom], bi.[Bie.Desc], bi.[Bie.Photo], bi.[Bie.NbVu], bi.[Bie.DateCre], bi.[Bie.Valide], bi.[User.Id],bi.[Bie.DegreAlcool], bi.[Bie.Actif]
	FROM Bieres AS bi
	INNER JOIN Etablissements AS eta ON bi.[Eta.Id] = eta.[Eta.Id]
	WHERE bi.[Bie.Id] NOT IN (
		SELECT biere.[Bie.Id]
		FROM Bieres AS biere
		INNER JOIN AchatsVues AS av ON biere.[Bie.Id] = av.[Bie.Id]
		INNER JOIN Factures as fact ON av.[Trans.Id] = fact.[Trans.Id])
	AND eta.[Org.Id] = @OrgId;


END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesEta]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletablesEta]

AS
BEGIN
	
	SELECT *
	FROM Etablissements as eta
	WHERE eta.[Eta.Id] NOT IN (
		SELECT etabli.[Eta.Id]
		FROM Etablissements AS etabli
		INNER JOIN AchatsVues AS av ON etabli.[Eta.Id] = av.[Eta.Id]
		INNER JOIN Factures as fact ON av.[Trans.Id] = fact.[Trans.Id]);


END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesEtaOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletablesEtaOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	
	SELECT *
	FROM Etablissements as eta
	WHERE eta.[Eta.Id] NOT IN (
		SELECT etabli.[Eta.Id]
		FROM Etablissements AS etabli
		INNER JOIN AchatsVues AS av ON etabli.[Eta.Id] = av.[Eta.Id]
		INNER JOIN Factures as fact ON av.[Trans.Id] = fact.[Trans.Id])
	AND eta.[Org.Id] = @OrgId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesTarifsBiere]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletablesTarifsBiere]

AS
BEGIN
	
	SELECT *
	FROM TarifsVueBie as tvb
	WHERE tvb.[TarifsVueBie.Id] NOT IN (
		SELECT tarif.[TarifsVueBie.Id]
		FROM TarifsVueBie as tarif
		INNER JOIN AchatsVues AS av ON tarif.[TarifsVueBie.Id] = av.[TarifsVueBie.Id]
		INNER JOIN Factures as fact ON av.[Trans.Id] = fact.[Trans.Id])

END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesTarifsEtab]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletablesTarifsEtab]

AS
BEGIN
	
	SELECT *
	FROM TarifsVueEtab as tve
	WHERE tve.[TarifsVueEtab.Id] NOT IN (
		SELECT tarif.[TarifsVueEtab.Id]
		FROM TarifsVueEtab as tarif
		INNER JOIN AchatsVues AS av ON tarif.[TarifsVueEtab.Id] = av.[TarifsVueEtab.Id]
		INNER JOIN Factures as fact ON av.[Trans.Id] = fact.[Trans.Id])

END
GO
/****** Object:  StoredProcedure [dbo].[GetDernierAvisBiereOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDernierAvisBiereOrga]
	@OrgaId uniqueidentifier,
	@BieId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM AvisBiereUser
	WHERE [Org.Id] = @OrgaId
	AND [AviBieUser.Actif] = 1
	AND [Bie.Id] = @BieId
	AND [AviBieUser.DateAvis] = (SELECT MAX([AviBieUser.DateAvis])
								FROM AvisBiereUser
								WHERE [Org.Id] = @OrgaId
								AND [AviBieUser.Actif] = 1
								AND [Bie.Id] = @BieId )

END
GO
/****** Object:  StoredProcedure [dbo].[GetDernierAvisBiereUser]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDernierAvisBiereUser]
	@UserId uniqueidentifier,
	@BieId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM AvisBiereUser
	WHERE [User.Id] = @UserId
	AND [Bie.Id] = @BieId
	AND [AviBieUser.DateAvis] = (SELECT MAX([AviBieUser.DateAvis])
								FROM AvisBiereUser
								WHERE [User.Id] = @UserId
								AND [Bie.Id] = @BieId )

END
GO
/****** Object:  StoredProcedure [dbo].[GetEtablissementsOrganistion]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEtablissementsOrganistion]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM Etablissements AS etab
	WHERE etab.[Org.Id] = @OrgId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetFacturesOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFacturesOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT fac.[Fac.Id], fac.[Fac.Date], fac.[AdrFac.Id], fac.[Trans.Id], fac.[Fac.Motif]
	FROM Transactions as trans
	INNER JOIN Factures as fac ON trans.[Trans.Id] = fac.[Trans.Id]
	WHERE trans.[Org.Id] = @OrgId

END
GO
/****** Object:  StoredProcedure [dbo].[GetHorairesEtab]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHorairesEtab]
	@EtaId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM Horaires
	WHERE [Eta.Id] = @EtaId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetJoursFermetureEtab]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetJoursFermetureEtab]
	@EtaId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM JoursFermeture
	WHERE [Eta.Id] = @EtaId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetLastAdressesOrga]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastAdressesOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT af.[AdrFac.Id], af.[AdrFac.Rue], af.[AdrFac.Num], af.[AdrFac.CP], af.[AdrFac.Vil], af.[AdrFac.Pays], af.[AdrFac.DateAjout], af.[Org.Id]
	FROM  AdressesFacturation as af
	INNER JOIN Factures as f ON af.[AdrFac.Id] = f.[AdrFac.Id]
	WHERE af.[Org.Id] = @OrgId
	AND f.[Fac.Date] in (SELECT MAX(fact.[Fac.Date]) 
							FROM Factures AS fact
							INNER JOIN Transactions as trans ON fact.[Trans.Id] = trans.[Trans.Id]
							WHERE trans.[Org.Id] = @OrgId)
	GROUP BY af.[AdrFac.Id], af.[AdrFac.Rue], af.[AdrFac.Num], af.[AdrFac.CP], af.[AdrFac.Vil], af.[AdrFac.Pays], af.[AdrFac.DateAjout], af.[Org.Id]

END
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionWithStripeId]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTransactionWithStripeId]
	@StripeId NVARCHAR(255)
AS
BEGIN
	SELECT *
	FROM Transactions as trans
	WHERE trans.[Stripe.Id] = @StripeId

END
GO
/****** Object:  StoredProcedure [dbo].[GetVenteBieresParEtab]    Script Date: 26-03-21 08:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVenteBieresParEtab]
	@EtaId uniqueidentifier
AS
BEGIN
	SELECT *
	FROM VenteBiereEta AS vbe
	WHERE vbe.[Eta.Id] = @EtaId

END
GO
USE [master]
GO
ALTER DATABASE [BeerUp] SET  READ_WRITE 
GO
