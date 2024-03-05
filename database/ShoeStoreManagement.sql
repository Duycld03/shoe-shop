USE [master]
GO
/****** Object:  Database [ShoeStoreManagement]    Script Date: 06/03/2024 1:30:46 SA ******/
CREATE DATABASE [ShoeStoreManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoeStoreManagement', FILENAME = N'D:\SE1707_KI3\DBI\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShoeStoreManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoeStoreManagement_log', FILENAME = N'D:\SE1707_KI3\DBI\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShoeStoreManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShoeStoreManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeStoreManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeStoreManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeStoreManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeStoreManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoeStoreManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeStoreManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoeStoreManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeStoreManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeStoreManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeStoreManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeStoreManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoeStoreManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoeStoreManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoeStoreManagement', N'ON'
GO
ALTER DATABASE [ShoeStoreManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShoeStoreManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShoeStoreManagement]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [varchar](50) NULL,
	[City] [nvarchar](255) NULL,
	[addressDetail] [text] NULL,
	[isPrimary] [bit] NULL,
	[CustomerID] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [varchar](50) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[PhoneNumber] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [varchar](50) NOT NULL,
	[BrandName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartID] [varchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [float] NULL,
	[CustomerID] [varchar](50) NULL,
	[VariantID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](50) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[SocialID] [varchar](255) NULL,
	[PhoneNumber] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [varchar](50) NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[OrderID] [varchar](50) NULL,
	[VariantID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [varchar](50) NOT NULL,
	[OrderDate] [date] NULL,
	[PaymentStatus] [varchar](50) NULL,
	[OrderStatus] [varchar](50) NULL,
	[TotalAmount] [float] NULL,
	[CustomerID] [varchar](50) NULL,
	[PaymentMenthod] [varchar](50) NULL,
	[StaffID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageID] [varchar](50) NOT NULL,
	[IsPrimary] [bit] NULL,
	[ImageURL] [varchar](255) NULL,
	[ProductID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [varchar](50) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[Description] [text] NULL,
	[isDeleted] [bit] NULL,
	[BrandID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariants](
	[VariantID] [varchar](50) NOT NULL,
	[Size] [int] NULL,
	[Color] [varchar](50) NULL,
	[StockQuantity] [int] NULL,
	[ProductID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[VariantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 06/03/2024 1:30:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffID] [varchar](50) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[PhoneNumber] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad1', N'Dong Thap', N'No. 01, Tran Quang Dieu Street, Binh Thuy', 1, N'Cus1')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad2', N'Can Tho', N'No. 59, Hoa Binh Avenue, Ninh Kieu', 1, N'Cus2')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad3', N'Ho Chi Minh', N'No. 123, Mac Thien Tich Street, District 1', 1, N'Cus3')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad4', N'Hanoi', N'No. 23, XYZ Street, Hoan Kiem District', 1, N'Cus4')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad5', N'Ha Giang', N'No. 456, Street 7, Hoang Hoa Tham', 1, N'Cus5')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad6', N'Hanoi', N'No. 6, Phan Dinh Phung Street, Ba Dinh', 1, N'Cus6')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad7', N'Thanh Hoa', N'No. 27, Tran Phu Street, City. Thanh Hoa', 1, N'Cus7')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad8', N'Hai Phong', N'No. 84, Lach Tray Street, Ngo Quyen District', 1, N'Cus8')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad9', N'Quang Ninh', N'No. 19, Ha Long Street, City. Ha Long', 1, N'Cus9')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad10', N'Ha Tinh', N'No. 101, Tran Phu Street, City. Ha Tinh', 1, N'Cus10')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad11', N'Tay Ninh', N'No. 110, Cao Thang Street, City. Tay Ninh', 1, N'Cus11')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad12', N'Long An', N'No. 12, Le Lai Street, City. Tan An', 1, N'Cus12')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad13', N'Can Tho', N'No. 113, Phan Chu Trinh Street, Ninh Kieu', 1, N'Cus13')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad14', N'Binh Thuan', N'No. 124, Nguyen Dinh Chinh Street, Phan Thiet', 1, N'Cus14')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad15', N'Lam Dong', N'No. 105, Le Loi Street, City. Da Lat', 1, N'Cus15')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad16', N'Bac Giang', N'No. 99, Le Loi Street, City. Bac Giang', 0, N'Cus1')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad17', N'Quang Nam', N'No. 15, Nguyen Van Troi Street, City. Tam Ky', 0, N'Cus1')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad18', N'Khanh Hoa', N'No. 87, Tran Phu Street, City. Nha Trang', 0, N'Cus2')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad19', N'Dak Lak', N'No. 33, Phan Boi Chau Street, City. Buon Ma Thuot', 0, N'Cus2')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad20', N'Da Nang', N'No. 72, Hai Phong Street, City. Da Nang', 0, N'Cus3')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad21', N'Bac Ninh', N'No. 18, Le Thanh Tong Street, City. Bac Ninh', 0, N'Cus3')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad22', N'Vinh Long', N'No. 25, Le Hong Phong Street, City. Vinh Long', 0, N'Cus4')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad23', N'Quang Tri', N'No. 14, Tran Hung Dao Street, City. Dong Ha', 0, N'Cus4')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad24', N'Da Nang', N'No. 29, Nguyen Van Linh Street, City. Hai Chau', 0, N'Cus5')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad25', N'Phu Yen', N'No. 55, Le Duan Street, City. Tuy Hoa', 0, N'Cus5')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad26', N'Quang Ngai', N'No. 39, Nguyen Tat Thanh Street, City. Quang Ngai', 0, N'Cus6')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad27', N'Ha Nam', N'No. 11, Tran Hung Dao Street, City. Phu Ly', 0, N'Cus6')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad28', N'Dong Nai', N'No. 67, Nguyen Ai Quoc Street, City. Bien Hoa', 0, N'Cus7')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad29', N'Thai Nguyen', N'No. 47, Ho Chi Minh Street, City. Thai Nguyen', 0, N'Cus7')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad30', N'Vinh Phuc', N'No. 83, Le Loi Street, City. Vinh Yen', 0, N'Cus8')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad31', N'Ba Ria - Vung Tau', N'No. 88, Le Hong Phong Street, Ward 11', 0, N'Cus8')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad32', N'Bac Lieu', N'No. 12, Le Loi Street, Ward 3', 0, N'Cus9')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad33', N'Ca Mau', N'No. 7, Tran Phu Street, Ward 4', 0, N'Cus9')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad34', N'Bac Ninh', N'No. 56, Nguyen Hue Street, Kinh Bac Ward', 0, N'Cus10')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad35', N'Binh Duong', N'No. 3, Le Thanh Tong Street, Phu Giao Ward', 0, N'Cus10')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad36', N'Binh Phuoc', N'No. 25, Le Lai Street, Ward 1', 0, N'Cus11')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad37', N'Binh Thuan', N'No. 6, Tran Hung Dao Street, Phan Thiet', 0, N'Cus11')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad38', N'Ca Mau', N'No. 47, Tran Hung Dao Street, Ward 5', 0, N'Cus12')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad39', N'Cao Bang', N'No. 10, Tran Phu Street, Ha Lang Ward', 0, N'Cus12')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad40', N'Da Nang', N'No. 1, Le Duan Street, Hai Chau Ward', 0, N'Cus13')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad41', N'Dak Nong', N'No. 17, Le Loi Street, Ward 2', 0, N'Cus13')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad42', N'Dien Bien', N'No. 33, Nguyen Trai Street, Muong Thanh Ward', 0, N'Cus14')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad43', N'Dong Nai', N'No. 8, Le Duan Street, Bien Hoa', 0, N'Cus14')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad44', N'Dong Thap', N'No. 15, Le Lai Street, Ward 6', 0, N'Cus15')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [CustomerID]) VALUES (N'Ad45', N'Ha Giang', N'No. 5, Nguyen Hue Street, Ha Giang', 0, N'Cus15')
GO
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A1', N'PhucDT', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhucDT@fpt.edu.vn', N'Đoàn Thanh Phúc', N'1234567890')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A2', N'DuyNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'DuyNTce170332@gmail.com', N'Nguyễn Trường Duy', N'0123456789')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A3', N'NamNV', N'827ccb0eea8a706c4c34a16891f84e7b', N'NamNV24@gmail.com', N'Nguyễn Võ Nam', N'07670155466')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A4', N'HoaLT', N'827ccb0eea8a706c4c34a16891f84e7b', N'HoaLT@gmail.com', N'Lê Thị Hoa', N'0868968431')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A5', N'HuongVT', N'827ccb0eea8a706c4c34a16891f84e7b', N'Huongvthi1700@gmail.com', N'Võ Thị Hương', N'0767016145')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br1', N'Nike')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br2', N'Adidas')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br3', N'Puma')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br4', N'Reebok')
GO
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart1', 2, 950, N'Cus1', N'Var1')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart10', 2, 900, N'Cus10', N'Var10')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart11', 1, 450, N'Cus11', N'Var11')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart12', 3, 510, N'Cus12', N'Var12')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart13', 1, 400, N'Cus13', N'Var13')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart14', 2, 800, N'Cus14', N'Var14')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart15', 2, 800, N'Cus15', N'Var15')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart16', 1, 510, N'Cus16', N'Var16')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart17', 1, 560, N'Cus17', N'Var17')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart18', 1, 560, N'Cus18', N'Var18')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart19', 1, 560, N'Cus1', N'Var19')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart2', 1, 475, N'Cus2', N'Var2')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart20', 2, 760, N'Cus2', N'Var20')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart21', 2, 720, N'Cus3', N'Var21')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart22', 2, 720, N'Cus4', N'Var22')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart23', 1, 360, N'Cus5', N'Var23')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart24', 2, 900, N'Cus6', N'Var24')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart25', 2, 950, N'Cus7', N'Var25')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart26', 1, 475, N'Cus8', N'Var26')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart27', 1, 475, N'Cus9', N'Var27')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart28', 1, 510, N'Cus10', N'Var28')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart29', 2, 850, N'Cus11', N'Var29')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart3', 2, 920, N'Cus3', N'Var3')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart30', 2, 850, N'Cus12', N'Var30')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart31', 1, 425, N'Cus13', N'Var31')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart32', 1, 570, N'Cus14', N'Var32')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart33', 2, 900, N'Cus15', N'Var33')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart34', 1, 450, N'Cus16', N'Var34')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart35', 2, 900, N'Cus17', N'Var35')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart36', 1, 475, N'Cus18', N'Var36')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart37', 1, 510, N'Cus1', N'Var37')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart38', 1, 510, N'Cus2', N'Var38')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart39', 1, 510, N'Cus3', N'Var39')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart4', 2, 760, N'Cus4', N'Var4')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart40', 2, 680, N'Cus4', N'Var40')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart41', 2, 760, N'Cus5', N'Var41')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart5', 2, 900, N'Cus5', N'Var5')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart6', 2, 900, N'Cus6', N'Var6')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart7', 1, 450, N'Cus7', N'Var7')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart8', 2, 570, N'Cus8', N'Var8')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart9', 1, 450, N'Cus9', N'Var9')
GO
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus1', N'PhuTH', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhuTH@email.com', N'Hà Tấn Phú', N'123456', N'0969123662')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus10', N'KhoaPT', N'827ccb0eea8a706c4c34a16891f84e7b', N'khoapt@gmail.com', N'Phạm Thanh Khoa', N'246810', N'0123456789')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus11', N'HieuNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'hieunt@gmail.com', N'Nguyễn Thế Hiếu', N'123456789', N'0987654321')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus12', N'AnhPT', N'827ccb0eea8a706c4c34a16891f84e7b', N'anhpt@gmail.com', N'Phạm Trần Anh', N'9876543210', N'0123456789')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus13', N'HangNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'hangnt@gmail.com', N'Nguyễn Thị Hằng', N'135792468', N'0987654321')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus14', N'QuangHV', N'827ccb0eea8a706c4c34a16891f84e7b', N'quanghv@gmail.com', N'Hồ Văn Quang', N'1234567890', N'0123456789')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus15', N'DuongPT', N'827ccb0eea8a706c4c34a16891f84e7b', N'duongpt@gmail.com', N'Phạm Thị Dương', N'98765432100', N'0987654321')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus16', N'HuongPT', N'827ccb0eea8a706c4c34a16891f84e7b', N'huongpt@gmail.com', N'Phạm Thị Hương', N'98765432770', N'0987334364')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus17', N'DuongPT', N'827ccb0eea8a706c4c34a16891f84e7b', N'duongpt@gmail.com', N'Phan Thị Dương', N'98765435210', N'0987534321')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus18', N'DuongPT', N'827ccb0eea8a706c4c34a16891f84e7b', N'duongpt@gmail.com', N'Phạm Dương', N'98765432566', N'0987645431')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus2', N'DungTH', N'827ccb0eea8a706c4c34a16891f84e7b', N'dungthce170476@fpt.edu.vn', N'Trần Hoàng Dũng', N'105393534710828019950', N'0767323248')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus3', N'NuHT', N'827ccb0eea8a706c4c34a16891f84e7b', N'NuHT@gmail.com', N'Hoàng Thiếu Nữ', N'654321', N'01268641505')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus4', N'TienDM', N'827ccb0eea8a706c4c34a16891f84e7b', N'duongdm@fpt.edu.vn', N'Dương Mỹ Tiên', N'6543212', N'0978647265')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus5', N'HaiNH03', N'827ccb0eea8a706c4c34a16891f84e7b', N'HaiNHfptedu@gmail.com', N'Nguyễn Hoàng Hải', N'2148248', N'0978733577')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus6', N'diem', N'827ccb0eea8a706c4c34a16891f84e7b', N'phucdtce170580@fpt.edu.vn', N'Doan Thanh Phuc (K17 CT)', N'117763362022212077016', N'1234567890')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus7', N'NamNK', N'827ccb0eea8a706c4c34a16891f84e7b', N'namnk@gmail.com', N'Nguyễn Khắc Nam', N'987654', N'0987654321')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus8', N'HoaNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'hoant@gmail.com', N'Nguyễn Thị Hoa', N'13579', N'0123456789')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus9', N'ThanhLD', N'827ccb0eea8a706c4c34a16891f84e7b', N'thanhld@gmail.com', N'Lê Đức Thanh', N'987654321', N'0987654321')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD1', 950, 2, N'Order1', N'Var1')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD10', 900, 2, N'Order10', N'Var10')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD11', 450, 1, N'Order11', N'Var11')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD12', 510, 3, N'Order12', N'Var12')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD13', 400, 1, N'Order13', N'Var13')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD14', 800, 2, N'Order14', N'Var14')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD15', 800, 2, N'Order15', N'Var15')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD16', 510, 1, N'Order16', N'Var16')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD17', 560, 1, N'Order17', N'Var17')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD18', 560, 1, N'Order18', N'Var18')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD19', 560, 1, N'Order1', N'Var19')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD2', 475, 1, N'Order2', N'Var2')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD20', 760, 2, N'Order2', N'Var20')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD21', 720, 2, N'Order3', N'Var21')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD22', 720, 2, N'Order4', N'Var22')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD23', 360, 1, N'Order5', N'Var23')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD24', 900, 2, N'Order6', N'Var24')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD25', 950, 2, N'Order7', N'Var25')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD26', 475, 1, N'Order8', N'Var26')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD27', 475, 1, N'Order9', N'Var27')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD28', 510, 1, N'Order10', N'Var28')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD29', 850, 2, N'Order11', N'Var29')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD3', 950, 2, N'Order3', N'Var3')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD30', 850, 2, N'Order12', N'Var30')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD31', 425, 1, N'Order13', N'Var31')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD32', 570, 2, N'Order14', N'Var32')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD33', 900, 2, N'Order15', N'Var33')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD34', 450, 1, N'Order16', N'Var34')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD35', 900, 2, N'Order17', N'Var35')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD36', 475, 1, N'Order18', N'Var36')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD37', 510, 1, N'Order1', N'Var37')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD38', 510, 1, N'Order2', N'Var38')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD39', 510, 1, N'Order3', N'Var39')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD4', 760, 2, N'Order4', N'Var4')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD40', 680, 2, N'Order4', N'Var40')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD41', 760, 2, N'Order5', N'Var41')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD5', 900, 2, N'Order5', N'Var5')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD6', 900, 2, N'Order6', N'Var6')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD7', 450, 1, N'Order7', N'Var7')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD8', 570, 2, N'Order8', N'Var8')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD9', 450, 1, N'Order9', N'Var9')
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order1', CAST(N'2024-02-24' AS Date), N'Pending', N'Processing', 2020, N'Cus1', N'VnPay', N'ST1')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order10', CAST(N'2024-02-26' AS Date), N'Pending', N'Accepted', 1410, N'Cus10', N'COD', N'ST5')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order11', CAST(N'2024-02-27' AS Date), N'Paid', N'Accepted', 1300, N'Cus11', N'COD', N'ST1')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order12', CAST(N'2024-02-28' AS Date), N'Paid', N'Accepted', 1360, N'Cus12', N'VnPay', N'ST2')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order13', CAST(N'2024-02-29' AS Date), N'Pending', N'Processing', 825, N'Cus13', N'COD', N'ST3')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order14', CAST(N'2024-03-01' AS Date), N'Paid', N'Accepted', 1370, N'Cus14', N'VnPay', N'ST4')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order15', CAST(N'2024-03-02' AS Date), N'Paid', N'Accepted', 1700, N'Cus15', N'VnPay', N'ST5')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order16', CAST(N'2024-03-03' AS Date), N'Pending', N'Processing', 960, N'Cus16', N'VnPay', N'ST5')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order17', CAST(N'2024-03-04' AS Date), N'Paid', N'Accepted', 1460, N'Cus17', N'COD', N'ST4')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order18', CAST(N'2024-03-05' AS Date), N'Paid', N'Processing', 1035, N'Cus18', N'COD', N'ST1')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order2', CAST(N'2024-02-25' AS Date), N'Paid', N'Accepted', 1745, N'Cus2', N'VnPay', N'ST2')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order3', CAST(N'2024-02-26' AS Date), N'Pending', N'Processing', 2180, N'Cus3', N'VnPay', N'ST3')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order4', CAST(N'2024-02-27' AS Date), N'Paid', N'Accepted', 2160, N'Cus4', N'COD', N'ST4')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order5', CAST(N'2024-02-21' AS Date), N'Paid', N'Accepted', 2020, N'Cus5', N'COD', N'ST5')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order6', CAST(N'2024-02-22' AS Date), N'Pending', N'Processing', 1800, N'Cus6', N'COD', N'ST1')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order7', CAST(N'2024-02-23' AS Date), N'Paid', N'Accepted', 1400, N'Cus7', N'VnPay', N'ST2')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order8', CAST(N'2024-02-24' AS Date), N'Paid', N'Processing', 1045, N'Cus8', N'VnPay', N'ST3')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [PaymentMenthod], [StaffID]) VALUES (N'Order9', CAST(N'2024-02-25' AS Date), N'Pending', N'Processing', 925, N'Cus9', N'COD', N'ST4')
GO
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image1', 1, N'image Product1.jpg', N'P1')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image10', 0, N'image Product9.jpg', N'P2')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image100', 0, N'image Product8.jpg', N'P20')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image101', 1, N'image Product21.jpg', N'P21')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image102', 0, N'image Product10.jpg', N'P21')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image103', 0, N'image Product11.jpg', N'P21')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image104', 0, N'image Product12.jpg', N'P21')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image105', 0, N'image Product13.jpg', N'P21')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image106', 1, N'image Product22.jpg', N'P22')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image107', 0, N'image Product15.jpg', N'P22')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image108', 0, N'image Product16.jpg', N'P22')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image109', 0, N'image Product17.jpg', N'P22')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image11', 1, N'image Product3.jpg', N'P3')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image110', 0, N'image Product18.jpg', N'P22')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image111', 1, N'image Product123.jpg', N'P23')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image112', 0, N'image Product20.jpg', N'P23')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image113', 0, N'image Product21.jpg', N'P23')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image114', 0, N'image Product22.jpg', N'P23')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image115', 0, N'image Product19.jpg', N'P23')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image12', 0, N'image Product10.jpg', N'P3')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image13', 0, N'image Product11.jpg', N'P3')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image14', 0, N'image Product12.jpg', N'P3')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image15', 0, N'image Product13.jpg', N'P3')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image16', 1, N'image Product4.jpg', N'P4')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image17', 0, N'image Product14.jpg', N'P4')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image18', 0, N'image Product15.jpg', N'P4')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image19', 0, N'image Product16.jpg', N'P4')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image2', 0, N'image Product2.jpg', N'P1')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image20', 0, N'image Product17.jpg', N'P4')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image21', 1, N'image Product5.jpg', N'P5')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image22', 0, N'image Product19.jpg', N'P5')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image23', 0, N'image Product20.jpg', N'P5')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image24', 0, N'image Product21.jpg', N'P5')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image25', 0, N'image Product22.jpg', N'P5')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image26', 1, N'image Product6.jpg', N'P6')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image27', 0, N'image Product23.jpg', N'P6')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image28', 0, N'image Product1.jpg', N'P6')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image29', 0, N'image Product2.jpg', N'P6')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image3', 0, N'image Product3.jpg', N'P1')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image30', 0, N'image Product3.jpg', N'P6')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image31', 1, N'image Product7.jpg', N'P7')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image32', 0, N'image Product9.jpg', N'P7')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image33', 0, N'image Product10.jpg', N'P7')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image34', 0, N'image Product11.jpg', N'P7')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image35', 0, N'image Product12.jpg', N'P7')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image36', 1, N'image Product8.jpg', N'P8')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image37', 0, N'image Product14.jpg', N'P8')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image38', 0, N'image Product15.jpg', N'P8')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image39', 0, N'image Product16.jpg', N'P8')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image4', 0, N'image Product4.jpg', N'P1')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image40', 0, N'image Product17.jpg', N'P8')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image41', 1, N'image Product9.jpg', N'P9')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image42', 0, N'image Product19.jpg', N'P9')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image43', 0, N'image Product20.jpg', N'P9')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image44', 0, N'image Product21.jpg', N'P9')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image45', 0, N'image Product22.jpg', N'P9')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image46', 1, N'image Product10.jpg', N'P10')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image47', 0, N'image Product23.jpg', N'P10')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image48', 0, N'image Product2.jpg', N'P10')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image49', 0, N'image Product3.jpg', N'P10')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image5', 0, N'image Product5.jpg', N'P1')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image50', 0, N'image Product4.jpg', N'P10')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image51', 1, N'image Product11.jpg', N'P11')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image52', 0, N'image Product6.jpg', N'P11')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image53', 0, N'image Product7.jpg', N'P11')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image54', 0, N'image Product8.jpg', N'P11')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image55', 0, N'image Product9.jpg', N'P11')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image56', 1, N'image Product12.jpg', N'P12')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image57', 0, N'image Product11.jpg', N'P12')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image58', 0, N'image Product10.jpg', N'P12')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image59', 0, N'image Product13.jpg', N'P12')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image6', 1, N'image Product2.jpg', N'P2')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image60', 0, N'image Product14.jpg', N'P12')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image61', 1, N'image Product13.jpg', N'P13')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image62', 0, N'image Product16.jpg', N'P13')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image63', 0, N'image Product17.jpg', N'P13')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image64', 0, N'image Product18.jpg', N'P13')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image65', 0, N'image Product19.jpg', N'P13')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image66', 1, N'image Product14.jpg', N'P14')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image67', 0, N'image Product21.jpg', N'P14')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image68', 0, N'image Product22.jpg', N'P14')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image69', 0, N'image Product23.jpg', N'P14')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image7', 0, N'image Product6.jpg', N'P2')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image70', 0, N'image Product1.jpg', N'P14')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image71', 1, N'image Product15.jpg', N'P15')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image72', 0, N'image Product3.jpg', N'P15')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image73', 0, N'image Product4.jpg', N'P15')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image74', 0, N'image Product5.jpg', N'P15')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image75', 0, N'image Product6.jpg', N'P15')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image76', 1, N'image Product16.jpg', N'P16')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image77', 0, N'image Product8.jpg', N'P16')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image78', 0, N'image Product9.jpg', N'P16')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image79', 0, N'image Product10.jpg', N'P16')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image8', 0, N'image Product7.jpg', N'P2')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image80', 0, N'image Product11.jpg', N'P16')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image81', 1, N'image Product17.jpg', N'P17')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image82', 0, N'image Product13.jpg', N'P17')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image83', 0, N'image Product14.jpg', N'P17')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image84', 0, N'image Product15.jpg', N'P17')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image85', 0, N'image Product16.jpg', N'P17')
GO
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image86', 1, N'image Product18.jpg', N'P18')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image87', 0, N'image Product23.jpg', N'P18')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image88', 0, N'image Product19.jpg', N'P18')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image89', 0, N'image Product20.jpg', N'P18')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image9', 0, N'image Product8.jpg', N'P2')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image90', 0, N'image Product21.jpg', N'P18')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image91', 1, N'image Product19.jpg', N'P19')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image92', 0, N'image Product23.jpg', N'P19')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image93', 0, N'image Product1.jpg', N'P19')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image94', 0, N'image Product2.jpg', N'P19')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image95', 0, N'image Product3.jpg', N'P19')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image96', 1, N'image Product20.jpg', N'P20')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image97', 0, N'image Product5.jpg', N'P20')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image98', 0, N'image Product6.jpg', N'P20')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image99', 0, N'image Product7.jpg', N'P20')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P1', N'Adidas Adios Pro 3', 500, 5, N'Enhanced stability for a comfortable movement experience', 0, N'Br2')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P10', N'Nike Zoom', 600, 15, N'Super light weight and smoothness helps users move more smoothly', 0, N'Br1')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P11', N'Reebok White Black', 400, 5, N'Elegance and sophistication, suitable for both men and women, are outstanding features of the classic Reebok line', 0, N'Br4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P12', N'Puma Carina Dynamic And Youthful', 300, 5, N'Made from modern leather and shaped to hug the feet', 0, N'Br3')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P13', N'Reebok Royal', 200, 15, N'The soft insole maintains a comfortable, pleasant feeling throughout the journey', 0, N'Br4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P14', N'Adidas NMD', 600, 15, N'The Boost sole is minimalist in design but always ensures comfort, with 2 plastic cages in the sole as a highlight', 0, N'Br2')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P15', N'Puma Fenty Outstanding and Disruptive', 400, 5, N'Made from classic suede with a punk sole design to effectively cheat height', 0, N'Br3')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P16', N'Adidas Stan Smith', 500, 10, N'Classic design, simple color scheme, easy to combine with all your outfits', 0, N'Br2')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P17', N'Reebok Ventilator Gore Tex', 600, 15, N'The bootie layer is carefully lined inside each shoe to ensure the highest waterproof and breathable performance for the user', 0, N'Br4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P18', N'Puma Ignite Perfect Version of Sports Shoe Model', 300, 5, N'Shoes have extremely good durability plus simple neutral colors', 0, N'Br3')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P19', N'Reebok Classic Leather', 500, 5, N'Elastic rubber sole, no need to worry about slipping, always keeps users safe', 0, N'Br4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P2', N'Nike Adios Pro 3', 500, 10, N'Advanced balance technology for fatigue-free running', 0, N'Br1')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P20', N'Puma Suede Shoe Model Associated With The Brand', 400, 15, N'The shoe body has a thin, simple but eye-catching design and the "Formstrip" logo is embossed on the shoe body', 0, N'Br3')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P21', N'Puma MB.01 and MB.02 Rick & Morty Adventure of Color', 500, 10, N'Inspired by the space exploration of the characters in the movie', 0, N'Br3')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P22', N'Reebok DMX 1200', 580, 10, N'DMX technology gets "plus points" when it helps keep feet airy and sweat-absorbent', 0, N'Br4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P23', N'Nike Tiempo', 700, 15, N'Nike long history of specialized football footwear products', 0, N'Br1')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P3', N'Puma Speed 500', 500, 10, N'Stay balanced and agile during your run with Puma Speed 500', 0, N'Br3')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P4', N'Reebok Nano X', 500, 20, N'Experience unmatched stability with Reebok Nano X', 0, N'Br4')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P5', N'Puma Cali Classic Features In Modern Design', 700, 20, N'The intersection between classic beauty and modern appearance', 0, N'Br3')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P6', N'Adidas Yeezy', 400, 10, N'Simple design, light fabric, soft sole, trendy color tones with unique street style', 0, N'Br2')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P7', N'Adidas Ultra Boost', 500, 5, N'Stay light on your feet with Adidas Adios Pro 3', 0, N'Br2')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P8', N'Nike Jordan', 500, 15, N'Air Jordan is an American basketball shoe brand produced by the American corporation Nike', 0, N'Br1')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [isDeleted], [BrandID]) VALUES (N'P9', N'Nike Air Max', 500, 10, N'The heel is very elastic and brings comfort to the user', 0, N'Br1')
GO
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var1', 40, N'red', 10, N'P1')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var10', 42, N'orange', 30, N'P3')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var100', 42, N'red', 110, N'P23')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var101', 42, N'green', 110, N'P23')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var102', 42, N'blue', 110, N'P23')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var11', 38, N'red', 25, N'P3')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var12', 40, N'blue', 20, N'P3')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var13', 39, N'pink', 15, N'P4')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var14', 41, N'green', 10, N'P4')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var15', 43, N'blue', 20, N'P4')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var16', 42, N'red', 25, N'P4')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var17', 35, N'red', 15, N'P5')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var18', 37, N'yellow', 20, N'P5')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var19', 39, N'blue', 25, N'P5')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var2', 34, N'blue', 15, N'P1')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var20', 41, N'green', 30, N'P5')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var21', 43, N'pink', 35, N'P6')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var22', 43, N'red', 40, N'P6')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var23', 36, N'blue', 45, N'P6')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var24', 37, N'yellow', 50, N'P6')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var25', 38, N'pink', 55, N'P7')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var26', 39, N'blue', 60, N'P7')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var27', 40, N'orange', 65, N'P7')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var28', 41, N'red', 70, N'P7')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var29', 42, N'blue', 75, N'P8')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var3', 35, N'green', 20, N'P1')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var30', 38, N'green', 80, N'P8')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var31', 34, N'yellow', 85, N'P8')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var32', 36, N'blue', 90, N'P8')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var33', 36, N'blue', 95, N'P9')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var34', 37, N'green', 100, N'P9')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var35', 38, N'pink', 105, N'P9')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var36', 39, N'yellow', 110, N'P9')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var37', 39, N'pink', 115, N'P10')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var38', 43, N'red', 120, N'P10')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var39', 42, N'blue', 125, N'P10')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var4', 38, N'green', 25, N'P1')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var40', 41, N'green', 130, N'P10')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var41', 40, N'yellow', 135, N'P10')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var42', 38, N'yellow', 25, N'P1')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var43', 39, N'blue', 25, N'P2')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var44', 37, N'green', 15, N'P3')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var45', 43, N'blue', 20, N'P4')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var46', 37, N'pink', 20, N'P5')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var47', 43, N'green', 35, N'P6')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var48', 39, N'green', 60, N'P7')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var49', 36, N'red', 90, N'P8')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var5', 39, N'blue', 25, N'P2')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var50', 39, N'red', 110, N'P9')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var51', 39, N'red', 110, N'P11')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var52', 40, N'green', 120, N'P11')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var53', 42, N'blue', 110, N'P11')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var54', 42, N'yellow', 110, N'P11')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var55', 41, N'red', 100, N'P12')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var56', 39, N'green', 100, N'P12')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var57', 38, N'blue', 100, N'P12')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var58', 40, N'yellow', 110, N'P12')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var59', 41, N'red', 110, N'P13')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var6', 41, N'red', 15, N'P2')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var60', 42, N'blue', 110, N'P13')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var61', 42, N'green', 110, N'P13')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var62', 42, N'pink', 110, N'P13')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var63', 42, N'blue', 110, N'P14')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var64', 42, N'red', 110, N'P14')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var65', 42, N'green', 110, N'P14')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var66', 42, N'pink', 110, N'P14')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var67', 42, N'red', 110, N'P15')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var68', 42, N'blue', 110, N'P15')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var69', 42, N'pink', 110, N'P15')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var7', 36, N'green', 10, N'P2')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var70', 42, N'yellow', 110, N'P15')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var71', 42, N'red', 110, N'P16')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var72', 42, N'blue', 110, N'P16')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var73', 42, N'pink', 110, N'P16')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var74', 42, N'yellow', 110, N'P16')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var75', 42, N'red', 110, N'P17')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var76', 42, N'blue', 110, N'P17')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var77', 42, N'pink', 110, N'P17')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var78', 42, N'yellow', 110, N'P17')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var79', 42, N'red', 110, N'P18')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var8', 40, N'yellow', 20, N'P2')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var80', 42, N'blue', 110, N'P18')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var81', 42, N'pink', 110, N'P18')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var82', 42, N'yellow', 110, N'P18')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var83', 42, N'red', 110, N'P19')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var84', 42, N'blue', 110, N'P19')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var85', 42, N'pink', 110, N'P19')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var86', 42, N'yellow', 110, N'P19')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var87', 42, N'red', 110, N'P20')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var88', 42, N'blue', 110, N'P20')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var89', 42, N'pink', 110, N'P20')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var9', 37, N'pink', 15, N'P3')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var90', 42, N'yellow', 110, N'P20')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var91', 42, N'yellow', 110, N'P21')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var92', 42, N'red', 110, N'P21')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var93', 42, N'green', 110, N'P21')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var94', 42, N'blue', 110, N'P21')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var95', 42, N'yellow', 110, N'P22')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var96', 42, N'red', 110, N'P22')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var97', 42, N'green', 110, N'P22')
GO
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var98', 42, N'blue', 110, N'P22')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var99', 42, N'yellow', 110, N'P23')
GO
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST1', N'PhuDT', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhuDT@email.com', N'Ðoàn Thanh Phú', N'0978647577')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST2', N'DuyenNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'DuyenNT_23@email.com', N'Nguyễn Thị Duyên', N'0467785622')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST3', N'NamNV', N'827ccb0eea8a706c4c34a16891f84e7b', N'NamNV@email.com', N'Nguyễn Van Nam', N'0478856322')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST4', N'HanhLT', N'827ccb0eea8a706c4c34a16891f84e7b', N'HanhLT7@email.com', N'Lê Thị Hạnh', N'0968745222')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST5', N'HaNN', N'827ccb0eea8a706c4c34a16891f84e7b', N'HaNN24@email.com', N'Nguyễn Như Hà', N'0978444224')
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT ((0)) FOR [isPrimary]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([VariantID])
REFERENCES [dbo].[ProductVariants] ([VariantID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([VariantID])
REFERENCES [dbo].[ProductVariants] ([VariantID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staffs] ([StaffID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
USE [master]
GO
ALTER DATABASE [ShoeStoreManagement] SET  READ_WRITE 
GO
