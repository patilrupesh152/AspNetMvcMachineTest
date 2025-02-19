USE [master]
GO
/****** Object:  Database [ProductTaskDB]    Script Date: 2/16/2025 6:13:44 PM ******/
CREATE DATABASE [ProductTaskDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductTaskDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProductTaskDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductTaskDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProductTaskDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProductTaskDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductTaskDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductTaskDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductTaskDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductTaskDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductTaskDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductTaskDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductTaskDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProductTaskDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductTaskDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductTaskDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductTaskDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductTaskDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductTaskDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductTaskDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductTaskDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductTaskDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProductTaskDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductTaskDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductTaskDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductTaskDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductTaskDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductTaskDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ProductTaskDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductTaskDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductTaskDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProductTaskDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductTaskDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductTaskDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductTaskDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductTaskDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductTaskDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductTaskDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProductTaskDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProductTaskDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/16/2025 6:13:44 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 2/16/2025 6:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/16/2025 6:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250215060253_Init', N'6.0.0')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Electronics')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Clothing')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Groceries')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (10, N'test')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (11, N'asdfg')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (12, N'test')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (14, N'test1')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (1, N'Laptop', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (2, N'Smartphone', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (3, N'Tablet', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (4, N'Smartwatch', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (5, N'Wireless Earbuds', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (6, N'Laptop Charger', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (7, N'Smartphone Case', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (8, N'Bluetooth Speaker', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (9, N'Headphones', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (10, N'Camera', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (11, N'T-Shirt', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (12, N'Jeans', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (13, N'Jacket', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (14, N'Shoes', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (15, N'Sweater', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (16, N'Shorts', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (17, N'Hat', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (18, N'Scarf', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (19, N'Socks', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (20, N'Gloves', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (21, N'Rice', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (22, N'Pasta', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (23, N'Milk', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (24, N'Eggs', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (25, N'Bread', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (26, N'Cheese', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (27, N'Butter', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (28, N'Yogurt', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (29, N'Juice', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (30, N'Tomatoes', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (51, N'Projector', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (52, N'Smart TV', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (53, N'Air Conditioner', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (54, N'Refrigerator', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (55, N'Microwave', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (56, N'Washing Machine', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (57, N'Blender', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (58, N'Oven', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (59, N'Toaster', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (60, N'Electric Kettle', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (61, N'Raincoat', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (62, N'Boots', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (63, N'Belt', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (64, N'Towel', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (65, N'Bag', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (66, N'Sunglasses', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (67, N'Wallet', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (68, N'Umbrella', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (69, N'Glasses', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (70, N'Shirt', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (71, N'Pasta Sauce', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (72, N'Oats', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (73, N'Cereal', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (74, N'Canned Beans', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (75, N'Canned Soup', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (76, N'Peanut Butter', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (77, N'Honey', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (78, N'Coconut Oil', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (79, N'Sugar', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (80, N'Flour1', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId]) VALUES (103, N'test', 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
USE [master]
GO
ALTER DATABASE [ProductTaskDB] SET  READ_WRITE 
GO
