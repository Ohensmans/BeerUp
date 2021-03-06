USE [master]
GO
/****** Object:  Database [DbUser]    Script Date: 26-03-21 08:58:57 ******/
CREATE DATABASE [DbUser]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbUser', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\DbUser.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbUser_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\DbUser_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbUser] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbUser].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbUser] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbUser] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbUser] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbUser] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbUser] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbUser] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DbUser] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbUser] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbUser] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbUser] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbUser] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbUser] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbUser] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbUser] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbUser] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbUser] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbUser] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbUser] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbUser] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbUser] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbUser] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DbUser] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbUser] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbUser] SET  MULTI_USER 
GO
ALTER DATABASE [DbUser] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbUser] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbUser] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbUser] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbUser] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbUser] SET QUERY_STORE = OFF
GO
USE [DbUser]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26-03-21 08:58:57 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 26-03-21 08:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26-03-21 08:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[isEditable] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26-03-21 08:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26-03-21 08:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26-03-21 08:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26-03-21 08:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[OrgId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Valide] [bit] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 26-03-21 08:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201222154142_InitialIdentityServerIdentityDb', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201227171315_AddValidate', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201230140701_add-isEditable', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201231080633_add-description', N'5.0.1')
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] ON 

INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (1, N'012fbd56-0baa-4afd-b58d-5cf2696db469', N'Access', N'Etablissements')
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (2, N'5e33f7dc-3e3f-464e-acc2-88daf9e1dcd4', N'Access', N'Bieres')
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (3, N'd218b883-bb1c-4e2d-8853-e4161cc8ddf5', N'Access', N'Etablissements')
INSERT [dbo].[AspNetRoleClaims] ([Id], [RoleId], [ClaimType], [ClaimValue]) VALUES (4, N'd218b883-bb1c-4e2d-8853-e4161cc8ddf5', N'Access', N'Bieres')
SET IDENTITY_INSERT [dbo].[AspNetRoleClaims] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator], [isEditable], [Description]) VALUES (N'012fbd56-0baa-4afd-b58d-5cf2696db469', N'GroupEtablissement', N'GROUPETABLISSEMENT', N'87ca41cf-9da4-4314-88c1-6d4ddb558882', N'Role', 1, N'Rôle permettant de gérer les différents établissements de l''organisation')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator], [isEditable], [Description]) VALUES (N'26f8f848-e733-45e3-89ad-ee743ef9d5ab', N'GroupAdmin', N'GROUPADMIN', N'f9b1cd7f-d2ae-4c51-8a4d-2e47584945de', N'Role', 0, N'Administrateur de l''organisation ayant accès à toutes ses ressources')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator], [isEditable], [Description]) VALUES (N'52356cbb-1968-400e-a98d-6cc526b5c06a', N'GroupUser', N'GROUPUSER', N'734f030e-a223-46a5-9fc1-512048f7d957', N'Role', 0, N'Utilisateur de l''organisation sans droit particulier')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator], [isEditable], [Description]) VALUES (N'5e33f7dc-3e3f-464e-acc2-88daf9e1dcd4', N'GroupBiere', N'GROUPBIERE', N'd8345c2a-d0e2-4c6a-92e3-f145a8aef14b', N'Role', 1, N'Rôle permettant de gérer les différentes bières de l''organisation')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator], [isEditable], [Description]) VALUES (N'b222cd1a-15fb-442f-8d0d-408733a17fd0', N'User', N'USER', N'173c45ff-73d6-4b01-931b-d8c6cea93f75', N'Role', 0, N'Utilisateur de l''application Mobile')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator], [isEditable], [Description]) VALUES (N'bb79733e-c9e6-4029-b015-78a40fcfa1fa', N'Administrateur', N'ADMINISTRATEUR', N'e737c2d1-d635-4aa3-a1f6-4d3e9c6150c6', N'Role', 0, N'Administrateur du site')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator], [isEditable], [Description]) VALUES (N'd218b883-bb1c-4e2d-8853-e4161cc8ddf5', N'GroupAchat', N'GROUPACHAT', N'9a207d25-ffcd-4c10-a9c0-6704cf38a488', N'Role', 1, N'Rôle permettant de faire des achats de vues sponsorisées et de consulter les factures')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'3314ba79-987a-48d4-9422-4e1018724d59', N'Achat', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'3314ba79-987a-48d4-9422-4e1018724d59', N'Biere', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (3, N'3314ba79-987a-48d4-9422-4e1018724d59', N'Etablissement', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (4, N'3314ba79-987a-48d4-9422-4e1018724d59', N'Achat', N'2')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (5, N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'Biere', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6, N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'GroupBiereBiere', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8, N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'GroupEtablissementEtab', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (9, N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'GroupEtablissementEtablissements', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (10, N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'GroupBiereBieres', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (11, N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'GroupAchatBieres', N'All')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (12, N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'GroupAchatEtablissements', N'All')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'012fbd56-0baa-4afd-b58d-5cf2696db469')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'40012094-2f7b-4136-a711-9c1dc70c65d7', N'26f8f848-e733-45e3-89ad-ee743ef9d5ab')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eb7e0754-1f8a-40a6-9fa8-b8c33141a885', N'26f8f848-e733-45e3-89ad-ee743ef9d5ab')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f31d534a-ed72-4bee-abeb-ed23ed671867', N'26f8f848-e733-45e3-89ad-ee743ef9d5ab')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'22373c7b-9864-482a-a716-643cea9476fa', N'52356cbb-1968-400e-a98d-6cc526b5c06a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'237d070a-fdf6-4c03-bc27-6bb6dd7bdaf3', N'52356cbb-1968-400e-a98d-6cc526b5c06a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'505abd8e-fba6-40e1-accf-2f45b36cc4d3', N'52356cbb-1968-400e-a98d-6cc526b5c06a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b4141f68-b806-482b-bd0b-e4d48c2907a0', N'52356cbb-1968-400e-a98d-6cc526b5c06a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'5e33f7dc-3e3f-464e-acc2-88daf9e1dcd4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3314ba79-987a-48d4-9422-4e1018724d59', N'bb79733e-c9e6-4029-b015-78a40fcfa1fa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'd218b883-bb1c-4e2d-8853-e4161cc8ddf5')
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'115ddf6f-93e2-4d1b-8c90-3aad1e129152', N'00000000-0000-0000-0000-000000000000', N'fsjdfhsdjk@fsdkfsjk.be', N'FSJDFHSDJK@FSDKFSJK.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEGZaLcT09QsSioTc5I14duR+bThKd2AI4M4gccKXtXpHiPJBIkblAgt5Juwl9DYMLA==', N'4PBN6UPQIZFBNZKM3W3SDWF2WRTVF7J5', N'9eb30ac1-ced7-4d12-b97c-1323ce655458', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'201d1a5e-ccd9-4368-a7c3-802937b01fb2', N'00000000-0000-0000-0000-000000000000', N'dsqdqsdq@fjsdkfsd.be', N'DSQDQSDQ@FJSDKFSD.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEHHrDagRSuFLz7j9V934L/u5Rd/lSu2Q3P1KcJ0c0vXsvxdTn+xcE2iyORuQsp/6yw==', N'LKPHTJWZLEBROXWVYXOOYBNGED5SMDEE', N'b0c1e1af-8534-419b-bcf4-e7a1a457c50f', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'22373c7b-9864-482a-a716-643cea9476fa', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'chaperon@rouge.be', N'CHAPERON@ROUGE.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEI6fKFMvz4xN2VeNt4zq4eCVXQ2Vj7feUr69O/I1irVvqoHF0g6dxvAlLPFLEPOd+Q==', N'PLQ7TYGOBSRZIYHPJEQ2VK4XHUQUABG2', N'9daeb9f8-0f39-4a42-8ca3-ff29fcc94f83', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'237d070a-fdf6-4c03-bc27-6bb6dd7bdaf3', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'loup@blanc.be', N'LOUP@BLANC.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEMc/12LcKau5xlNMHsg1DKBlisobx0rxpAjloxSwntwG5FuL0qjV+dJb5aSjssLHSQ==', N'FBWOCIAL4TDZC56H6HPNM4CAE3XJX5IJ', N'663c5d3d-69fb-42af-a90b-1b22aa2f1707', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'2a77bea2-e684-4c4a-9e41-01568428ff36', N'00000000-0000-0000-0000-000000000000', N'test@test3.be', N'TEST@TEST3.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEH68e3X54/WVJ38VKyvXGXvn4veo7QKGluo4NQwzIjqjp898KyTaao7/0bgt8o/FlQ==', N'EXDRG5L6GZ43M3E7FUICE35PN3V5SH3P', N'f296a3ad-256a-492d-bb07-9eb553f36a25', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'3314ba79-987a-48d4-9422-4e1018724d59', N'00000000-0000-0000-0000-000000000000', N'alice@merveille.be', N'ALICE@MERVEILLE.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEN2IjHSrYodcgyqPzLa219mXybxQpW2dQAjdTDYXtSimLv0cwy1ZKY9VAcngj8y9NQ==', N'74PZOUWMZ2DUII4USMETC2IUBANMAAR5', N'fa229335-8852-47c8-9678-82d868f3a669', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'40012094-2f7b-4136-a711-9c1dc70c65d7', N'd6eb4682-2de0-42a8-860e-1fcb0f875fa6', N'test@test6.be', N'TEST@TEST6.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEILSGIg4K/Fd/qo5tCizDsbFiqZq/UaJkwe2DkGMGQd7+BoDa/pLND6h4XvKZOikDA==', N'7VWO2RAOZB5OOHPHDAKMVVFUN5SULEF6', N'cefc30ba-edaa-4010-b0a7-8941b1ee65d2', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'476eb092-81a7-4a42-97c3-f448f4f69c39', N'00000000-0000-0000-0000-000000000000', N'youpla@youpli2.be', N'YOUPLA@YOUPLI2.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEN2vg3rNrhECegDeuDIF1CQpno08knsopmNFGsdf77ZuqxpTkzwZhU4BOOCACtwEDg==', N'H4N5RBXE3S4DT7DPDTBUSCFIXQGHEEQZ', N'6a2aba02-1497-4796-8b20-7f4d62adfce8', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'505abd8e-fba6-40e1-accf-2f45b36cc4d3', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'john@longsilver.be', N'JOHN@LONGSILVER.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEGKkulB3vXsGBkBOXXMQj1qkeY2C+8LPrTwVG2VPIvAKKzZvzauTDZQEXDOZhOstOA==', N'UCWIBAOSSW36TDABCRWKOD5L7C6G52QD', N'0b35ebf3-d32d-4ee9-b1ad-7da140217d2f', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'7e2d0c85-70aa-4310-9648-e085fc1dd7e4', N'00000000-0000-0000-0000-000000000000', N'test@jfsdhjfsk.be', N'TEST@JFSDHJFSK.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEJYURUxZNjq3m/aYG9TMs53iDq8O0EcJi5gv8CnPQEQj2q7mToA48hYK2pFd7qa/qw==', N'SM6SSCOTUZPKQKLRGSMA7WSOBEC6I2JH', N'6e2da75c-6b93-4744-8dfd-ebb62969103f', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'967421a7-e50a-437c-b2ff-ea3585a65783', N'00000000-0000-0000-0000-000000000000', N'youpla@youpli.be', N'YOUPLA@YOUPLI.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEKK4KLWHuJ3zYtXa/C1vKcG2qFkI9vKx9dT1e+oFQVJ56TXRq6cQaGGUePY2m/sDwQ==', N'FSJFWH2LDDI2O64UCMNBL2DX3PFMBIZV', N'0c00a3b8-01e6-4d2d-945c-07fa2df2c69b', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'9c0ccdc8-a9ad-40df-b36a-0b06ae64fcbb', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'robinson@crusoe.be', N'ROBINSON@CRUSOE.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEKyyAGVQKxMEn4AIFNJ7UBTy/LMc48UIkshR+LbAUVEEtJ974/b3L63va8g70cHHow==', N'3BBJLS2L4XVM63DY7WPVI72UO7MM3K5L', N'f1d95c66-0ed5-4847-a43e-f91ca045966c', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'af37683d-886b-4b5b-96b4-05e3c11deb38', N'00000000-0000-0000-0000-000000000000', N'dqdqd@dsqdqk.be', N'DQDQD@DSQDQK.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEFcxQKKWE4Xn183PUuabitNJg1yzgPqvk6a7wW8vzwRrdGx0yLHjCyNkdDxXkIRp1A==', N'QNV4X42APQJ4NT2AQB5RZVT4432EX2U7', N'd04f0155-f475-478d-ae5c-8ddcd16acc27', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'b4141f68-b806-482b-bd0b-e4d48c2907a0', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'test@test2.be', N'TEST@TEST2.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEKoylfJDllstE3FRXAauNz61fkX46ZB4DTNQ/lZLXoFHDcaENEThZQ91Sc5xQoEk4g==', N'VISOFT2K5JVRPGO7Z3HLDEFFACP5NDVR', N'999e5fd1-37f1-4950-a949-ec2a5ab6b3eb', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'eb7e0754-1f8a-40a6-9fa8-b8c33141a885', N'b0cea5f0-1ee8-46d5-bf21-31ebb83f715a', N'saint@nicolas.be', N'SAINT@NICOLAS.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEI+VTcJDIdm7RIjnJ7ZF2nz5s3Gb/bgB1/Sud0oAbCMnF5Ygz1N8fDf3WNt/WM9ggg==', N'PQ3O7XUSCXHVC23BMVSSZJJ7VHNG6FTN', N'3de14394-164d-430e-8e4a-877b5a728052', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'ef782775-5862-43d4-835f-6c812e0baee2', N'00000000-0000-0000-0000-000000000000', N'test@test.be', N'TEST@TEST.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEHB1KfpLTa5UjnwgyFo7hB/f0A5cKORGrrZ2XK246z91siTeLo4a0hFph0Y/HM7/JA==', N'QP2JNJPZ45RWYQLAZWO3RPNHMLB3AXCW', N'61e36bd7-37d2-4d8e-9bc0-9294f179e1e7', NULL, 0, 0, NULL, 1, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [OrgId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Valide]) VALUES (N'f31d534a-ed72-4bee-abeb-ed23ed671867', N'1dba25dc-9759-4969-9aac-2a43d2530e55', N'jack@london.be', N'JACK@LONDON.BE', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEJg657w5g0wcwAYSQG4+BLUCj7cYl5//2Lebj8I4UKADu7shxFtCoHeONMVu7jahCQ==', N'IHIPIWIKG64FOPPGCAZWHS5XU6V6XJZH', N'17a73520-ffdd-4550-bf89-f972eb925bfb', NULL, 0, 0, NULL, 1, 0, 1)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 26-03-21 08:58:57 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 26-03-21 08:58:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 26-03-21 08:58:57 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 26-03-21 08:58:57 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 26-03-21 08:58:57 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 26-03-21 08:58:57 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 26-03-21 08:58:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoles] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoles] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isEditable]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Valide]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [DbUser] SET  READ_WRITE 
GO
