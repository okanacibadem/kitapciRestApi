USE [master]
GO
/****** Object:  Database [Kitapci]    Script Date: 25.02.2022 20:24:15 ******/
CREATE DATABASE [Kitapci]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kitapci', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\Kitapci.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kitapci_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\Kitapci_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kitapci] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kitapci].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kitapci] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kitapci] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kitapci] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kitapci] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kitapci] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kitapci] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kitapci] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kitapci] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kitapci] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kitapci] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kitapci] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kitapci] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kitapci] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kitapci] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kitapci] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kitapci] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kitapci] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kitapci] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kitapci] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kitapci] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kitapci] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kitapci] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kitapci] SET RECOVERY FULL 
GO
ALTER DATABASE [Kitapci] SET  MULTI_USER 
GO
ALTER DATABASE [Kitapci] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kitapci] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kitapci] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kitapci] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kitapci] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kitapci] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kitapci', N'ON'
GO
ALTER DATABASE [Kitapci] SET QUERY_STORE = OFF
GO
USE [Kitapci]
GO
/****** Object:  Table [dbo].[Alisveris]    Script Date: 25.02.2022 20:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alisveris](
	[alisverisid] [int] IDENTITY(1,1) NOT NULL,
	[kitap] [varchar](50) NULL,
	[ogrenci] [varchar](50) NULL,
	[alistarihi] [date] NULL,
	[iadetarihi] [date] NULL,
	[veren] [varchar](50) NULL,
 CONSTRAINT [PK_Alisveris] PRIMARY KEY CLUSTERED 
(
	[alisverisid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dolaplar]    Script Date: 25.02.2022 20:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dolaplar](
	[dolapno] [int] IDENTITY(1,1) NOT NULL,
	[dolapadi] [varchar](50) NULL,
 CONSTRAINT [PK_Dolaplar] PRIMARY KEY CLUSTERED 
(
	[dolapno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenelBilgiler]    Script Date: 25.02.2022 20:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenelBilgiler](
	[gbid] [int] IDENTITY(1,1) NOT NULL,
	[okuladi] [varchar](50) NULL,
	[mudur] [varchar](50) NULL,
	[egitimyili] [varchar](50) NULL,
	[sorumlu] [varchar](50) NULL,
	[kitapgunsayisi] [int] NULL,
 CONSTRAINT [PK_GenelBilgiler] PRIMARY KEY CLUSTERED 
(
	[gbid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 25.02.2022 20:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[kitapid] [int] IDENTITY(1,1) NOT NULL,
	[barkod] [int] NULL,
	[kitapadi] [varchar](50) NULL,
	[yazar] [varchar](50) NULL,
	[yayinevi] [varchar](50) NULL,
	[turu] [varchar](50) NULL,
	[basimtarihi] [date] NULL,
	[konum] [varchar](50) NULL,
	[konumsira] [varchar](50) NULL,
	[aciklama] [varchar](50) NULL,
	[durum] [varchar](50) NULL,
	[okunma] [varchar](50) NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[kitapid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 25.02.2022 20:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[kullaniciid] [int] IDENTITY(1,1) NOT NULL,
	[adsoyad] [varchar](50) NULL,
	[kullaniciadi] [varchar](50) NULL,
	[sifre] [int] NULL,
	[rol] [varchar](50) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[kullaniciid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 25.02.2022 20:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[ogrno] [int] IDENTITY(1,1) NOT NULL,
	[adsoyad] [varchar](50) NULL,
	[sinif] [varchar](50) NULL,
 CONSTRAINT [PK_Ogrenciler] PRIMARY KEY CLUSTERED 
(
	[ogrno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siniflar]    Script Date: 25.02.2022 20:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siniflar](
	[sinifid] [int] IDENTITY(1,1) NOT NULL,
	[sinifadi] [varchar](50) NULL,
 CONSTRAINT [PK_Siniflar] PRIMARY KEY CLUSTERED 
(
	[sinifid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kitaplar] ON 

INSERT [dbo].[Kitaplar] ([kitapid], [barkod], [kitapadi], [yazar], [yayinevi], [turu], [basimtarihi], [konum], [konumsira], [aciklama], [durum], [okunma]) VALUES (1, NULL, N'Otomatik Portakal', N'bilmem', N'inkilap', N'roman', NULL, N'istanbul', N'1', N'çok iyi kitap', N'ktif', N'10')
INSERT [dbo].[Kitaplar] ([kitapid], [barkod], [kitapadi], [yazar], [yayinevi], [turu], [basimtarihi], [konum], [konumsira], [aciklama], [durum], [okunma]) VALUES (2, NULL, N'Otomatik Portakal', N'bilmem', N'inkilap', N'roman', NULL, N'istanbul', N'1', N'çok iyi kitapdir abi', N'ktif', N'10')
INSERT [dbo].[Kitaplar] ([kitapid], [barkod], [kitapadi], [yazar], [yayinevi], [turu], [basimtarihi], [konum], [konumsira], [aciklama], [durum], [okunma]) VALUES (3, NULL, N'Otomatik Portakal', N'bilmem', N'inkilap', N'roman', NULL, N'istanbul', N'1', N'çok iyi kitapdir abi', N'ktif', N'10')
INSERT [dbo].[Kitaplar] ([kitapid], [barkod], [kitapadi], [yazar], [yayinevi], [turu], [basimtarihi], [konum], [konumsira], [aciklama], [durum], [okunma]) VALUES (4, NULL, N'Otomatik Portakal', N'bilmem', N'inkilap', N'roman', NULL, N'istanbul', N'1', N'çok iyi kitapdir abi', N'ktif', N'10')
INSERT [dbo].[Kitaplar] ([kitapid], [barkod], [kitapadi], [yazar], [yayinevi], [turu], [basimtarihi], [konum], [konumsira], [aciklama], [durum], [okunma]) VALUES (5, NULL, N'Otomatik Portakal', N'bilmem', N'inkilap', N'roman', NULL, N'istanbul', N'1', N'çok iyi kitapdir abi', N'ktif', N'10')
INSERT [dbo].[Kitaplar] ([kitapid], [barkod], [kitapadi], [yazar], [yayinevi], [turu], [basimtarihi], [konum], [konumsira], [aciklama], [durum], [okunma]) VALUES (6, NULL, N'Otomatik Portakal', N'bilmemddd', N'inkilap', N'roman', NULL, N'istanbul', N'1', N'çok iyi kitapdir abi', N'ktif', N'10')
INSERT [dbo].[Kitaplar] ([kitapid], [barkod], [kitapadi], [yazar], [yayinevi], [turu], [basimtarihi], [konum], [konumsira], [aciklama], [durum], [okunma]) VALUES (7, NULL, N'Otomatik Portakal', N'bilmem', N'inkilap', N'roman', NULL, N'istanbul', N'1', N'çok iyi kitapdir abi', N'ktif', N'10')
SET IDENTITY_INSERT [dbo].[Kitaplar] OFF
GO
USE [master]
GO
ALTER DATABASE [Kitapci] SET  READ_WRITE 
GO
