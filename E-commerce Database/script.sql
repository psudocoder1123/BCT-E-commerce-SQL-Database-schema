USE [master]
GO
/****** Object:  Database [E-Commerce_Website]    Script Date: 20-03-2021 15:34:06 ******/
CREATE DATABASE [E-Commerce_Website]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-Commerce_Website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E-Commerce_Website.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E-Commerce_Website_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\E-Commerce_Website_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [E-Commerce_Website] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-Commerce_Website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-Commerce_Website] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-Commerce_Website] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-Commerce_Website] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-Commerce_Website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-Commerce_Website] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET RECOVERY FULL 
GO
ALTER DATABASE [E-Commerce_Website] SET  MULTI_USER 
GO
ALTER DATABASE [E-Commerce_Website] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-Commerce_Website] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-Commerce_Website] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-Commerce_Website] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E-Commerce_Website] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E-Commerce_Website] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'E-Commerce_Website', N'ON'
GO
ALTER DATABASE [E-Commerce_Website] SET QUERY_STORE = OFF
GO
USE [E-Commerce_Website]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 20-03-2021 15:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[CartId] [int] NOT NULL,
	[CartNo] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[ProductId] [int] NULL,
	[ProductName] [varchar](20) NULL,
	[Sku] [varchar](20) NULL,
	[Price] [smallmoney] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryHandel]    Script Date: 20-03-2021 15:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoryHandel](
	[CategoryId] [int] NULL,
	[parentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 20-03-2021 15:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[CustomerId] [int] NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[BillingAddress] [varchar](40) NOT NULL,
	[DefaultAddress] [varchar](40) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[UserPassword] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderConfirmation]    Script Date: 20-03-2021 15:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderConfirmation](
	[OrderId] [int] NULL,
	[CustomerId] [int] NULL,
	[ProductId] [int] NULL,
	[OrderDateTime] [datetime] NOT NULL,
	[ShipDate] [datetime] NOT NULL,
	[ShippingAddress] [varchar](40) NOT NULL,
	[BillingAddress] [varchar](40) NOT NULL,
	[TotalBill] [smallmoney] NULL,
	[TransactionNumber] [int] NOT NULL,
	[PaymentMode] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 20-03-2021 15:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[OrderId] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [smallmoney] NOT NULL,
	[Quantity] [int] NULL,
	[Sku] [varchar](20) NULL,
	[CartId] [int] NULL,
	[Total] [smallmoney] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 20-03-2021 15:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[ProductId] [int] NOT NULL,
	[ProductName] [varchar](20) NOT NULL,
	[Sku] [varchar](20) NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[ProductDescription] [varchar](20) NULL,
	[Image] [varchar](20) NULL,
	[Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subCategory]    Script Date: 20-03-2021 15:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subCategory](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [varchar](40) NOT NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[product] ([ProductId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[categoryHandel]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[subCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[orderConfirmation]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[customer] ([CustomerId])
GO
ALTER TABLE [dbo].[orderConfirmation]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[orderDetails] ([OrderId])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([CartId])
REFERENCES [dbo].[cart] ([CartId])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[product] ([ProductId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[subCategory]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[product] ([ProductId])
GO
USE [master]
GO
ALTER DATABASE [E-Commerce_Website] SET  READ_WRITE 
GO
