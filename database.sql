USE [master]
GO
/****** Object:  Database [FPT_Job_Match_ASM]    Script Date: 17/04/2024 8:46:43 AM ******/
CREATE DATABASE [FPT_Job_Match_ASM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPT_Job_Match_ASM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FPT_Job_Match_ASM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPT_Job_Match_ASM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FPT_Job_Match_ASM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPT_Job_Match_ASM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET  MULTI_USER 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET QUERY_STORE = ON
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FPT_Job_Match_ASM]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/04/2024 8:46:43 AM ******/
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
/****** Object:  Table [dbo].[Application]    Script Date: 17/04/2024 8:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[CVPicture] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 17/04/2024 8:46:43 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17/04/2024 8:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17/04/2024 8:46:43 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17/04/2024 8:46:43 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17/04/2024 8:46:43 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17/04/2024 8:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[ProfilePicture] [nvarchar](max) NULL,
	[UsernameChangeLimit] [int] NOT NULL,
	[UserType] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 17/04/2024 8:46:43 AM ******/
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
/****** Object:  Table [dbo].[Job]    Script Date: 17/04/2024 8:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[RequiredQualifications] [nvarchar](max) NOT NULL,
	[ApplicationDealine] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Company] [nvarchar](max) NOT NULL,
	[JobPictute] [nvarchar](max) NULL,
	[isApproved] [nvarchar](max) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 17/04/2024 8:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[When] [datetime2](7) NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 17/04/2024 8:46:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReceiverId] [nvarchar](450) NULL,
	[Message] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240403181820_intialCreate', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240404040908_updateApplicationModel', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240405040159_rebuildMigration', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240405154015_addUserType', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406150947_updateApplication', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240407014750_updateApplication2', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240409080302_updateJob', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240409121212_updateApplicationStatus', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240409183713_createNotificationAndUpdateJob', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240415071535_UpdateNotiAndUser', N'7.0.18')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240416154509_CreateChart', N'7.0.18')
GO
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([Id], [JobId], [UserID], [CVPicture], [Status]) VALUES (1, 1, N'8104e53f-2366-44b3-9e2f-c4309c15b9f8', N'db019972-dfc1-4a6a-bdba-d4cdfc48ccd5_cv.png', NULL)
INSERT [dbo].[Application] ([Id], [JobId], [UserID], [CVPicture], [Status]) VALUES (2, 3, N'8104e53f-2366-44b3-9e2f-c4309c15b9f8', N'7906d248-b220-45fa-9cbb-d76c76e73dfe_cv.png', NULL)
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3153a7ce-b989-4069-81b0-ada253cfefff', N'User', N'USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7fa128eb-4e64-48d9-98e3-5132524a58e5', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'3153a7ce-b989-4069-81b0-ada253cfefff')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8104e53f-2366-44b3-9e2f-c4309c15b9f8', N'3153a7ce-b989-4069-81b0-ada253cfefff')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'86210225-d3ab-4874-a07b-2ecb60c6160a', N'3153a7ce-b989-4069-81b0-ada253cfefff')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'3153a7ce-b989-4069-81b0-ada253cfefff')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'7fa128eb-4e64-48d9-98e3-5132524a58e5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [ProfilePicture], [UsernameChangeLimit], [UserType]) VALUES (N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'test1@gmail.com', N'TEST1@GMAIL.COM', N'test1@gmail.com', N'TEST1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEHIbVsAOQgKPUArCQ/JGkMqI/I+e8nX/AOu1BV5LJJO0lclAJjvCtetxs+hFRuJ2YQ==', N'EJUNPT4YYWJAY4D2VGSE2KPHJGCPMK66', N'e6a6aaed-15f5-4360-90f1-4ed9d3159011', N'16789296795', 1, 1, NULL, 1, 0, N'Dao Van', N'Hieu', NULL, 10, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [ProfilePicture], [UsernameChangeLimit], [UserType]) VALUES (N'8104e53f-2366-44b3-9e2f-c4309c15b9f8', N'mod@gmail.com', N'MOD@GMAIL.COM', N'mod@gmail.com', N'MOD@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAELhNoqd3CqqKaJgTwBKZp+UD8zh97/j+uPuAT/GH2mbvP/1m4ZWNigcSz8Lg6FI5bg==', N'KEPJ7EYORB5GTIJDTGD4P7YFIR2TQFWG', N'2257c521-b785-4e99-94d1-a6f40d9d821e', NULL, 0, 0, NULL, 1, 0, N'Dao Van', N'Hieu', NULL, 10, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [ProfilePicture], [UsernameChangeLimit], [UserType]) VALUES (N'86210225-d3ab-4874-a07b-2ecb60c6160a', N'test3@gmail.com', N'TEST3@GMAIL.COM', N'test3@gmail.com', N'TEST3@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFkhp8Os7KvpcBisv5nkrzy/dYtA4WI+lI9LUGJ/JVU4/5zepoVnY5G0jVEfNOIEOQ==', N'7IZRMBWXSXPFNBSGRAHR2Q6S7KDMZGUQ', N'689ceccc-9f0e-441c-b703-24f41a0f4bf2', NULL, 0, 0, NULL, 1, 0, N'Nguyen Thanh ', N'Nam', NULL, 10, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [ProfilePicture], [UsernameChangeLimit], [UserType]) VALUES (N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'test2@gmail.com', N'TEST2@GMAIL.COM', N'test2@gmail.com', N'TEST2@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJeHg1bzWaL51GBu9uf1a1ijqr1sxE5M9bb3YHtxo1Xr8xYUWbQnCad9OY3v2893Kw==', N'KQWA7AILC35DZYD7O75AKHQPZ4K5SFQG', N'a29b5dd0-0582-4356-ac26-655c14e20ccf', N'16789296795', 1, 1, NULL, 1, 0, N'Dam Hong', N'Hai', NULL, 10, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [ProfilePicture], [UsernameChangeLimit], [UserType]) VALUES (N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAECEwb9k3+2ws5VNThQq/NOpIPomikIQvrNq6KRI44x6Nqo2E0Un1fJR2rZUSxBfqPQ==', N'QUTMU5XCP4VDTEQEPZI3ZX3X4Q5VVSRM', N'7c9a941e-7d01-43b7-adfc-9207b76c126d', NULL, 1, 0, NULL, 1, 0, N'Dao Van', N'Hieu', NULL, 10, 2)
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'[AspNetUserStore]', N'AuthenticatorKey', N'B3AXDFB6PDEQ6PJYIIBK5LQ54U5JHH7O')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'[AspNetUserStore]', N'RecoveryCodes', N'YQ74W-KC3QY;98PNK-C368W;R9R3T-F3CHN;YHFKV-FP2W8;QH669-5D2PN;V6FR4-276RM;MYXW9-V3HJP;N2XNW-T35WT;VVY5D-NTFCQ;CMGTV-CPTHR')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'[AspNetUserStore]', N'AuthenticatorKey', N'LSKZQO4N6GDQ2DDJPGLUNTWDNTE4GFLR')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'[AspNetUserStore]', N'RecoveryCodes', N'37F2Y-CVNP8;66C28-YPRMJ;R8N4C-73YR4;2PPQH-WCF6C;VWXYP-NWN3B;BHJVW-T6THX;DTPFG-99W5G;MQG5V-WQ8F5;JCQY2-K67CT;GHDTX-C6K23')
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([Id], [Title], [Description], [RequiredQualifications], [ApplicationDealine], [Address], [UserId], [Company], [JobPictute], [isApproved]) VALUES (1, N'(Junior/Middle/Senior) Java API Engineer', N'(Junior/Middle/Senior) Java API Engineer', N'Must-have:  A pragmatic mindset. Outstanding problem-solving ability, eagerness to learn, and curiosity. A few years of software development experience with one or more general-purpose programming languages. Strong database and schema design for large-scale applications. Adaptable attitude and personality that is ready for continuous change. Collaboration and culture fit in the Agile experience will be an advantage. Good English skills.', CAST(N'2024-04-18T00:19:00.0000000' AS DateTime2), N'Ha Noi, Viet Nam', N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'FPT software', N'4857fdd4-a3db-4fb7-bddb-d56a508c2dc3_Job.png', N'Accepted')
INSERT [dbo].[Job] ([Id], [Title], [Description], [RequiredQualifications], [ApplicationDealine], [Address], [UserId], [Company], [JobPictute], [isApproved]) VALUES (2, N'Senior JAVA Developer', N'As a senior Java developer, you will participate in the development stage of projects and work alongside highly talented & motivated team members passionate about solving hard, real world problems with our unique and category defining SaaS platform. You will have a voice and make a tremendous impact on what you''re building from the ground up. ', N'Design & implement complex system Develop real-time data streaming processing platforms; Develop smart/autonomous retail store systems; Work on latest Microservices, Service Mesh, Big Data, AI/Machine Learning & IoT  technologies; Delight enterprise customers across multi-billion dollar industries in APAC; Fulfill tasks assigned by team leader or project manager.', CAST(N'2024-04-25T00:47:00.0000000' AS DateTime2), N'373-375 Nguyễn Trọng Tuyển, Phường 2, Tan Binh, Ho Chi Minh', N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'ZAMO', N'9b2628b1-8112-4e15-9969-156e993ccc67_Job.png', N'Accepted')
INSERT [dbo].[Job] ([Id], [Title], [Description], [RequiredQualifications], [ApplicationDealine], [Address], [UserId], [Company], [JobPictute], [isApproved]) VALUES (3, N'Ban CNTT - Odoo Developer (Python/ HTML/ CSS)', N'Ban Công nghệ thông tin (CNTT) là cơ quan tham mưu, định hướng, xây dựng chiến lược CNTT/ Trí tuệ nhân tạo (Artificial Intelligence –AI)/ An toàn thông tin (ATTT) và giám sát đảm bảo việc thực thi chiến lược CNTT/AI/ATTT, đảm bảo hoạt động CNTT/AI/ATTT đồng bộ với chiến lược của Tập đoàn, đảm bảo chất lượng hệ thống/dịch vụ CNTT/AI trong quá trình phát triển và đảm bảo an toàn thông tin cho toàn Tập đoàn.', N'Tốt nghiệp Đại học loại khá trở lên chuyên ngành Công Nghệ Thông Tin, Toán Tin hoặc ngành tương đương. Thành thạo tiếng anh, TOIEC >=550 hoặc tương đương. Kiến thức về các quy trình phát triển phần mềm, an toàn thông tin. Thành thạo ngôn ngữ lập trình Python.  Có kinh nghiệm trong Framework Odoo một trong những Module: HRM, CRM, Finance, Assets… Thành thạo HTML, CSS, Javascript. Thành thạo CSDL: Postgresql, …', CAST(N'2024-04-25T00:55:00.0000000' AS DateTime2), N' Lô D26 Khu đô thị mới Cầu Giấy, Phường Yên Hòa, Cau Giay, Ha Noi ', N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'Viettel Group', N'4ef42002-24b3-414e-a985-fb773262f24d_Job.png', N'Accepted')
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (1, N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'Your ''employer account upgrade'' is pending approval.', 0)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (3, N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'Your account upgrade request has been approved.', 0)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (4, N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'Your account upgrade request has been approved.', 0)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (6, N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'A new job ''(Junior/Middle/Senior) Java API Engineer'' is pending for approval.', 0)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (7, N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'A new job ''Senior JAVA Developer'' is pending for approval.', 0)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (8, N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'User with email ''test2@gmail.com'' wants to upgrade account to Employer.', 0)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (9, N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'Your ''employer account upgrade'' is pending approval.', 1)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (10, N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'Your account upgrade request has been approved.', 1)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (11, N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'Your ''Senior JAVA Developer'' job has been approved.', 0)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (12, N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'A new job ''Ban CNTT - Odoo Developer (Python/ HTML/ CSS)'' is pending for approval.', 1)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (13, N'efe230d7-ecd8-4e81-a102-76ca299225ae', N'A new job ''Ban CNTT - Odoo Developer (Python/ HTML/ CSS)'' is pending for approval.', 1)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (14, N'8fd380f1-3b29-4ac3-91d2-535f239d4eab', N'Your ''Ban CNTT - Odoo Developer (Python/ HTML/ CSS)'' job has been approved.', 1)
INSERT [dbo].[Notification] ([Id], [ReceiverId], [Message], [IsRead]) VALUES (15, N'43f9b1b7-ddf3-4d26-9ef1-310dece4dd56', N'Your ''(Junior/Middle/Senior) Java API Engineer'' job has been approved.', 1)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
/****** Object:  Index [IX_Application_JobId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Application_JobId] ON [dbo].[Application]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Application_UserID]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Application_UserID] ON [dbo].[Application]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Job_UserId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Job_UserId] ON [dbo].[Job]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Message_UserId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Message_UserId] ON [dbo].[Message]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Notification_ReceiverId]    Script Date: 17/04/2024 8:46:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Notification_ReceiverId] ON [dbo].[Notification]
(
	[ReceiverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application] ADD  DEFAULT ((0)) FOR [JobId]
GO
ALTER TABLE [dbo].[Application] ADD  DEFAULT (N'') FOR [UserID]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [UsernameChangeLimit]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [UserType]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT (N'') FOR [Company]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Job_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Job_JobId]
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
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_AspNetUsers_ReceiverId] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_AspNetUsers_ReceiverId]
GO
USE [master]
GO
ALTER DATABASE [FPT_Job_Match_ASM] SET  READ_WRITE 
GO
