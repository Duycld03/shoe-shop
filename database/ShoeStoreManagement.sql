USE [ShoeStoreManagement]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 2/26/2024 4:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [varchar](50) NULL,
	[City] [nvarchar](255) NULL,
	[addressDetail] [text] NULL,
	[isPrimary] [bit] NULL,
	[StaffID] [varchar](50) NULL,
	[CustomerID] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 2/26/2024 4:50:05 PM ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 2/26/2024 4:50:05 PM ******/
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
/****** Object:  Table [dbo].[Carts]    Script Date: 2/26/2024 4:50:05 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 2/26/2024 4:50:05 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/26/2024 4:50:05 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2/26/2024 4:50:05 PM ******/
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
	[MenthodID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 2/26/2024 4:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[MethodID] [varchar](50) NOT NULL,
	[MethodName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 2/26/2024 4:50:05 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 2/26/2024 4:50:05 PM ******/
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
	[BrandID] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 2/26/2024 4:50:05 PM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 2/26/2024 4:50:05 PM ******/
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
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad1', N'Ð?ng Tháp', N'S? 01,du?ng Tr?n Quan Di?u, Bình Th?y', 1, N'ST1', N'Cus1')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad2', N'B?c Liêu', N'S? 01, du?ng Tr?n Quan Di?u, Bình Th?y', 0, N'ST2', N'Cus2')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad3', N'H? Chí Minh', N'S? 123, du?ng ABC, Qu?n 1', 0, N'ST3', N'Cus3')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad4', N'Hà N?i', N'S? 456, du?ng XYZ, Qu?n Hoàn Ki?m', 0, N'ST4', N'Cus4')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad5', N'Hà Giang', N'S? 456, du?ng XYZ, Qu?n Hoàn Ki?m', 1, N'ST5', N'Cus5')
GO
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A1', N'PhucDT', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhucDT@fpt.edu.vn', N'Ðoàn Thanh Phúc', N'1234567890')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A2', N'DuyNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'DuyNTce170332@gmail.com', N'Nguy?n Tru?ng Duy', N'0123456789')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A3', N'NamNV', N'827ccb0eea8a706c4c34a16891f84e7b', N'NamNV24@gmail.com', N'Nguyễn Võ Nam', N'07670155466')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A4', N'HoaLT', N'827ccb0eea8a706c4c34a16891f84e7b', N'HoaLT@gmail.com', N'Lê Thị Hoa', N'0868968431')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A5', N'HuongVT', N'827ccb0eea8a706c4c34a16891f84e7b', N'Huongvthi1700@gmail.com', N'Lê Thị Hoa', N'0767016145')

GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br1', N'Nike')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br2', N'Adidas')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br3', N'Puma')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br4', N'Reebok')
GO
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart1', 2, 1000, N'Cus2', N'Var1')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart2', 1, 500, N'Cus1', N'Var2')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart3', 3, 2100, N'Cus3', N'Var3')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart4', 2, 1600, N'Cus4', N'Var4')
GO
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus1', N'PhuTH', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhuTH@email.com', N'Hà Tấn Phú', N'123456', N'0969123662')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus2', N'DungTH', N'827ccb0eea8a706c4c34a16891f84e7b', N'dungthce170476@fpt.edu.vn', N'Trần Hoàng Dũng', N'105393534710828019950', N'0767323248')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus3', N'NuHT', N'827ccb0eea8a706c4c34a16891f84e7b', N'NuHT@gmail.com', N'Hoàng Thiếu Nữ', N'654321', N'01268641505')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus4', N'TienDM', N'827ccb0eea8a706c4c34a16891f84e7b', N'duongdm@fpt.edu.vn', N'Dương Mỹ Tiên', N'6543212', N'0978647265')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus5', N'HaiNH03', N'827ccb0eea8a706c4c34a16891f84e7b', N'HaiNHfptedu@gmail.com', N'Nguyễn Hoàng Hải', N'2148248', N'0978733577')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD1', 1500, 2, N'Oder1', N'Var1')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD2', 600, 1, N'Oder2', N'Var2')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD3', 3500, 3, N'Order3', N'Var3')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD4', 850, 2, N'Order4', N'Var4')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD5', 1800, 2, N'Order5', N'Var5')

GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID], [StaffID]) VALUES (N'Oder1', CAST(N'2024-02-24' AS Date), N'Pending', N'Processing', 100, N'Cus1', N'M1', N'ST1')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID], [StaffID]) VALUES (N'Oder2', CAST(N'2024-02-25' AS Date), N'Paid', N'Accepted', 80, N'Cus2', N'M1', N'ST2')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID], [StaffID]) VALUES (N'Order3', CAST(N'2024-02-26' AS Date), N'Pending', N'Processing', 700, N'Cus3', N'M3', N'ST3')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID], [StaffID]) VALUES (N'Order4', CAST(N'2024-02-27' AS Date), N'Paid', N'Accepted', 1600, N'Cus4', N'M4', N'ST4')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID], [StaffID]) VALUES (N'Order5', CAST(N'2024-02-21' AS Date), N'Paid', N'Accepted', 1500, N'Cus5', N'M4', N'ST5')

GO
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M1', N'Credit Card')
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M2', N'Visa Card')
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M3', N'MasterCard')
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M4', N'American Express')
GO
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image1', 1, N'image Product1.jpg', N'P1')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image2', 0, N'image Product2.jpg', N'P1')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image3', 1, N'image Product3.jpg', N'P2')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image4', 0, N'image Product4.jpg', N'P3')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image5', 1, N'image Product5.jpg', N'P4')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image6', 1, N'image Product6.jpg', N'P4')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image7', 1, N'image Product7.jpg', N'P5')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image8', 1, N'image Product8.jpg', N'P6')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image9', 1, N'image Product9.jpg', N'P7')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image10', 1, N'image Product10.jpg', N'P8')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Imag11', 1, N'image Product11.jpg', N'P9')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image12', 1, N'image Product12.jpg', N'P10')

GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P1', N'adidas adios pro 3', 500, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br2', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P2', N'nike adios pro 3', 500, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br1', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P3', N'puma speed 500', 500, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br3', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P4', N'reebok nano x', 500, 20, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br4', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P5', N'puma speed 500', 10000, 20, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br3', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P6', N'adidas adios pro 3', 400, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br2', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P7', N'adidas adios pro 3', 500, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br2', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P8', N'nike adios pro 3', 1000, 15, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br1', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P9', N'nike adios pro 3', 1500, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br1', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P10', N'nike adios pro 3', 4000, 15, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br1', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P11', N'reebok nano x', 2500, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br4', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P12', N'puma speed 500', 300, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br3', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P13', N'reebok nano x', 200, 15, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br4', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P14', N'nike adios pro 3', 700, 15, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br2', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P15', N'puma speed 500', 400, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br3', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P16', N'nike adios pro 3', 500, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br2', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P17', N'reebok nano x', 1200, 15, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br4', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P18', N'puma speed 500', 2100, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br3', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P19', N'reebok nano x', 2200, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'4', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P20', N'puma speed 500', 400, 15, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br3', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P21', N'puma speed 500', 500, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br3', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P22', N'reebok nano x', 580, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br4', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P23', N'nike adios pro 3', 900, 15, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br2', 0)

GO
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var1', 30, N'Red', 10, N'P1')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var2', 30, N'Blue', 15, N'P1')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var3', 35, N'Black', 20, N'P3')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var4', 38, N'White', 25, N'P4')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var5', 39, N'Blue', 25, N'P5')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var6', 41, N'Red', 15, N'P6')

GO
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST1', N'PhuDT', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhuDT@email.com', N'Ðoàn Thanh Phú', N'0978647577')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST2', N'DuyenNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'DuyenNT_23@email.com', N'Nguyễn Thị Duyên', N'0467785622')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST3', N'NamNV', N'827ccb0eea8a706c4c34a16891f84e7b', N'NamNV@email.com', N'Nguy?n Van Nam', N'0478856322')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST4', N'HanhLT', N'827ccb0eea8a706c4c34a16891f84e7b', N'HanhLT7@email.com', N'Lê Th? Hạnh', N'0968745222')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST5', N'HaNN', N'827ccb0eea8a706c4c34a16891f84e7b', N'HaNN24@email.com', N'Nguyễn Như Hà', N'0978444224')

GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT ((0)) FOR [isPrimary]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staffs] ([StaffID])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([VariantID])
REFERENCES [dbo].[ProductVariants] ([VariantID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([VariantID])
REFERENCES [dbo].[ProductVariants] ([VariantID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([MenthodID])
REFERENCES [dbo].[PaymentMethods] ([MethodID])
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
