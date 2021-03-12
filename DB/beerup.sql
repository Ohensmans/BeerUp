USE [master]
GO
/****** Object:  Database [BeerUp]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[AchatsVues]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[AdressesFacturation]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[AvisBiereUser]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[Bieres]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[Etablissements]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[FactureOrgaAdresse]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[Factures]    Script Date: 12-03-21 16:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factures](
	[Fac.Id] [int] IDENTITY(1,1) NOT NULL,
	[Fac.Date] [datetime] NOT NULL,
	[Fac.Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Factures] PRIMARY KEY CLUSTERED 
(
	[Fac.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horaires]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[JoursFermeture]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[LibrairieUserBieres]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[Organisations]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[TarifsVueBie]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[TarifsVueEtab]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[TypesBiere]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[TypesEtablissement]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[TypesServices]    Script Date: 12-03-21 16:26:16 ******/
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
/****** Object:  Table [dbo].[VenteBiereEta]    Script Date: 12-03-21 16:26:16 ******/
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
INSERT [dbo].[AchatsVues] ([Ach.Id], [Eta.Id], [Fac.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'4e968582-2de6-48ca-a772-0b051171099b', NULL, 1, NULL, N'465cc609-f1d6-4399-ad43-547b5ba2457b', N'e7c5ddaf-6b96-43ba-afca-08addb7623fb')
INSERT [dbo].[AchatsVues] ([Ach.Id], [Eta.Id], [Fac.Id], [TarifsVueEtab.Id], [TarifsVueBie.Id], [Bie.Id]) VALUES (N'60305760-5d71-41c3-9096-0cf876def655', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', 1, N'5c14b7d9-7eca-4509-8d0d-a051b4257c9a', NULL, NULL)
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

INSERT [dbo].[Factures] ([Fac.Id], [Fac.Date], [Fac.Status]) VALUES (1, CAST(N'2020-12-30T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Factures] OFF
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'5c292861-cab5-4964-a64d-39abce3f1623', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Lundi', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'818dab87-96f6-85b6-bff6-53d8df36a4bc', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Dimanche', CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'3c4a9ba9-edf9-b48d-b82f-b9b0ecf6370a', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Mercredi', CAST(N'00:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Horaires] ([Hor.Id], [Eta.Id], [Hor.Jour], [Hor.Debut], [Hor.Fin]) VALUES (N'860c52f4-dc56-1f7f-2ab9-cb2edf8c8248', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', N'Samedi', CAST(N'02:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[JoursFermeture] ([Jou.Id], [Eta.Id], [Jou.Date]) VALUES (N'f56c16f9-1135-26e8-7982-286ad870c8f6', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', CAST(N'2021-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[JoursFermeture] ([Jou.Id], [Eta.Id], [Jou.Date]) VALUES (N'4f8336b8-78d2-3e4a-5178-f8d5315df3c9', N'39b794fe-b6c0-4fe9-a70e-1a4f122062f2', CAST(N'2021-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'00000000-0000-0000-0000-000000000000', N'Administration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'd6eb4682-2de0-42a8-860e-1fcb0f875fa6', N'sdfsdf', N'fsfsdf', N'fsdfsfs', N'50', N'12123', N'JKjkfjskl', N'qfkfjskl', N'ofskfjkls@fsjkklfjskdl.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'Au Pays des Rêves', N'Be0001', N'Rue des Reves', N'41', N'1000', N'Bruxelles', N'Belgique', N'reves@pays.be', NULL, NULL)
INSERT [dbo].[Organisations] ([Org.Id], [Org.Nom], [Org.Tva], [Org.Rue], [Org.Num], [Org.CP], [Org.Ville], [Org.Pays], [Org.Email], [Org.Web], [Org.Photo]) VALUES (N'b0cea5f0-1ee8-46d5-bf21-31ebb83f715a', N'Cadeaux', N'Be0002', N'Pole', N'11', N'1000', N'Bruxelles', N'Belgique', N'nord@pole.be', NULL, NULL)
INSERT [dbo].[TarifsVueBie] ([TarifsVueBie.Id], [TarifsVueBie.NbVue], [TarifsVueBie.Prix], [TarifsVueBie.DateDebut], [TarifsVueBie.DateFin], [TarifsVueBie.Actif]) VALUES (N'465cc609-f1d6-4399-ad43-547b5ba2457b', 10000, CAST(45.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueBie] ([TarifsVueBie.Id], [TarifsVueBie.NbVue], [TarifsVueBie.Prix], [TarifsVueBie.DateDebut], [TarifsVueBie.DateFin], [TarifsVueBie.Actif]) VALUES (N'a1daed6d-650b-4bcb-ac86-6e586441d440', 1000, CAST(5.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'1626b738-0b84-4ca1-8e35-150f53e7b20d', 20000, CAST(95.00 AS Decimal(8, 2)), CAST(N'2021-01-16T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'36372880-07e2-43a0-ab3c-43e7a1eaa391', 10000, CAST(50.00 AS Decimal(8, 2)), CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5645cd32-6f01-4065-b08d-8acc4d5d859e', 350, CAST(2.00 AS Decimal(8, 2)), CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5c14b7d9-7eca-4509-8d0d-a051b4257c9a', 100000, CAST(400.00 AS Decimal(8, 2)), CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'5828e9dd-84eb-4506-89c9-a33502de3c51', 500, CAST(3.00 AS Decimal(8, 2)), CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[TarifsVueEtab] ([TarifsVueEtab.Id], [TarifsVueEtab.NbVue], [TarifsVueEtab.Prix], [TarifsVueEtab.DateDebut], [TarifsVueEtab.DateFin], [TarifsVueEtab.Actif]) VALUES (N'd8841a00-2330-4171-b24a-b295e753f9d2', 750, CAST(22.00 AS Decimal(8, 2)), CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 1)
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
/****** Object:  Index [IX_TypesBiere.Nom]    Script Date: 12-03-21 16:26:17 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypesBiere.Nom] ON [dbo].[TypesBiere]
(
	[TypBie.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypEta.Nom]    Script Date: 12-03-21 16:26:17 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypEta.Nom] ON [dbo].[TypesEtablissement]
(
	[TypEta.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypesServices.Nom]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAchatBieresOrga]    Script Date: 12-03-21 16:26:17 ******/
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
	WHERE etab.[Org.Id] = @OrgId
	GROUP BY bi.[Bie.Id], bi.[Bie.NbVu], bi.[Bie.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAchatEtabsOrga]    Script Date: 12-03-21 16:26:17 ******/
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
	WHERE etab.[Org.Id] = @OrgId
	GROUP BY etab.[Eta.Id], etab.[Eta.NbVu], etab.[Eta.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAchatBieresOrga]    Script Date: 12-03-21 16:26:17 ******/
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
	GROUP BY bi.[Bie.Id], bi.[Bie.NbVu], bi.[Bie.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAchatEtabsOrga]    Script Date: 12-03-21 16:26:17 ******/
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
	GROUP BY etab.[Eta.Id], etab.[Eta.NbVu], etab.[Eta.Nom];

END
GO
/****** Object:  StoredProcedure [dbo].[GetAvisBiereOrgaToDesactivate]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAvisBiereUserToDesactivate]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBieresOrganistion]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBieresServiesEtab]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDeletablesBieres]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDeletablesBieresOrga]    Script Date: 12-03-21 16:26:17 ******/
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
		INNER JOIN AchatsVues AS av ON biere.[Bie.Id] = av.[Bie.Id])
	AND eta.[Org.Id] = @OrgId;


END
GO
/****** Object:  StoredProcedure [dbo].[GetDeletablesEta]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDeletablesEtaOrga]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDeletablesTarifsBiere]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDeletablesTarifsEtab]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDernierAvisBiereOrga]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDernierAvisBiereUser]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetEtablissementsOrganistion]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHorairesEtab]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetJoursFermetureEtab]    Script Date: 12-03-21 16:26:17 ******/
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
/****** Object:  StoredProcedure [dbo].[GetVenteBieresParEtab]    Script Date: 12-03-21 16:26:17 ******/
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
