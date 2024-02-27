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
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad001', N'Ð?ng Tháp', N'S? 01,du?ng Tr?n Quan Di?u, Bình Th?y', 1, N'ST1', NULL)
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad002', N'B?c Liêu', N'S? 01, du?ng Tr?n Quan Di?u, Bình Th?y', 0, NULL, N'Cus001')
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad003', N'H? Chí Minh', N'S? 123, du?ng ABC, Qu?n 1', 0, N'ST2', NULL)
INSERT [dbo].[Addresses] ([AddressID], [City], [addressDetail], [isPrimary], [StaffID], [CustomerID]) VALUES (N'Ad004', N'Hà N?i', N'S? 456, du?ng XYZ, Qu?n Hoàn Ki?m', 0, NULL, N'Cus002')
GO
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A001', N'PhucDT', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhucDT@email.com', N'Ðoàn Thanh Phúc', N'1234567890')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A002', N'DuyNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'DuyNT@email.com', N'Nguy?n Tru?ng Duy', N'1234567890')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A003', N'NamNV', N'827ccb0eea8a706c4c34a16891f84e7b', N'NamNV@email.com', N'Nguyễn Văn Nam', N'1234567890')
INSERT [dbo].[Admins] ([AdminID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'A004', N'HoaLT', N'827ccb0eea8a706c4c34a16891f84e7b', N'HoaLT@email.com', N'Lê Thị Hoa', N'1234567890')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br001', N'Nike')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br002', N'Adidas')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br003', N'Puma')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (N'Br004', N'Reebok')
GO
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart001', 2, 1000, N'Cus002', N'Var001')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart002', 1, 500, N'Cus001', N'Var002')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart003', 3, 2100, N'Cus003', N'Var003')
INSERT [dbo].[Carts] ([CartID], [Quantity], [TotalPrice], [CustomerID], [VariantID]) VALUES (N'Cart004', 2, 1600, N'Cus004', N'Var004')
GO
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus001', N'PhucDT', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhucDT@email.com', N'Ðoàn Thanh Phúc', N'123456', N'1234567890')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus002', N'DuyNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'duyntce170476@fpt.edu.vn', N'Nguy?n Tru?ng Duy', N'105393534710828019950', N'1234567890')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus003', N'NamNV', N'827ccb0eea8a706c4c34a16891f84e7b', N'NamNV@email.com', N'Nguy?n Van Nam', N'654321', N'1234567890')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus004', N'HoaLT', N'827ccb0eea8a706c4c34a16891f84e7b', N'HoaLT@email.com', N'Lê Th? Hoa', N'654321', N'1234567890')
INSERT [dbo].[Customers] ([CustomerID], [UserName], [Password], [Email], [FullName], [SocialID], [PhoneNumber]) VALUES (N'Cus005', N'Duycld03', N'827ccb0eea8a706c4c34a16891f84e7b', N'truongduy2003@gmail.com', N'Duy Nguyen', NULL, N'1234567890')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD001', 50, 2, N'Oder001', N'Var001')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD002', 30, 1, N'Oder002', N'Var001')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD003', 350, 3, N'Order003', N'Var003')
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [OrderID], [VariantID]) VALUES (N'OrderD004', 800, 2, N'Order004', N'Var004')
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID]) VALUES (N'Oder001', CAST(N'2024-02-24' AS Date), N'Pending', N'Processing', 100, N'Cus001', N'M001')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID]) VALUES (N'Oder002', CAST(N'2024-02-25' AS Date), N'Paid', N'Shipped', 80, N'Cus002', N'M001')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID]) VALUES (N'Order003', CAST(N'2024-02-26' AS Date), N'Pending', N'Processing', 700, N'Cus003', N'M003')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [PaymentStatus], [OrderStatus], [TotalAmount], [CustomerID], [MenthodID]) VALUES (N'Order004', CAST(N'2024-02-27' AS Date), N'Paid', N'Shipped', 1600, N'Cus004', N'M004')
GO
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M001', N'Credit Card')
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M002', N'Visa Card')
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M003', N'MasterCard')
INSERT [dbo].[PaymentMethods] ([MethodID], [MethodName]) VALUES (N'M004', N'American Express')
GO
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image001', 1, N'image Product1.jpg', N'P001')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image002', 0, N'image Product2.jpg', N'P001')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image003', 1, N'image Product3.jpg', N'P002')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image004', 0, N'image Product4.jpg', N'P003')
INSERT [dbo].[ProductImages] ([ImageID], [IsPrimary], [ImageURL], [ProductID]) VALUES (N'Image005', 1, N'image Product1.jpg', N'P004')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P001', N'adidas adios pro 3', 500, 5, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br002', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P002', N'nike adios pro 3', 500, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br001', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P003', N'puma speed 500', 500, 10, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br003', 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [Discount], [Description], [BrandID], [isDeleted]) VALUES (N'P004', N'reebok nano x', 500, 20, N'Ð?m b?o s? cân b?ng, d? b?n b? khi di chuy?n', N'Br004', 0)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var001', 30, N'Red', 10, N'P001')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var002', 30, N'Blue', 15, N'P001')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var003', 35, N'Black', 20, N'P003')
INSERT [dbo].[ProductVariants] ([VariantID], [Size], [Color], [StockQuantity], [ProductID]) VALUES (N'Var004', 38, N'White', 25, N'P004')
GO
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST1', N'PhucDT', N'827ccb0eea8a706c4c34a16891f84e7b', N'PhucDT@email.com', N'Ðoàn Thanh Phúc', N'1234567890')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST2', N'DuyNT', N'827ccb0eea8a706c4c34a16891f84e7b', N'DuyNT@email.com', N'Nguy?n Tru?ng Duy', N'1234567890')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST3', N'NamNV', N'827ccb0eea8a706c4c34a16891f84e7b', N'NamNV@email.com', N'Nguy?n Van Nam', N'1234567890')
INSERT [dbo].[Staffs] ([StaffID], [UserName], [Password], [Email], [FullName], [PhoneNumber]) VALUES (N'ST4', N'HoaLT', N'827ccb0eea8a706c4c34a16891f84e7b', N'HoaLT@email.com', N'Lê Th? Hoa', N'1234567890')
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
