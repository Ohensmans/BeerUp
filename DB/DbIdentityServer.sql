USE [master]
GO
/****** Object:  Database [DbIdentityServer]    Script Date: 06-03-21 15:05:41 ******/
CREATE DATABASE [DbIdentityServer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbIdentityServer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\DbIdentityServer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbIdentityServer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\DbIdentityServer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbIdentityServer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbIdentityServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbIdentityServer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbIdentityServer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbIdentityServer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbIdentityServer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbIdentityServer] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbIdentityServer] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DbIdentityServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbIdentityServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbIdentityServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbIdentityServer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbIdentityServer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbIdentityServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbIdentityServer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbIdentityServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbIdentityServer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbIdentityServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbIdentityServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbIdentityServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbIdentityServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbIdentityServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbIdentityServer] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DbIdentityServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbIdentityServer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbIdentityServer] SET  MULTI_USER 
GO
ALTER DATABASE [DbIdentityServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbIdentityServer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbIdentityServer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbIdentityServer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbIdentityServer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbIdentityServer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DbIdentityServer] SET QUERY_STORE = OFF
GO
USE [DbIdentityServer]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 06-03-21 15:05:41 ******/
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
/****** Object:  Table [dbo].[ApiResourceClaims]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceProperties]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceScopes]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceSecrets]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScopeId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeProperties]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScopeId] [int] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[RequireRequestObject] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCodes]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceClaims]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceProperties]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 06-03-21 15:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201222153840_InitialIdentityServerPersistedGrantDbMigration', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201222153850_InitialIdentityServerConfigurationDbMigration', N'5.0.1')
GO
SET IDENTITY_INSERT [dbo].[ApiResources] ON 

INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1, 1, N'ApiBeerUp', N'Api BeerUp', NULL, NULL, 1, CAST(N'2021-01-09T15:30:59.6637630' AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] ON 

INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (1, N'ApiBeerUp.all', 1)
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1, 1, N'read', N'Read data', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (2, 1, N'write', N'Write data', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (3, 1, N'delete', N'Delete data', NULL, 0, 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (4, 1, N'ApiBeerUp.all', N'All access', NULL, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] ON 

INSERT [dbo].[ClientCorsOrigins] ([Id], [Origin], [ClientId]) VALUES (1, N'http://localhost:4200', 2)
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'authorization_code', 1)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (2, N'client_credentials', 3)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (3, N'hybrid', 3)
INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (4, N'authorization_code', 2)
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (1, N'http://localhost:5000/signout-callback-oidc', 3)
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (2, N'http://localhost:5002/signout-callback-oidc', 1)
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (3, N'http://localhost:4200/', 2)
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON 

INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (1, N'http://localhost:5002/signin-oidc', 1)
INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (2, N'http://localhost:5000/signin-oidc', 3)
INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (3, N'http://localhost:4200/auth-callback', 2)
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (1, 1, N'BeerUpApi', N'oidc', 1, N'BeerUpApi', NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 1, 1, 3600, NULL, 3600, 3600, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-01-09T15:30:59.7452160' AS DateTime2), NULL, NULL, NULL, NULL, 3600, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (2, 1, N'BeerUpWeb', N'oidc', 0, N'BeerUpWeb', NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 1, NULL, 1, NULL, 1, 0, 3600, NULL, 3600, 3600, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-01-09T15:30:59.8249385' AS DateTime2), NULL, NULL, NULL, NULL, 3600, 0)
INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (3, 1, N'IdentityBeerUp', N'oidc', 1, N'IdentityBeerUp', NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 1, NULL, 1, NULL, 1, 1, 3600, NULL, 3600, 3600, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-01-09T15:30:59.8296471' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'role', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'ApiBeerUp.all', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'profile', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'openid', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (5, N'openid', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (6, N'profile', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (7, N'ApiBeerUp.all', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (8, N'role', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (9, N'orgId', 3)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (10, N'orgId', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (11, N'orgId', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (12, N'role', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (13, N'ApiBeerUp.all', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (14, N'openid', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (15, N'profile', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (16, N'Valide', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (17, N'Valide', 2)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (18, N'Valide', 3)
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Value], [Expiration], [Type], [Created]) VALUES (1, 1, NULL, N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=', NULL, N'SharedSecret', CAST(N'2021-01-09T15:30:59.7455061' AS DateTime2))
INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Value], [Expiration], [Type], [Created]) VALUES (2, 3, NULL, N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=', NULL, N'SharedSecret', CAST(N'2021-01-09T15:30:59.8296478' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] ON 

INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (1, 2, N'name')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (2, 2, N'family_name')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (3, 2, N'given_name')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (4, 2, N'middle_name')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (5, 2, N'nickname')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (6, 2, N'preferred_username')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (7, 2, N'profile')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (8, 2, N'picture')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (9, 2, N'website')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (10, 2, N'birthdate')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (11, 2, N'zoneinfo')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (12, 2, N'locale')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (13, 2, N'updated_at')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (14, 3, N'email')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (15, 3, N'email_verified')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (16, 4, N'role')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (17, 5, N'OrgId')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (18, 2, N'gender')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (19, 1, N'sub')
INSERT [dbo].[IdentityResourceClaims] ([Id], [IdentityResourceId], [Type]) VALUES (20, 6, N'valide')
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, CAST(N'2021-01-09T15:30:59.5206662' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'profile', N'User profile', N'Your user profile information (first name, last name, etc.)', 0, 1, 1, CAST(N'2021-01-09T15:30:59.5915802' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (3, 1, N'email', N'Your email address', NULL, 0, 1, 1, CAST(N'2021-01-09T15:30:59.5977502' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (4, 1, N'role', N'User Role', NULL, 0, 0, 1, CAST(N'2021-01-09T15:30:59.6015969' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (5, 1, N'orgId', N'User Organisation Id', NULL, 0, 0, 1, CAST(N'2021-01-09T15:30:59.6021018' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (6, 1, N'Active', N'active', NULL, 0, 0, 1, CAST(N'2021-02-06T14:44:42.4063735' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
GO
/****** Object:  Index [IX_ApiResourceClaims_ApiResourceId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceClaims_ApiResourceId] ON [dbo].[ApiResourceClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceProperties_ApiResourceId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceProperties_ApiResourceId] ON [dbo].[ApiResourceProperties]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 06-03-21 15:05:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceScopes_ApiResourceId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceScopes_ApiResourceId] ON [dbo].[ApiResourceScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiResourceSecrets_ApiResourceId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ApiResourceSecrets_ApiResourceId] ON [dbo].[ApiResourceSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeClaims_ScopeId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeClaims_ScopeId] ON [dbo].[ApiScopeClaims]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeProperties_ScopeId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeProperties_ScopeId] ON [dbo].[ApiScopeProperties]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 06-03-21 15:05:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientProperties_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientProperties_ClientId] ON [dbo].[ClientProperties]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DeviceCodes_DeviceCode]    Script Date: 06-03-21 15:05:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DeviceCodes_DeviceCode] ON [dbo].[DeviceCodes]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeviceCodes_Expiration]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_DeviceCodes_Expiration] ON [dbo].[DeviceCodes]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceClaims_IdentityResourceId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceClaims_IdentityResourceId] ON [dbo].[IdentityResourceClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityResourceProperties_IdentityResourceId]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityResourceProperties_IdentityResourceId] ON [dbo].[IdentityResourceProperties]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 06-03-21 15:05:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersistedGrants_Expiration]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_Expiration] ON [dbo].[PersistedGrants]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_SessionId_Type]    Script Date: 06-03-21 15:05:41 ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_SessionId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[SessionId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceClaims] CHECK CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceProperties] CHECK CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceScopes] CHECK CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceSecrets] CHECK CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeProperties] CHECK CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceClaims] CHECK CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceProperties] CHECK CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId]
GO
USE [master]
GO
ALTER DATABASE [DbIdentityServer] SET  READ_WRITE 
GO
