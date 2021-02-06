USE [master]
GO
/****** Object:  Database [BeerUp]    Script Date: 06-02-21 16:30:12 ******/
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
ALTER DATABASE [BeerUp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BeerUp] SET QUERY_STORE = OFF
GO
USE [BeerUp]
GO
/****** Object:  Table [dbo].[AchatsVues]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchatsVues](
	[Ach.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Eta.Id] [uniqueidentifier] NULL,
	[Fac.Id] [int] NOT NULL,
	[TarifsVueEtab.Id] [uniqueidentifier] NULL,
	[TarifsVueBie.Id] [uniqueidentifier] NULL,
	[Bie.Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AchatsVues] PRIMARY KEY CLUSTERED 
(
	[Ach.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdressesFacturation]    Script Date: 06-02-21 16:30:12 ******/
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
 CONSTRAINT [PK_AdressesFacturation] PRIMARY KEY CLUSTERED 
(
	[AdrFac.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avis]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avis](
	[Avis.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Avis.Acid] [int] NOT NULL,
	[Avis.Cafe] [int] NOT NULL,
	[Avis.Cara] [int] NOT NULL,
	[Avis.Fruit] [int] NOT NULL,
	[Avis.Houb] [int] NOT NULL,
	[Avis.Malt] [int] NOT NULL,
	[Avis.Sucr] [int] NOT NULL,
	[Avis.NoteGlob] [int] NULL,
	[Avis.DateAvis] [datetime] NOT NULL,
 CONSTRAINT [PK_Avis] PRIMARY KEY CLUSTERED 
(
	[Avis.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AvisBiereUser]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvisBiereUser](
	[AviBieUser.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Avis.Id] [uniqueidentifier] NOT NULL,
	[Bie.Id] [uniqueidentifier] NOT NULL,
	[User.Id] [uniqueidentifier] NOT NULL,
	[AviBieUser.DateAvis] [datetime] NOT NULL,
	[AviBieUser.Actif] [bit] NOT NULL,
 CONSTRAINT [PK_AvisBiereUser] PRIMARY KEY CLUSTERED 
(
	[AviBieUser.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bieres]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[Etablissements]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[FactureOrgaAdresse]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactureOrgaAdresse](
	[Org.Id] [uniqueidentifier] NOT NULL,
	[Fac.Id] [int] NOT NULL,
	[AdrFac.Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FactureOrgaAdresse] PRIMARY KEY CLUSTERED 
(
	[Org.Id] ASC,
	[Fac.Id] ASC,
	[AdrFac.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factures]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factures](
	[Fac.Id] [int] IDENTITY(1,1) NOT NULL,
	[Fac.Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Factures] PRIMARY KEY CLUSTERED 
(
	[Fac.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horaires]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[JoursFermeture]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[LibrairieUserBieres]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[Organisations]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[TarifsVueBie]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[TarifsVueEtab]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[TypesBiere]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[TypeServiceVenteBiere]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeServiceVenteBiere](
	[VenteBiereEta.Id] [uniqueidentifier] NOT NULL,
	[TypService.Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TypeServiceVenteBiere] PRIMARY KEY CLUSTERED 
(
	[VenteBiereEta.Id] ASC,
	[TypService.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesEtablissement]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[TypesServices]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  Table [dbo].[VenteBiereEta]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VenteBiereEta](
	[VenteBiereEta.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Eta.Id] [uniqueidentifier] NOT NULL,
	[Bie.Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_VenteBiereEta] PRIMARY KEY CLUSTERED 
(
	[VenteBiereEta.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Avis] ([Avis.Id], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Avis.DateAvis]) VALUES (N'faa5dd8f-d929-4f72-8232-5cfc695c5b6a', 1, 2, 5, 0, 2, 4, 3, NULL, CAST(N'2020-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Avis] ([Avis.Id], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Avis.DateAvis]) VALUES (N'911e0c5b-2594-4c75-ba42-81e0f3bfda53', 3, 2, 2, 0, 1, 2, 2, NULL, CAST(N'2020-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Avis] ([Avis.Id], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Avis.DateAvis]) VALUES (N'8ae210d1-8ab5-4cfb-b571-856c833a457d', 0, 0, 1, 0, 2, 4, 3, NULL, CAST(N'2020-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Avis] ([Avis.Id], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Avis.DateAvis]) VALUES (N'8bb0635d-86a0-4fd3-acbf-beadbb097aa2', 1, 4, 3, 0, 2, 4, 4, NULL, CAST(N'2020-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Avis] ([Avis.Id], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Avis.DateAvis]) VALUES (N'ed3e9303-2fe4-45f3-bb9f-de22a0cbf4e1', 2, 2, 2, 0, 2, 4, 2, NULL, CAST(N'2020-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Avis] ([Avis.Id], [Avis.Acid], [Avis.Cafe], [Avis.Cara], [Avis.Fruit], [Avis.Houb], [Avis.Malt], [Avis.Sucr], [Avis.NoteGlob], [Avis.DateAvis]) VALUES (N'3bde5457-6512-4d96-a868-f61c80e16562', 0, 0, 0, 0, 4, 4, 2, NULL, CAST(N'2020-12-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Avis.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif]) VALUES (N'640876d2-48ee-4925-9499-041e65da0886', N'911e0c5b-2594-4c75-ba42-81e0f3bfda53', N'e7c5ddaf-6b96-43ba-afca-08addb7623fb', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2020-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Avis.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif]) VALUES (N'0359ff5e-bf0c-4742-bde2-3bb55278961a', N'8ae210d1-8ab5-4cfb-b571-856c833a457d', N'fd32fe70-1129-4d6e-a187-76828bb770b6', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2020-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Avis.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif]) VALUES (N'28c9ce90-7483-4737-b45b-a6adc2ec8bb6', N'ed3e9303-2fe4-45f3-bb9f-de22a0cbf4e1', N'7a3a078f-5eae-409e-9c8a-cbc966c07893', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2020-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Avis.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif]) VALUES (N'8884d9ea-b9f5-4220-8755-d26c698dea67', N'3bde5457-6512-4d96-a868-f61c80e16562', N'd0578872-27dc-4fff-8faa-7fdfb6a1288c', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2020-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Avis.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif]) VALUES (N'fc309937-0d75-4a77-af4e-da5238ca5a84', N'faa5dd8f-d929-4f72-8232-5cfc695c5b6a', N'77e9ac7d-92ae-423c-9384-cd6613b50e37', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2020-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisBiereUser] ([AviBieUser.Id], [Avis.Id], [Bie.Id], [User.Id], [AviBieUser.DateAvis], [AviBieUser.Actif]) VALUES (N'64306f7f-a19b-457f-be63-ebde22afc4e4', N'8bb0635d-86a0-4fd3-acbf-beadbb097aa2', N'89f78c9d-5bbe-4438-bd30-208518019894', N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(N'2020-12-30T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'e7c5ddaf-6b96-43ba-afca-08addb7623fb', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay Red Cap
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(7.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'89f78c9d-5bbe-4438-bd30-208518019894', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay Grande Reserve
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(9.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'fd32fe70-1129-4d6e-a187-76828bb770b6', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay ''Premiere''
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(7.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'd0578872-27dc-4fff-8faa-7fdfb6a1288c', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay White Cap
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(8.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'7a3a078f-5eae-409e-9c8a-cbc966c07893', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay 500ieme
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(8.0 AS Decimal(2, 1)))
INSERT [dbo].[Bieres] ([Bie.Id], [Eta.Id], [TypBie.Id], [Bie.Nom], [Bie.Desc], [Bie.Photo], [Bie.NbVu], [Bie.DateCre], [Bie.Valide], [Bie.Actif], [User.Id], [Bie.DegreAlcool]) VALUES (N'77e9ac7d-92ae-423c-9384-cd6613b50e37', N'efc3be54-2787-4b2d-8f7a-441db5645f39', N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Chimay Blue Cap
', NULL, NULL, 0, CAST(N'2020-12-30T00:00:00.000' AS DateTime), 0, 1, N'3314ba79-987a-48d4-9422-4e1018724d59', CAST(9.0 AS Decimal(2, 1)))
GO
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
GO
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'5c292861-cab5-4964-a64d-39abce3f1623', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Lundi', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'818dab87-96f6-85b6-bff6-53d8df36a4bc', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Dimanche', CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'3c4a9ba9-edf9-b48d-b82f-b9b0ecf6370a', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Mercredi', CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'860c52f4-dc56-1f7f-2ab9-cb2edf8c8248', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Samedi', CAST(N'02:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[JoursFermeture] ([Jou.Id], [Eta.Id], [Jou.Date]) VALUES (N'f56c16f9-1135-26e8-7982-286ad870c8f6', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', CAST(N'2021-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[JoursFermeture] ([Jou.Id], [Eta.Id], [Jou.Date]) VALUES (N'4f8336b8-78d2-3e4a-5178-f8d5315df3c9', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', CAST(N'2021-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'00000000-0000-0000-0000-000000000000', N'Administration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'd6eb4682-2de0-42a8-860e-1fcb0f875fa6', N'sdfsdf', N'fsfsdf', N'fsdfsfs', N'50', N'12123', N'JKjkfjskl', N'qfkfjskl', N'ofskfjkls@fsjkklfjskdl.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'Au Pays des Rêves', N'Be0001', N'Rue des Reves', N'41', N'1000', N'Bruxelles', N'Belgique', N'reves@pays.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'b0cea5f0-1ee8-46d5-bf21-31ebb83f715a', N'Cadeaux', N'Be0002', N'Pole', N'11', N'1000', N'Bruxelles', N'Belgique', N'nord@pole.be', NULL, NULL)
GO
INSERT [dbo].[TarifsVueBie] ([TarifsVueBie.Id], [TarifsVueBie.NbVue], [TarifsVueBie.Prix], [TarifsVueBie.DateDebut], [TarifsVueBie.DateFin], [TarifsVueBie.Actif]) VALUES (N'465cc609-f1d6-4399-ad43-547b5ba2457b', 10000, CAST(45.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[TarifsVueBie] ([TarifsVueBie.Id], [TarifsVueBie.NbVue], [TarifsVueBie.Prix], [TarifsVueBie.DateDebut], [TarifsVueBie.DateFin], [TarifsVueBie.Actif]) VALUES (N'a1daed6d-650b-4bcb-ac86-6e586441d440', 1000, CAST(5.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'1626b738-0b84-4ca1-8e35-150f53e7b20d', 20000, CAST(95.00 AS Decimal(8, 2)), CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'36372880-07e2-43a0-ab3c-43e7a1eaa391', 10000, CAST(50.00 AS Decimal(8, 2)), CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5645cd32-6f01-4065-b08d-8acc4d5d859e', 350, CAST(2.00 AS Decimal(8, 2)), CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5c14b7d9-7eca-4509-8d0d-a051b4257c9a', 100000, CAST(400.00 AS Decimal(8, 2)), CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5828e9dd-84eb-4506-89c9-a33502de3c51', 500, CAST(3.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'd8841a00-2330-4171-b24a-b295e753f9d2', 750, CAST(22.00 AS Decimal(8, 2)), CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'01fbab19-7f61-4ff7-9241-20541152dfb5', N'Blanche')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'3fe1c4f0-ec48-45da-9e1d-957edf66c584', N'Blonde')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'eb8c0896-8a1d-488e-a7be-de3c393c5ae2', N'Brune')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'2f71579c-d1d1-4a4c-925b-cf5863e01527', N'Fruitée')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'b7b2fc14-f09d-4a96-8a5e-095684a608eb', N'Gueuze')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'0881d68e-1abe-4bbd-a077-bb001456153b', N'IPA')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'd06aa710-a47e-4458-9b34-30f11ffb8dc8', N'Noire')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'315bfa61-0464-4123-b9bc-6e1332ab3efa', N'Rouge')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'1e668bda-27b8-4828-83ba-c7284a04256d', N'Saison')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'd0e9167f-364d-4824-be7c-fb46dc4b636d', N'Trappiste')
INSERT [dbo].[TypesBiere] ([TypBie.Id], [TypBie.Nom]) VALUES (N'88d01c50-bc66-4f56-9c63-8ea8725e8c93', N'Triple')
GO
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'1a4397a6-e82d-45af-9e4a-83e138a7f06b', N'Bar')
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'd3f9e102-466b-4280-b57f-939cfd544a9b', N'Brasserie')
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'34b7a374-3b45-4d69-8484-3be114130c63', N'Magasin')
INSERT [dbo].[TypesEtablissement] ([TypEta.Id], [TypEta.Nom]) VALUES (N'f17d9968-3715-42f8-b7d7-d1abf436c300', N'Restaurant')
GO
INSERT [dbo].[TypesServices] ([TypServ.Id], [TypSer.Libelle]) VALUES (N'61c9074c-f858-4e77-b772-4dcd3a652f41', N'Bouteille')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypesBiere.Nom]    Script Date: 06-02-21 16:30:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypesBiere.Nom] ON [dbo].[TypesBiere]
(
	[TypBie.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypEta.Nom]    Script Date: 06-02-21 16:30:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypEta.Nom] ON [dbo].[TypesEtablissement]
(
	[TypEta.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypesServices.Nom]    Script Date: 06-02-21 16:30:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypesServices.Nom] ON [dbo].[TypesServices]
(
	[TypSer.Libelle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AchatsVues] ADD  CONSTRAINT [DF_AchatsVues_Ach.id]  DEFAULT (newid()) FOR [Ach.Id]
GO
ALTER TABLE [dbo].[AdressesFacturation] ADD  CONSTRAINT [DF_AdressesFacturation_AdrFac.Id]  DEFAULT (newid()) FOR [AdrFac.Id]
GO
ALTER TABLE [dbo].[Avis] ADD  CONSTRAINT [DF_Avis_Avis.Id]  DEFAULT (newid()) FOR [Avis.Id]
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
ALTER TABLE [dbo].[AchatsVues]  WITH CHECK ADD  CONSTRAINT [FK_AchatsVues_Factures] FOREIGN KEY([Fac.Id])
REFERENCES [dbo].[Factures] ([Fac.Id])
GO
ALTER TABLE [dbo].[AchatsVues] CHECK CONSTRAINT [FK_AchatsVues_Factures]
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
ALTER TABLE [dbo].[AvisBiereUser]  WITH CHECK ADD  CONSTRAINT [FK_AvisBiereUser_Avis] FOREIGN KEY([Avis.Id])
REFERENCES [dbo].[Avis] ([Avis.Id])
GO
ALTER TABLE [dbo].[AvisBiereUser] CHECK CONSTRAINT [FK_AvisBiereUser_Avis]
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
ALTER TABLE [dbo].[FactureOrgaAdresse]  WITH CHECK ADD  CONSTRAINT [FK_AdrFacturation] FOREIGN KEY([AdrFac.Id])
REFERENCES [dbo].[AdressesFacturation] ([AdrFac.Id])
GO
ALTER TABLE [dbo].[FactureOrgaAdresse] CHECK CONSTRAINT [FK_AdrFacturation]
GO
ALTER TABLE [dbo].[FactureOrgaAdresse]  WITH CHECK ADD  CONSTRAINT [FK_Factures] FOREIGN KEY([Fac.Id])
REFERENCES [dbo].[Factures] ([Fac.Id])
GO
ALTER TABLE [dbo].[FactureOrgaAdresse] CHECK CONSTRAINT [FK_Factures]
GO
ALTER TABLE [dbo].[FactureOrgaAdresse]  WITH CHECK ADD  CONSTRAINT [FK_Organisations] FOREIGN KEY([Org.Id])
REFERENCES [dbo].[Organisations] ([Org.Id])
GO
ALTER TABLE [dbo].[FactureOrgaAdresse] CHECK CONSTRAINT [FK_Organisations]
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
ALTER TABLE [dbo].[TypeServiceVenteBiere]  WITH CHECK ADD  CONSTRAINT [FK_TypeServiceVenteBiere_TypesServices] FOREIGN KEY([TypService.Id])
REFERENCES [dbo].[TypesServices] ([TypServ.Id])
GO
ALTER TABLE [dbo].[TypeServiceVenteBiere] CHECK CONSTRAINT [FK_TypeServiceVenteBiere_TypesServices]
GO
ALTER TABLE [dbo].[TypeServiceVenteBiere]  WITH CHECK ADD  CONSTRAINT [FK_TypeServiceVenteBiere_VenteBiereEta] FOREIGN KEY([VenteBiereEta.Id])
REFERENCES [dbo].[VenteBiereEta] ([VenteBiereEta.Id])
GO
ALTER TABLE [dbo].[TypeServiceVenteBiere] CHECK CONSTRAINT [FK_TypeServiceVenteBiere_VenteBiereEta]
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
/****** Object:  StoredProcedure [dbo].[GetBieresOrganistion]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBieresOrganistion]
	@OrgId uniqueidentifier
AS
BEGIN
	SELECT bi.[Bie.Id], bi.[Eta.Id] ,bi.[TypBie.Id], bi.[Bie.Nom], bi.[Bie.Desc], bi.[Bie.Photo], bi.[Bie.NbVu], bi.[Bie.DateCre], bi.[Bie.Valide], bi.[User.Id],bi.[Bie.DegreAlcool]
	FROM Bieres AS bi
	INNER JOIN Etablissements AS etab ON bi.[Eta.Id] = etab.[Eta.Id]
	WHERE etab.[Org.Id] = @OrgId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesBieres]    Script Date: 06-02-21 16:30:12 ******/
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
		INNER JOIN AchatsVues AS av ON biere.[Bie.Id] = av.[Bie.Id]);


END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesBieresOrga]    Script Date: 06-02-21 16:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletablesBieresOrga]
	@OrgId uniqueidentifier
AS
BEGIN
	
	SELECT bi.[Bie.Id], bi.[Eta.Id] ,bi.[TypBie.Id], bi.[Bie.Nom], bi.[Bie.Desc], bi.[Bie.Photo], bi.[Bie.NbVu], bi.[Bie.DateCre], bi.[Bie.Valide], bi.[User.Id],bi.[Bie.DegreAlcool]
	FROM Bieres AS bi
	INNER JOIN Etablissements AS eta ON bi.[Eta.Id] = eta.[Eta.Id]
	WHERE bi.[Bie.Id] NOT IN (
		SELECT biere.[Bie.Id]
		FROM Bieres AS biere
		INNER JOIN AchatsVues AS av ON biere.[Bie.Id] = av.[Bie.Id])
	AND eta.[Org.Id] = @OrgId;


END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesEta]    Script Date: 06-02-21 16:30:12 ******/
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
		INNER JOIN AchatsVues AS av ON etabli.[Eta.Id] = av.[Eta.Id]);


END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesEtaOrga]    Script Date: 06-02-21 16:30:12 ******/
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
		INNER JOIN AchatsVues AS av ON etabli.[Eta.Id] = av.[Eta.Id])
	AND eta.[Org.Id] = @OrgId;

END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesTarifsBiere]    Script Date: 06-02-21 16:30:12 ******/
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
		INNER JOIN AchatsVues AS av ON tarif.[TarifsVueBie.Id] = av.[TarifsVueBie.Id])

END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesTarifsEtab]    Script Date: 06-02-21 16:30:12 ******/
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
		INNER JOIN AchatsVues AS av ON tarif.[TarifsVueEtab.Id] = av.[TarifsVueEtab.Id])

END
GO
/****** Object:  StoredProcedure [dbo].[GetEtablissementsOrganistion]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHorairesEtab]    Script Date: 06-02-21 16:30:12 ******/
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
/****** Object:  StoredProcedure [dbo].[GetJoursFermetureEtab]    Script Date: 06-02-21 16:30:12 ******/
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
USE [master]
GO
ALTER DATABASE [BeerUp] SET  READ_WRITE 
GO
