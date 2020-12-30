USE [master]
GO
/****** Object:  Database [BeerUp]    Script Date: 30-12-20 11:35:37 ******/
CREATE DATABASE BeerUp
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
/****** Object:  Table [dbo].[AchatsVues]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[AdressesFacturation]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[Avis]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[AvisBiereUser]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[Bieres]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[Etablissements]    Script Date: 30-12-20 11:35:37 ******/
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
	[Eta.Coord] [nvarchar](100) NULL,
	[Eta.Actif]  AS ((1)),
 CONSTRAINT [PK_Etablissements] PRIMARY KEY CLUSTERED 
(
	[Eta.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactureOrgaAdresse]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[Factures]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[LibrairieUserBieres]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[Organisations]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[TarifsVueBie]    Script Date: 30-12-20 11:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifsVueBie](
	[TarifsVueBie.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TarifsVueBie.NbVue] [bigint] NOT NULL,
	[TarifsVueBie.Prix] [decimal](8, 2) NOT NULL,
	[TarifsVueBie.DateCre] [datetime] NOT NULL,
	[TarifsVueBie.Actif]  AS ((1)),
 CONSTRAINT [PK_TarifsVueBie] PRIMARY KEY CLUSTERED 
(
	[TarifsVueBie.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifsVueEtab]    Script Date: 30-12-20 11:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifsVueEtab](
	[TarifsVueEtab.Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TarifsVueEtab.NbVue] [bigint] NOT NULL,
	[TarifsVueEtab.Prix] [decimal](8, 2) NOT NULL,
	[TarifsVueEtab.DateCre] [datetime] NOT NULL,
	[TarifsVueEtab.Actif] [bit] NOT NULL,
 CONSTRAINT [PK_TarifsVueEtab] PRIMARY KEY CLUSTERED 
(
	[TarifsVueEtab.Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesBiere]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[TypeServiceVenteBiere]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[TypesEtablissement]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[TypesServices]    Script Date: 30-12-20 11:35:37 ******/
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
/****** Object:  Table [dbo].[VenteBiereEta]    Script Date: 30-12-20 11:35:37 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypesBiere.Nom]    Script Date: 30-12-20 11:35:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypesBiere.Nom] ON [dbo].[TypesBiere]
(
	[TypBie.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypEta.Nom]    Script Date: 30-12-20 11:35:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TypEta.Nom] ON [dbo].[TypesEtablissement]
(
	[TypEta.Nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TypesServices.Nom]    Script Date: 30-12-20 11:35:37 ******/
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
USE [master]
GO
ALTER DATABASE [BeerUp] SET  READ_WRITE 
GO
