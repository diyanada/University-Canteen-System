USE [UCS]
GO
/****** Object:  User [ucs_user]    Script Date: 03/01/2015 11:38:55 ******/
CREATE USER [ucs_user] FOR LOGIN [ucs_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [test]    Script Date: 03/01/2015 11:38:55 ******/
CREATE USER [test] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [diyanada2]    Script Date: 03/01/2015 11:38:55 ******/
CREATE USER [diyanada2] FOR LOGIN [diyanada2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [diyanada]    Script Date: 03/01/2015 11:38:55 ******/
CREATE USER [diyanada] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
/****** Object:  User [bravo]    Script Date: 03/01/2015 11:38:55 ******/
CREATE USER [bravo] FOR LOGIN [bravo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Img]    Script Date: 03/01/2015 11:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Img](
	[ID] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Img] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-1')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-10')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-11')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-12')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-13')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-14')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-15')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-16')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-17')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-18')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-19')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-2')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-20')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-21')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-22')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-23')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-3')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-4')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-5')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-6')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-7')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-8')
INSERT [dbo].[Img] ([ID]) VALUES (N'UCS-IT-IMG-9')
/****** Object:  StoredProcedure [dbo].[Quantitys]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Quantitys] 
	@item_code nvarchar(50),
	@quantity int,
	@a_date datetime,
	@e_date datetime
AS
BEGIN
	DECLARE @cot int
	DECLARE @id varchar(15)
	
	SET @cot = (select count(*) from [Quantity]) + 1;
	
	SET @id = ('UCS-QUN-') + CONVERT(nvarchar(3), @cot);
	 
	insert into [Quantity](Quantity_Code, Item_Code, Quantity, A_Date, E_Date, [Date-Time]) 
	values(@id, @item_code, @quantity, @a_date, @e_date, GETDATE())
END
GO
/****** Object:  Table [dbo].[Quantity]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quantity](
	[Quantity_Code] [nvarchar](50) NOT NULL,
	[Item_Code] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[A_Date] [datetime] NOT NULL,
	[E_Date] [datetime] NOT NULL,
	[Date-Time] [datetime] NULL,
 CONSTRAINT [PK_Quantity] PRIMARY KEY CLUSTERED 
(
	[Quantity_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-1', N'UCS-ITEM-1', 600, CAST(0x0000A44400CAB49A AS DateTime), CAST(0x0000A44500CAB3CC AS DateTime), CAST(0x0000A44400CACD6F AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-10', N'UCS-ITEM-1', 10, CAST(0x0000A44E002D50BE AS DateTime), CAST(0x0000A44E002D50BE AS DateTime), CAST(0x0000A44E002D5521 AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-11', N'UCS-ITEM-7', 100, CAST(0x0000A44E002FDF48 AS DateTime), CAST(0x0000A5BC002FDE4C AS DateTime), CAST(0x0000A44E002FEF69 AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-12', N'UCS-ITEM-9', 1000, CAST(0x0000A44E0038A2A1 AS DateTime), CAST(0x0000A5BC0038A270 AS DateTime), CAST(0x0000A44E0038B4D0 AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-2', N'UCS-ITEM-2', 600, CAST(0x0000A44400CAB49A AS DateTime), CAST(0x0000A44500CAB3CC AS DateTime), CAST(0x0000A44400CAD48E AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-3', N'UCS-ITEM-3', 600, CAST(0x0000A44400CAB49A AS DateTime), CAST(0x0000A44500CAB3CC AS DateTime), CAST(0x0000A44400CAD8DD AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-4', N'UCS-ITEM-4', 600, CAST(0x0000A44400CAB49A AS DateTime), CAST(0x0000A44500CAB3CC AS DateTime), CAST(0x0000A44400CADBD1 AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-5', N'UCS-ITEM-1', 200, CAST(0x0000A44400CAB49A AS DateTime), CAST(0x0000A44500CAB3CC AS DateTime), CAST(0x0000A44400CB06BC AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-6', N'UCS-ITEM-6', 20, CAST(0x0000A44800C0E6AF AS DateTime), CAST(0x0000A5B500C0E5A4 AS DateTime), CAST(0x0000A44800C0FA71 AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-7', N'UCS-ITEM-8', 25, CAST(0x0000A44E002EE6B1 AS DateTime), CAST(0x0000A5BC002EE5DC AS DateTime), CAST(0x0000A44E002EF3A1 AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-8', N'UCS-ITEM-5', 1000, CAST(0x0000A44E002CE115 AS DateTime), CAST(0x0000A44E002CE115 AS DateTime), CAST(0x0000A44E002CEC54 AS DateTime))
INSERT [dbo].[Quantity] ([Quantity_Code], [Item_Code], [Quantity], [A_Date], [E_Date], [Date-Time]) VALUES (N'UCS-QUN-9', N'UCS-ITEM-1', 10, CAST(0x0000A44E002D09A6 AS DateTime), CAST(0x0000A44E002D09A6 AS DateTime), CAST(0x0000A44E002D2361 AS DateTime))
/****** Object:  Table [dbo].[Proxy]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proxy](
	[ProxyID] [nvarchar](12) NOT NULL,
	[UserID] [nvarchar](16) NOT NULL,
	[Value] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProxyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Proxy] ([ProxyID], [UserID], [Value]) VALUES (N'46925248', N'UCS-2015-NO-3', 0)
INSERT [dbo].[Proxy] ([ProxyID], [UserID], [Value]) VALUES (N'47002956', N'UCS-2015-BF-5', 23585)
INSERT [dbo].[Proxy] ([ProxyID], [UserID], [Value]) VALUES (N'47019116', N'UCS-2015-BF-2', 6066522.9200000009)
INSERT [dbo].[Proxy] ([ProxyID], [UserID], [Value]) VALUES (N'47062800', N'UCS-2015-BF-4', 0)
INSERT [dbo].[Proxy] ([ProxyID], [UserID], [Value]) VALUES (N'47146036', N'UCS-2015-BF-1', 1500)
INSERT [dbo].[Proxy] ([ProxyID], [UserID], [Value]) VALUES (N'51928152', N'UCS-2015-BF-6', 99999159)
/****** Object:  Table [dbo].[Invoice]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [nvarchar](20) NOT NULL,
	[UserID] [nvarchar](16) NOT NULL,
	[Price] [float] NOT NULL,
	[Date-Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVO-DP-19', N'UCS-2015-BF-2', 100000, CAST(0x0000A444002F0923 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVO-DP-20', N'UCS-2015-BF-2', 1000000, CAST(0x0000A44400327A63 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVO-DP-29', N'UCS-2015-BF-2', 100, CAST(0x0000A4460027338C AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVO-DP-30', N'UCS-2015-BF-1', 1500, CAST(0x0000A446002BA823 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVO-DP-34', N'UCS-2015-BF-5', 25000, CAST(0x0000A44800C27A16 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVO-DP-42', N'UCS-2015-BF-6', 99999999, CAST(0x0000A44E002DEF0B AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-1', N'UCS-2014-B1-001', 30.55, CAST(0x0000A443002FEB1B AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-10', N'UCS-2015-BF-2', 397.15, CAST(0x0000A44301308C52 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-11', N'UCS-2015-BF-2', 3687.12, CAST(0x0000A44400052AA0 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-12', N'UCS-2015-BF-2', 6500, CAST(0x0000A444000C2B8B AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-13', N'UCS-2015-BF-2', 18000, CAST(0x0000A444000FA199 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-14', N'UCS-2015-BF-2', 12000, CAST(0x0000A444000FB56B AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-15', N'UCS-2015-BF-2', 371.04, CAST(0x0000A444001CC7A8 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-16', N'UCS-2015-BF-2', 165.52, CAST(0x0000A444001D4F9A AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-17', N'UCS-2015-BF-2', 30, CAST(0x0000A44400205BC1 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-18', N'UCS-2015-BF-2', 30, CAST(0x0000A4440020CD16 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-2', N'UCS-2014-B1-001', 386.1, CAST(0x0000A44300301E54 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-21', N'UCS-2015-BF-2', 165.52, CAST(0x0000A44400335702 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-22', N'UCS-2015-BF-2', 25, CAST(0x0000A4440034BEEA AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-23', N'UCS-2015-BF-2', 120, CAST(0x0000A4440036D0CD AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-24', N'UCS-2015-BF-2', 55, CAST(0x0000A4440038950E AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-25', N'UCS-2015-BF-2', 55, CAST(0x0000A4440038D717 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-26', N'UCS-2015-BF-2', 525, CAST(0x0000A44400D4C78F AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-27', N'UCS-2015-BF-2', 125, CAST(0x0000A4440149D470 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-28', N'UCS-2015-BF-2', 260, CAST(0x0000A4450170B4DE AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-3', N'UCS-2014-B1-001', 256.65, CAST(0x0000A44300368C8B AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-31', N'UCS-2015-BF-2', 135, CAST(0x0000A446018AD672 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-32', N'UCS-2015-BF-2', 995, CAST(0x0000A4470000A0D5 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-33', N'UCS-2015-BF-2', 60, CAST(0x0000A447015FDFE3 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-35', N'UCS-2015-BF-5', 995, CAST(0x0000A44800C2B45E AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-36', N'UCS-2015-BF-5', 35, CAST(0x0000A44800D822A4 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-37', N'UCS-2015-BF-5', 125, CAST(0x0000A44800D8DA27 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-38', N'UCS-2015-BF-5', 260, CAST(0x0000A44800D8FF1F AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-39', N'UCS-2015-BF-2', 285, CAST(0x0000A44800D9FA73 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-4', N'UCS-2014-B1-001', 231.65, CAST(0x0000A4430042F403 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-40', N'UCS-2015-BF-2', 140, CAST(0x0000A44800DB2F27 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-41', N'UCS-2015-BF-2', 35, CAST(0x0000A44800DC6A43 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-43', N'UCS-2015-BF-6', 55, CAST(0x0000A44E00355773 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-44', N'UCS-2015-BF-6', 785, CAST(0x0000A44E00391A00 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-5', N'UCS-2014-B1-001', 266.1, CAST(0x0000A443004592A0 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-6', N'UCS-2014-B1-001', 226.1, CAST(0x0000A44300C6BAC0 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-7', N'UCS-2015-BF-2', 145.55, CAST(0x0000A44301305A4D AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-8', N'UCS-2015-BF-2', 165, CAST(0x0000A44301306929 AS DateTime))
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [Price], [Date-Time]) VALUES (N'UCS-INVOICE-9', N'UCS-2015-BF-2', 295.55, CAST(0x0000A4430130738E AS DateTime))
/****** Object:  Table [dbo].[Invoice_Details]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Details](
	[InvoiceID] [nvarchar](20) NOT NULL,
	[Item_Code] [nvarchar](50) NOT NULL,
	[Item_Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY NONCLUSTERED 
(
	[InvoiceID] ASC,
	[Item_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-3', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-3', N'UCS-ITEM-2', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-3', N'UCS-ITEM-3', N'Noodles', 1, 50)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-3', N'UCS-ITEM-4', N'Wade', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-3', N'UCS-ITEM-5', N'Egg Hoppers', 3, 91.65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-6', N'UCS-ITEM-1', N'Chinese Rolls', 2, 50)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-6', N'UCS-ITEM-2', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-6', N'UCS-ITEM-3', N'Noodles', 1, 50)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-6', N'UCS-ITEM-5', N'Egg Hoppers', 2, 61.1)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-7', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-7', N'UCS-ITEM-2', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-7', N'UCS-ITEM-4', N'Wade', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-7', N'UCS-ITEM-5', N'Egg Hoppers', 1, 30.55)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-8', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-8', N'UCS-ITEM-2', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-8', N'UCS-ITEM-3', N'Noodles', 1, 50)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-8', N'UCS-ITEM-4', N'Wade', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-9', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-9', N'UCS-ITEM-2', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-9', N'UCS-ITEM-3', N'Noodles', 3, 150)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-9', N'UCS-ITEM-4', N'Wade', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-9', N'UCS-ITEM-5', N'Egg Hoppers', 1, 30.55)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-10', N'UCS-ITEM-5', N'Egg Hoppers', 13, 397.15)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-11', N'UCS-ITEM-3', N'Noodles', 81, 3687.12)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-12', N'UCS-ITEM-4', N'Rice & Curry', 100, 6500)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-13', N'UCS-ITEM-1', N'Egg Roti', 600, 18000)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-14', N'UCS-ITEM-1', N'Egg Roti', 400, 12000)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVO-DP-20', N'DEPOSIT', N'DEPOSIT', 1, 1000000)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-21', N'UCS-ITEM-1', N'Egg Roti', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-21', N'UCS-ITEM-2', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-21', N'UCS-ITEM-3', N'Noodles', 1, 45.52)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-21', N'UCS-ITEM-4', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-22', N'UCS-ITEM-2', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-23', N'UCS-ITEM-1', N'Egg Roti', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-23', N'UCS-ITEM-2', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-23', N'UCS-ITEM-4', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-24', N'UCS-ITEM-1', N'Egg Roti', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-24', N'UCS-ITEM-2', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-25', N'UCS-ITEM-1', N'Egg Roti', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-25', N'UCS-ITEM-2', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-26', N'UCS-ITEM-1', N'Chinese Rolls', 5, 125)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-26', N'UCS-ITEM-2', N'Egg Roti', 5, 175)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-26', N'UCS-ITEM-3', N'Noodles', 5, 225)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-27', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-27', N'UCS-ITEM-2', N'Egg Roti', 1, 35)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-27', N'UCS-ITEM-4', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-28', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-28', N'UCS-ITEM-2', N'Egg Roti', 1, 35)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-28', N'UCS-ITEM-3', N'Noodles', 3, 135)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-28', N'UCS-ITEM-4', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVO-DP-29', N'DEPOSIT', N'DEPOSIT', 1, 100)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-31', N'UCS-ITEM-2', N'Egg Roti', 2, 70)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-31', N'UCS-ITEM-4', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-32', N'UCS-ITEM-1', N'Chinese Rolls', 3, 75)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-32', N'UCS-ITEM-2', N'Egg Roti', 8, 280)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-32', N'UCS-ITEM-3', N'Noodles', 7, 315)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-32', N'UCS-ITEM-4', N'Rice & Curry', 5, 325)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-33', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-33', N'UCS-ITEM-2', N'Egg Roti', 1, 35)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVO-DP-34', N'DEPOSIT', N'DEPOSIT', 1, 25000)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-35', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-35', N'UCS-ITEM-2', N'Egg Roti', 11, 385)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-35', N'UCS-ITEM-3', N'Noodles', 6, 270)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-35', N'UCS-ITEM-4', N'Rice & Curry', 3, 195)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-35', N'UCS-ITEM-6', N'Hot Dog', 2, 120)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-36', N'UCS-ITEM-2', N'Egg Roti', 1, 35)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-37', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-39', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-39', N'UCS-ITEM-2', N'Egg Roti', 2, 70)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-39', N'UCS-ITEM-4', N'Rice & Curry', 2, 130)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-39', N'UCS-ITEM-6', N'Hot Dog', 1, 60)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-41', N'UCS-ITEM-2', N'Egg Roti', 1, 35)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-1', N'UCS-ITEM-5', N'Egg Hoppers', 1, 30.55)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-2', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-2', N'UCS-ITEM-3', N'Noodles', 6, 300)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-2', N'UCS-ITEM-5', N'Egg Hoppers', 2, 61.1)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVO-DP-30', N'DEPOSIT', N'DEPOSIT', 1, 1500)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-37', N'UCS-ITEM-2', N'Egg Roti', 1, 35)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-4', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-4', N'UCS-ITEM-2', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-4', N'UCS-ITEM-3', N'Noodles', 1, 50)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-4', N'UCS-ITEM-5', N'Egg Hoppers', 3, 91.65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-5', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-5', N'UCS-ITEM-2', N'Rice & Curry', 2, 130)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-5', N'UCS-ITEM-3', N'Noodles', 1, 50)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-5', N'UCS-ITEM-5', N'Egg Hoppers', 2, 61.1)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-15', N'UCS-ITEM-1', N'Egg Roti', 2, 60)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-15', N'UCS-ITEM-2', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-15', N'UCS-ITEM-3', N'Noodles', 2, 91.04)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-15', N'UCS-ITEM-4', N'Rice & Curry', 3, 195)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-16', N'UCS-ITEM-1', N'Egg Roti', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-16', N'UCS-ITEM-2', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-16', N'UCS-ITEM-3', N'Noodles', 1, 45.52)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-16', N'UCS-ITEM-4', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-17', N'UCS-ITEM-1', N'Egg Roti', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-18', N'UCS-ITEM-1', N'Egg Roti', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVO-DP-19', N'DEPOSIT', N'DEPOSIT', 1, 100000)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-37', N'UCS-ITEM-4', N'Rice & Curry', 1, 65)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-38', N'UCS-ITEM-4', N'Rice & Curry', 4, 260)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-40', N'UCS-ITEM-2', N'Egg Roti', 1, 35)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-40', N'UCS-ITEM-3', N'Noodles', 1, 45)
GO
print 'Processed 100 total records'
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-40', N'UCS-ITEM-6', N'Hot Dog', 1, 60)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVO-DP-42', N'DEPOSIT', N'DEPOSIT', 1, 99999999)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-43', N'UCS-ITEM-7', N'Tea', 1, 10)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-43', N'UCS-ITEM-8', N'Cream Soda', 1, 45)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-1', N'Chinese Rolls', 1, 25)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-2', N'Egg Roti', 3, 105)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-3', N'Noodles', 2, 90)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-4', N'Rice & Curry', 2, 130)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-5', N'Egg Hopers', 1, 30)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-6', N'Hot Dog', 3, 180)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-7', N'Tea', 2, 20)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-8', N'Cream Soda', 1, 45)
INSERT [dbo].[Invoice_Details] ([InvoiceID], [Item_Code], [Item_Name], [Quantity], [Price]) VALUES (N'UCS-INVOICE-44', N'UCS-ITEM-9', N'Kottu', 2, 160)
/****** Object:  Table [dbo].[Transaction]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[InvoiceID] [nvarchar](20) NOT NULL,
	[Type] [nvarchar](3) NOT NULL,
	[Value] [float] NOT NULL,
	[Balance] [float] NOT NULL,
	[Date-Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVO-DP-20', N'ADD', 1000000, 6069403.44, CAST(0x0000A44400327A63 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVO-DP-29', N'ADD', 100, 6068172.9200000009, CAST(0x0000A4460027339F AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVO-DP-30', N'ADD', 1500, 1500, CAST(0x0000A446002BA823 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVO-DP-34', N'ADD', 25000, 25000, CAST(0x0000A44800C27A1F AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVO-DP-42', N'ADD', 99999999, 99999999, CAST(0x0000A44E002DEF0B AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-10', N'GET', 397.15, 23996.75, CAST(0x0000A44301308C52 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-11', N'GET', 3687.12, 20309.63, CAST(0x0000A44400052AB8 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-12', N'GET', 6500, 13809.63, CAST(0x0000A444000C2B8B AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-13', N'GET', 18000, 4982000, CAST(0x0000A444000FA199 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-14', N'GET', 12000, 4970000, CAST(0x0000A444000FB56B AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-15', N'GET', 371.04, 4969628.96, CAST(0x0000A444001CC7A8 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-16', N'GET', 165.52, 4969463.44, CAST(0x0000A444001D4F9F AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-17', N'GET', 30, 4969433.44, CAST(0x0000A44400205BC6 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-18', N'GET', 30, 4969403.44, CAST(0x0000A4440020CD16 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-21', N'GET', 165.52, 6069237.9200000009, CAST(0x0000A44400335702 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-22', N'GET', 25, 6069212.9200000009, CAST(0x0000A4440034BEEA AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-23', N'GET', 120, 6069092.9200000009, CAST(0x0000A4440036D0CD AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-24', N'GET', 55, 6069037.9200000009, CAST(0x0000A4440038950E AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-25', N'GET', 55, 6068982.9200000009, CAST(0x0000A4440038D717 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-26', N'GET', 525, 6068457.9200000009, CAST(0x0000A44400D4C7A2 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-27', N'GET', 125, 6068332.9200000009, CAST(0x0000A4440149D495 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-28', N'GET', 260, 6068072.9200000009, CAST(0x0000A4450170B55D AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-31', N'GET', 135, 6068037.9200000009, CAST(0x0000A446018AD693 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-32', N'GET', 995, 6067042.9200000009, CAST(0x0000A4470000A0D5 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-33', N'GET', 60, 6066982.9200000009, CAST(0x0000A447015FE045 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-35', N'GET', 995, 24005, CAST(0x0000A44800C2B45E AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-36', N'GET', 35, 23970, CAST(0x0000A44800D822A4 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-37', N'GET', 125, 23845, CAST(0x0000A44800D8DA30 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-38', N'GET', 260, 23585, CAST(0x0000A44800D8FF1F AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-39', N'GET', 285, 6066697.9200000009, CAST(0x0000A44800D9FA73 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-4', N'GET', 231.65, 24512.199999999997, CAST(0x0000A4430042F403 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-40', N'GET', 140, 6066557.9200000009, CAST(0x0000A44800DB2F27 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-41', N'GET', 35, 6066522.9200000009, CAST(0x0000A44800DC6A43 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-43', N'GET', 55, 99999944, CAST(0x0000A44E00355778 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-44', N'GET', 785, 99999159, CAST(0x0000A44E00391A09 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-5', N'GET', 266.1, 24246.1, CAST(0x0000A443004592A0 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-6', N'GET', 226.1, 24020, CAST(0x0000A44300C6BAC9 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-7', N'GET', 145.55, 24854.45, CAST(0x0000A44301305A64 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-8', N'GET', 165, 24689.45, CAST(0x0000A44301306929 AS DateTime))
INSERT [dbo].[Transaction] ([InvoiceID], [Type], [Value], [Balance], [Date-Time]) VALUES (N'UCS-INVOICE-9', N'GET', 295.55, 24393.9, CAST(0x0000A4430130738E AS DateTime))
/****** Object:  Table [dbo].[User_Details]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Details](
	[User_ID] [nchar](16) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Relationship] [nvarchar](50) NULL,
	[Contact] [nchar](10) NOT NULL,
	[E-mail] [nvarchar](50) NULL,
	[Date-Time] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Details] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[User_Details] ([User_ID], [Name], [Address], [Relationship], [Contact], [E-mail], [Date-Time]) VALUES (N'UCS-2015-BF-1   ', N'Darshani Muthusami', N'329C, 
Elkaduwa Road,
Ukuwela,
Matale', N'Full Time Student', N'0770428949', N'dharshanimuthusami@gmail.com', CAST(0x0000A443011B4602 AS DateTime))
INSERT [dbo].[User_Details] ([User_ID], [Name], [Address], [Relationship], [Contact], [E-mail], [Date-Time]) VALUES (N'UCS-2015-BF-2   ', N'Diyanada Jayaba Gunawardena', N'207/7,
Siyane Road,
Gampaha.', N'Full Time Student', N'0713196876', N'diyanada@gamil.com', CAST(0x0000A443011B972D AS DateTime))
INSERT [dbo].[User_Details] ([User_ID], [Name], [Address], [Relationship], [Contact], [E-mail], [Date-Time]) VALUES (N'UCS-2015-BF-4   ', N'Janaki Jayawikrama', N'abc', N'Full Time Student', N'1111111111', N'', CAST(0x0000A443012D6B13 AS DateTime))
INSERT [dbo].[User_Details] ([User_ID], [Name], [Address], [Relationship], [Contact], [E-mail], [Date-Time]) VALUES (N'UCS-2015-BF-5   ', N'Samantha Perera', N'81-3,
Wataraka,
Padukka.', N'Full Time Student', N'0776423169', N'msnilminiperera@gmail.com', CAST(0x0000A44800C1D223 AS DateTime))
INSERT [dbo].[User_Details] ([User_ID], [Name], [Address], [Relationship], [Contact], [E-mail], [Date-Time]) VALUES (N'UCS-2015-BF-6   ', N'Samantha Perera', N'207/7,
Siyane Road,
Gampaha.', N'Full Time Student', N'0713196876', N'sp@gmail.com', CAST(0x0000A44E002C6D45 AS DateTime))
INSERT [dbo].[User_Details] ([User_ID], [Name], [Address], [Relationship], [Contact], [E-mail], [Date-Time]) VALUES (N'UCS-2015-NO-3   ', N'Somalatha Gunawrdena', N'207/7,
Siyane Road,
Gampaha.', N' ', N'0718190214', N'diyanada@gmail.com', CAST(0x0000A443011C51FC AS DateTime))
/****** Object:  Table [dbo].[Drop_Items]    Script Date: 03/01/2015 11:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drop_Items](
	[Drop_id] [nvarchar](50) NOT NULL,
	[Item_Code] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Date-Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Drop_Items] PRIMARY KEY CLUSTERED 
(
	[Drop_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-1', N'UCS-ITEM-1', 0, N'NULL', CAST(0x0000A44400CA4DF4 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-10', N'UCS-ITEM-4', 0, N'NULL', CAST(0x0000A44400CAA5A9 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-11', N'UCS-ITEM-4', 0, N'DISS', CAST(0x0000A44400CAA5A9 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-12', N'UCS-ITEM-4', 0, N'SELL', CAST(0x0000A44400CAA5A9 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-13', N'UCS-ITEM-1', 5, N'SELL', CAST(0x0000A44400D4C7A2 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-14', N'UCS-ITEM-2', 5, N'SELL', CAST(0x0000A44400D4C7A2 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-15', N'UCS-ITEM-3', 5, N'SELL', CAST(0x0000A44400D4C7A2 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-16', N'UCS-ITEM-1', 1, N'SELL', CAST(0x0000A4440149D48C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-17', N'UCS-ITEM-2', 1, N'SELL', CAST(0x0000A4440149D48C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-18', N'UCS-ITEM-4', 1, N'SELL', CAST(0x0000A4440149D48C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-19', N'UCS-ITEM-1', 1, N'SELL', CAST(0x0000A4450170B541 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-2', N'UCS-ITEM-1', 0, N'DISS', CAST(0x0000A44400CA4DF8 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-20', N'UCS-ITEM-2', 1, N'SELL', CAST(0x0000A4450170B558 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-21', N'UCS-ITEM-3', 3, N'SELL', CAST(0x0000A4450170B558 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-22', N'UCS-ITEM-4', 1, N'SELL', CAST(0x0000A4450170B558 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-23', N'UCS-ITEM-1', 5, N'DISS', CAST(0x0000A446001CA0F4 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-24', N'UCS-ITEM-1', 10, N'DISS', CAST(0x0000A446001DAD8B AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-25', N'UCS-ITEM-5', 0, N'NULL', CAST(0x0000A44600218BD0 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-26', N'UCS-ITEM-5', 0, N'DISS', CAST(0x0000A44600218BD0 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-27', N'UCS-ITEM-5', 0, N'SELL', CAST(0x0000A44600218BD0 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-28', N'UCS-ITEM-3', 5, N'DISS', CAST(0x0000A446017A1A7F AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-29', N'UCS-ITEM-2', 2, N'SELL', CAST(0x0000A446018AD693 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-3', N'UCS-ITEM-1', 0, N'SELL', CAST(0x0000A44400CA4E0B AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-30', N'UCS-ITEM-4', 1, N'SELL', CAST(0x0000A446018AD693 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-31', N'UCS-ITEM-1', 3, N'SELL', CAST(0x0000A4470000A0D5 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-32', N'UCS-ITEM-2', 8, N'SELL', CAST(0x0000A4470000A0D5 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-33', N'UCS-ITEM-3', 7, N'SELL', CAST(0x0000A4470000A0D5 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-34', N'UCS-ITEM-4', 5, N'SELL', CAST(0x0000A4470000A0D5 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-35', N'UCS-ITEM-1', 1, N'SELL', CAST(0x0000A447015FE033 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-36', N'UCS-ITEM-2', 1, N'SELL', CAST(0x0000A447015FE03C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-37', N'UCS-ITEM-6', 0, N'NULL', CAST(0x0000A44800C0CE90 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-38', N'UCS-ITEM-6', 0, N'DISS', CAST(0x0000A44800C0CE90 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-39', N'UCS-ITEM-6', 0, N'SELL', CAST(0x0000A44800C0CE90 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-4', N'UCS-ITEM-2', 0, N'NULL', CAST(0x0000A44400CA67D4 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-40', N'UCS-ITEM-1', 1, N'SELL', CAST(0x0000A44800C2B45E AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-41', N'UCS-ITEM-2', 11, N'SELL', CAST(0x0000A44800C2B45E AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-42', N'UCS-ITEM-3', 6, N'SELL', CAST(0x0000A44800C2B45E AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-43', N'UCS-ITEM-4', 3, N'SELL', CAST(0x0000A44800C2B45E AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-44', N'UCS-ITEM-6', 2, N'SELL', CAST(0x0000A44800C2B45E AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-45', N'UCS-ITEM-2', 1, N'SELL', CAST(0x0000A44800D822A4 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-46', N'UCS-ITEM-1', 1, N'SELL', CAST(0x0000A44800D8DA27 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-47', N'UCS-ITEM-2', 1, N'SELL', CAST(0x0000A44800D8DA2B AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-48', N'UCS-ITEM-4', 1, N'SELL', CAST(0x0000A44800D8DA30 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-49', N'UCS-ITEM-4', 4, N'SELL', CAST(0x0000A44800D8FF1F AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-5', N'UCS-ITEM-2', 0, N'DISS', CAST(0x0000A44400CA67D4 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-50', N'UCS-ITEM-1', 1, N'SELL', CAST(0x0000A44800D9FA73 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-51', N'UCS-ITEM-2', 2, N'SELL', CAST(0x0000A44800D9FA73 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-52', N'UCS-ITEM-4', 2, N'SELL', CAST(0x0000A44800D9FA73 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-53', N'UCS-ITEM-6', 1, N'SELL', CAST(0x0000A44800D9FA73 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-54', N'UCS-ITEM-2', 1, N'SELL', CAST(0x0000A44800DB2F27 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-55', N'UCS-ITEM-3', 1, N'SELL', CAST(0x0000A44800DB2F27 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-56', N'UCS-ITEM-6', 1, N'SELL', CAST(0x0000A44800DB2F27 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-57', N'UCS-ITEM-2', 1, N'SELL', CAST(0x0000A44800DC6A43 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-58', N'UCS-ITEM-4', 100, N'DISS', CAST(0x0000A44A000D22A4 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-59', N'UCS-ITEM-1', 0, N'NULL', CAST(0x0000A44E002896AE AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-6', N'UCS-ITEM-2', 0, N'SELL', CAST(0x0000A44400CA67D4 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-60', N'UCS-ITEM-1', 0, N'DISS', CAST(0x0000A44E002896AE AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-61', N'UCS-ITEM-1', 0, N'SELL', CAST(0x0000A44E002896AE AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-62', N'UCS-ITEM-8', 0, N'NULL', CAST(0x0000A44E002EC415 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-63', N'UCS-ITEM-8', 0, N'DISS', CAST(0x0000A44E002EC415 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-64', N'UCS-ITEM-8', 0, N'SELL', CAST(0x0000A44E002EC419 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-65', N'UCS-ITEM-7', 0, N'NULL', CAST(0x0000A44400CA844C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-66', N'UCS-ITEM-7', 0, N'DISS', CAST(0x0000A44400CA844C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-67', N'UCS-ITEM-7', 0, N'SELL', CAST(0x0000A44400CA844C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-68', N'UCS-ITEM-7', 1, N'SELL', CAST(0x0000A44E00355778 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-69', N'UCS-ITEM-8', 1, N'SELL', CAST(0x0000A44E00355778 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-7', N'UCS-ITEM-3', 0, N'NULL', CAST(0x0000A44400CA844C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-70', N'UCS-ITEM-9', 0, N'NULL', CAST(0x0000A44E00389A6A AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-71', N'UCS-ITEM-9', 0, N'DISS', CAST(0x0000A44E00389A6A AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-72', N'UCS-ITEM-9', 0, N'SELL', CAST(0x0000A44E00389A6E AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-73', N'UCS-ITEM-1', 1, N'SELL', CAST(0x0000A44E00391A00 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-74', N'UCS-ITEM-2', 3, N'SELL', CAST(0x0000A44E00391A00 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-75', N'UCS-ITEM-3', 2, N'SELL', CAST(0x0000A44E00391A00 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-76', N'UCS-ITEM-4', 2, N'SELL', CAST(0x0000A44E00391A00 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-77', N'UCS-ITEM-5', 1, N'SELL', CAST(0x0000A44E00391A09 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-78', N'UCS-ITEM-6', 3, N'SELL', CAST(0x0000A44E00391A09 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-79', N'UCS-ITEM-7', 2, N'SELL', CAST(0x0000A44E00391A09 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-8', N'UCS-ITEM-3', 0, N'DISS', CAST(0x0000A44400CA844C AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-80', N'UCS-ITEM-8', 1, N'SELL', CAST(0x0000A44E00391A09 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-81', N'UCS-ITEM-9', 2, N'SELL', CAST(0x0000A44E00391A09 AS DateTime))
INSERT [dbo].[Drop_Items] ([Drop_id], [Item_Code], [Quantity], [Type], [Date-Time]) VALUES (N'UCS-DP-ITEM-9', N'UCS-ITEM-3', 0, N'SELL', CAST(0x0000A44400CA844C AS DateTime))
/****** Object:  UserDefinedFunction [dbo].[Img_select]    Script Date: 03/01/2015 11:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Img_select](@value nvarchar(20))
returns nvarchar(20)
as begin
  declare @result nvarchar(20)

select @result=Item_img_ID from Items where Item_Code = @value;

return @result
end
GO
/****** Object:  Table [dbo].[Items]    Script Date: 03/01/2015 11:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Item_Code] [nvarchar](50) NOT NULL,
	[Item_Name] [nvarchar](50) NOT NULL,
	[Item_Type_Code] [nchar](10) NOT NULL,
	[Item_Price] [float] NOT NULL,
	[Item_img_ID] [nvarchar](20) NULL,
	[Date-Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Item_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-1', N'Chinese Rolls', N'UCS_IT_001', 25, N'UCS-IT-IMG-14.jpg', CAST(0x0000A44400CA4DF4 AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-2', N'Egg Roti', N'UCS_IT_001', 35, N'UCS-IT-IMG-15.jpg', CAST(0x0000A44400CA67D4 AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-3', N'Noodles', N'UCS_IT_001', 45, N'UCS-IT-IMG-16.jpg', CAST(0x0000A44400CA844C AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-4', N'Rice & Curry', N'USC_IT_002', 65, N'UCS-IT-IMG-17.jpg', CAST(0x0000A44400CAA5A9 AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-5', N'Egg Hopers', N'UCS_IT_001', 30, N'UCS-IT-IMG-18.jpg', CAST(0x0000A44600218BD0 AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-6', N'Hot Dog', N'UCS_IT_001', 60, N'UCS-IT-IMG-19.jpg', CAST(0x0000A44800C0CE8B AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-7', N'Tea', N'USC_IT_004', 10, N'UCS-IT-IMG-20.jpg', CAST(0x0000A44E002896AE AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-8', N'Cream Soda', N'USC_IT_004', 45, N'UCS-IT-IMG-21.jpg', CAST(0x0000A44E002EC415 AS DateTime))
INSERT [dbo].[Items] ([Item_Code], [Item_Name], [Item_Type_Code], [Item_Price], [Item_img_ID], [Date-Time]) VALUES (N'UCS-ITEM-9', N'Kottu', N'USC_IT_003', 80, N'UCS-IT-IMG-23.jpg', CAST(0x0000A44E00389A6A AS DateTime))
/****** Object:  Table [dbo].[Users]    Script Date: 03/01/2015 11:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_Name] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](300) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Users] ([User_Name], [Password]) VALUES (N'Diyanada', N'202cb962ac59075b964b07152d234b70')
/****** Object:  Table [dbo].[Item_Type]    Script Date: 03/01/2015 11:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Type](
	[Item_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Item_Type_Name] [nvarchar](50) NOT NULL,
	[Item_Type_Code] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Item_Type] PRIMARY KEY CLUSTERED 
(
	[Item_Type_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Item_Type] ON
INSERT [dbo].[Item_Type] ([Item_Type_ID], [Item_Type_Name], [Item_Type_Code]) VALUES (12, N'Breakfast', N'UCS_IT_001')
INSERT [dbo].[Item_Type] ([Item_Type_ID], [Item_Type_Name], [Item_Type_Code]) VALUES (14, N'Lunch', N'USC_IT_002')
INSERT [dbo].[Item_Type] ([Item_Type_ID], [Item_Type_Name], [Item_Type_Code]) VALUES (17, N'Diner', N'USC_IT_003')
INSERT [dbo].[Item_Type] ([Item_Type_ID], [Item_Type_Name], [Item_Type_Code]) VALUES (18, N'Drinks', N'USC_IT_004')
SET IDENTITY_INSERT [dbo].[Item_Type] OFF
/****** Object:  StoredProcedure [dbo].[Add_img]    Script Date: 03/01/2015 11:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_img]
	@cot int output
AS
BEGIN
	DECLARE @id varchar(15)
	SET @cot = (select count(*) from Img) + 1
	SET @id = ('UCS-IT-IMG-') + CONVERT(nvarchar(3), @cot) 
	insert into Img(ID) values(@id)
        RETURN @cot
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Quantity]    Script Date: 03/01/2015 11:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Delete_Quantity]
	@itemcode nvarchar(50)
AS
BEGIN


BEGIN TRANSACTION;

BEGIN TRY

   	DELETE FROM Quantity WHERE Item_Code = @itemcode 
   	
   	DELETE FROM Drop_Items WHERE Item_Code = @itemcode and Quantity <> 0 
	
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;


END
GO
/****** Object:  View [dbo].[Shop]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Shop]
AS
SELECT     dbo.Quantity.Item_Code AS [Item Code], dbo.Items.Item_Name AS [Item Name], dbo.Item_Type.Item_Type_Name AS [Item Type], SUM(dbo.Quantity.Quantity) 
                      AS Quantity, dbo.Items.Item_Price AS Price, dbo.Items.Item_img_ID AS Image, dbo.Item_Type.Item_Type_Code AS [Type ID]
FROM         dbo.Quantity INNER JOIN
                      dbo.Items ON dbo.Quantity.Item_Code = dbo.Items.Item_Code INNER JOIN
                      dbo.Item_Type ON dbo.Items.Item_Type_Code = dbo.Item_Type.Item_Type_Code
WHERE     (dbo.Quantity.A_Date < GETDATE()) AND (GETDATE() < dbo.Quantity.E_Date)
GROUP BY dbo.Quantity.Item_Code, dbo.Items.Item_Name, dbo.Items.Item_Price, dbo.Item_Type.Item_Type_Name, dbo.Items.Item_img_ID, dbo.Item_Type.Item_Type_Code
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Quantity"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Items"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 125
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Item_Type"
            Begin Extent = 
               Top = 6
               Left = 480
               Bottom = 110
               Right = 670
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shop'
GO
/****** Object:  View [dbo].[New Quantity]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[New Quantity]
AS
SELECT     dbo.Quantity.Item_Code AS [Item Code], dbo.Items.Item_Name AS [Item Name], dbo.Item_Type.Item_Type_Name AS [Item Type], SUM(dbo.Quantity.Quantity) 
                      AS Quantity, dbo.Items.Item_Price AS Price
FROM         dbo.Quantity INNER JOIN
                      dbo.Items ON dbo.Quantity.Item_Code = dbo.Items.Item_Code INNER JOIN
                      dbo.Item_Type ON dbo.Items.Item_Type_Code = dbo.Item_Type.Item_Type_Code
WHERE     (dbo.Quantity.A_Date < GETDATE()) AND (GETDATE() < dbo.Quantity.E_Date)
GROUP BY dbo.Quantity.Item_Code, dbo.Items.Item_Name, dbo.Items.Item_Price, dbo.Item_Type.Item_Type_Name
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Quantity"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 181
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Items"
            Begin Extent = 
               Top = 6
               Left = 238
               Bottom = 125
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Item_Type"
            Begin Extent = 
               Top = 6
               Left = 448
               Bottom = 110
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1095
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'New Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'New Quantity'
GO
/****** Object:  UserDefinedFunction [dbo].[NEW_SHOP]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[NEW_SHOP] (@var1 nvarchar(30) )
RETURNS TABLE 
AS

RETURN 
(


SELECT  dbo.Quantity.Item_Code AS [Item Code], dbo.Items.Item_Name AS [Item Name], dbo.Item_Type.Item_Type_Name AS [Item Type], 
(SUM(dbo.Quantity.Quantity)) - (SELECT SUM(Quantity)FROM dbo.Drop_Items WHERE (Item_Code = dbo.Quantity.Item_Code))


                      AS Quantity, dbo.Items.Item_Price AS Price, dbo.Items.Item_img_ID AS Image, dbo.Item_Type.Item_Type_Code AS [Type ID]
FROM         dbo.Quantity INNER JOIN
                      dbo.Items ON dbo.Quantity.Item_Code = dbo.Items.Item_Code INNER JOIN
                      dbo.Item_Type ON dbo.Items.Item_Type_Code = dbo.Item_Type.Item_Type_Code
GROUP BY dbo.Quantity.Item_Code, dbo.Items.Item_Name, dbo.Items.Item_Price, dbo.Item_Type.Item_Type_Name, dbo.Items.Item_img_ID, dbo.Item_Type.Item_Type_Code
)
GO
/****** Object:  View [dbo].[Discard_view]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Discard_view]
AS
SELECT     dbo.Items.Item_Name, dbo.Items.Item_Code, SUM(dbo.Quantity.Quantity) AS Quantity,
                          (SELECT     SUM(Quantity) AS Expr1
                            FROM          dbo.Drop_Items
                            WHERE      (Item_Code = dbo.Items.Item_Code) AND (Type = 'DISS')) AS [DISS-Quantity],
                          (SELECT     SUM(Quantity) AS Expr1
                            FROM          dbo.Drop_Items AS Drop_Items_1
                            WHERE      (Item_Code = dbo.Items.Item_Code) AND (Type = 'SELL')) AS [SELL-Quantity]
FROM         dbo.Items INNER JOIN
                      dbo.Quantity ON dbo.Items.Item_Code = dbo.Quantity.Item_Code
GROUP BY dbo.Items.Item_Code, dbo.Items.Item_Name
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Quantity"
            Begin Extent = 
               Top = 94
               Left = 400
               Bottom = 213
               Right = 562
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Items"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Discard_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Discard_view'
GO
/****** Object:  StoredProcedure [dbo].[Update_Value]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Value] 
	@userid nvarchar(16),
	@price float
AS
BEGIN
	DECLARE @old float
	
	select @old=Value from Proxy where UserID = @userid
 
	update Proxy SET Value = (@old - @price) where UserID = @userid
END
GO
/****** Object:  StoredProcedure [dbo].[Add_user]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_user]
	@proxid nvarchar(12),
	@name nvarchar(300),
	@address nvarchar(MAX),
	@rel nvarchar(50),
	@contact nchar(10),
	@email nvarchar(50)
AS
BEGIN
	DECLARE @cot int
	DECLARE @cot2 int
	DECLARE @id varchar(16)
	DECLARE @status varchar(2)
	
	SET @cot = (select count(*) from User_Details) + 1;
	
	IF (@rel = 'Full Time Student') 
	BEGIN
    SET @status = 'BF'
    END
    
	ELSE IF (@rel = 'Part Time Student')
	BEGIN 
    SET @status = 'BP'
    END
    
    ELSE IF (@rel = 'Academic Staff') 
    BEGIN
    SET @status = 'AS'
    END
    
    ELSE IF (@rel = 'non-Academic Staff') 
    BEGIN
    SET @status = 'NS'
    END
    
    ELSE 
    BEGIN
    SET @status = 'NO'
    END
	set @cot2 = year(getdate())
	SET @id = ('UCS-') + CONVERT(nvarchar(4), @cot2) + ('-') + @status + ('-') + CONVERT(nvarchar(3), @cot);
	
	


    insert into User_Details([User_ID], Name, [Address], Relationship, Contact, [E-mail], [Date-Time]) 
	values(@id, @name, @address, @rel, @contact, @email, GETDATE())
	
	insert into Proxy(ProxyID, UserID, Value) 
	values(@proxid, @id, 0.00)
	

	
END
GO
/****** Object:  StoredProcedure [dbo].[Cash_Deposit]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cash_Deposit]
	@userid nvarchar(16),
	@price float
AS
BEGIN

	DECLARE @result varchar(20)
	DECLARE @cot varchar(10)
	DECLARE @val float


BEGIN TRANSACTION;

BEGIN TRY

   	SET @cot = (select count(*) from Invoice) + 1;	
	SET @result = ('UCS-INVO-DP-') + CONVERT(nvarchar(10), @cot);
	 
	insert into Invoice(InvoiceID, UserID, Price, [Date-Time]) 
	values(@result, @userid, @price, GETDATE());
	
	insert into Invoice_Details(InvoiceID, Item_Code, Item_Name, Quantity, Price) 
	values(@result, 'DEPOSIT', 'DEPOSIT', 1, @price)
	
	select @val = Value from Proxy where UserID = @userid
	
	UPDATE Proxy SET Value =(@val+@price) where UserID = @userid
	
	insert into [Transaction](InvoiceID, [Type], Value, Balance, [Date-Time]) 
	values(@result, 'ADD',@price , (@val+@price), GETDATE())
	
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;


END
GO
/****** Object:  View [dbo].[View_User]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_User]
AS
SELECT     TOP (100) PERCENT dbo.Proxy.ProxyID, dbo.User_Details.User_ID, dbo.User_Details.Name, dbo.User_Details.Address, dbo.User_Details.Relationship, 
                      dbo.User_Details.Contact, dbo.User_Details.[E-mail], dbo.User_Details.[Date-Time], dbo.Proxy.UserID
FROM         dbo.User_Details INNER JOIN
                      dbo.Proxy ON dbo.User_Details.User_ID = dbo.Proxy.UserID
ORDER BY dbo.User_Details.User_ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Proxy"
            Begin Extent = 
               Top = 22
               Left = 409
               Bottom = 126
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_User'
GO
/****** Object:  StoredProcedure [dbo].[Get_transaction]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_transaction] 
	@invoiceid nvarchar(20),
	@userid nvarchar(16),
	@price float
AS
BEGIN

	DECLARE @old float
	
	select @old=Value from Proxy where UserID = @userid
 
	insert into [transaction](InvoiceID, [Type], Value, Balance, [Date-Time]) 
	values(@invoiceid, 'GET', @price, (@old - @price), GETDATE())
END
GO
/****** Object:  View [dbo].[Invoice_Transaction]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Invoice_Transaction]
AS
SELECT     TOP (100) PERCENT dbo.Invoice.UserID, dbo.[Transaction].InvoiceID, dbo.[Transaction].Type, dbo.[Transaction].Value, ROUND(dbo.[Transaction].Balance, 2) 
                      AS Balance, dbo.[Transaction].[Date-Time]
FROM         dbo.[Transaction] INNER JOIN
                      dbo.Invoice ON dbo.[Transaction].InvoiceID = dbo.Invoice.InvoiceID
ORDER BY dbo.[Transaction].[Date-Time] DESC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Transaction"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 221
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Invoice"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1155
         Width = 3420
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Invoice_Transaction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Invoice_Transaction'
GO
/****** Object:  UserDefinedFunction [dbo].[Inovice_Details]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Inovice_Details]
(	
	@invid nvarchar(20)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dbo.User_Details.Name, dbo.User_Details.[Address], dbo.Invoice.UserID, dbo.Invoice.InvoiceID, dbo.User_Details.Contact, dbo.User_Details.[E-mail], 
                      dbo.Invoice.[Date-Time], dbo.Invoice.Price 
                      FROM dbo.Invoice INNER JOIN dbo.User_Details 
                      ON dbo.Invoice.UserID = dbo.User_Details.[User_ID] where dbo.Invoice.InvoiceID = @invid
)
GO
/****** Object:  StoredProcedure [dbo].[Make_InviceID]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Make_InviceID]
	@userid nvarchar(16),
	@price float,
	@cot int output
AS
BEGIN

	DECLARE @result varchar(20)
	
	SET @cot = (select count(*) from Invoice) + 1;	
	SET @result = ('UCS-INVOICE-') + CONVERT(nvarchar(3), @cot);
	 
	insert into Invoice(InvoiceID, UserID, Price, [Date-Time]) 
	values(@result, @userid, @price, GETDATE());

return @cot
END
GO
/****** Object:  StoredProcedure [dbo].[Add_Invoice_Details]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Invoice_Details] 
	@invoiceid nvarchar(20),
	@item_code nvarchar(50),
	@item_name nvarchar(50),
	@quantity int,
	@price float
AS
BEGIN
 
	insert into Invoice_Details(InvoiceID, Item_Code, Item_Name, Quantity, Price) 
	values(@invoiceid, @item_code, @item_name, @quantity, @price)
END
GO
/****** Object:  StoredProcedure [dbo].[DPSell_Item]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DPSell_Item] 
	@id nvarchar(50),
	@qun int
AS
BEGIN
	DECLARE @cot2 int

	SET @cot2 = (select count(*) from Drop_Items) + 1;
	
	
	insert into Drop_Items(Drop_id, Item_Code, Quantity, [Type], [Date-Time]) 
	values(('UCS-DP-ITEM-') + CONVERT(nvarchar(10), @cot2), @id, @qun, 'SELL', GETDATE())
END
GO
/****** Object:  UserDefinedFunction [dbo].[Drop_Item_View]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[Drop_Item_View]
(	
	@itemcode nvarchar(50)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT     Item_Code, Quantity AS Quantity, Type
FROM         dbo.Drop_Items
WHERE     (Quantity <> 0)and Item_Code = @itemcode and Quantity <> 0
)
GO
/****** Object:  StoredProcedure [dbo].[DPDiss_Item]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[DPDiss_Item] 
	@id nvarchar(50),
	@qun int
AS
BEGIN
	DECLARE @cot2 int

	SET @cot2 = (select count(*) from Drop_Items) + 1;
	
	
	insert into Drop_Items(Drop_id, Item_Code, Quantity, [Type], [Date-Time]) 
	values(('UCS-DP-ITEM-') + CONVERT(nvarchar(10), @cot2), @id, @qun, 'DISS', GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[Item]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item] 
	@name nvarchar(50),
	@type_code nchar(10),
	@price float,
	@img_id nvarchar(20)
AS
BEGIN
	DECLARE @cot int
	DECLARE @cot2 int
	DECLARE @id varchar(15)
	
	SET @cot = (select count(*) from Items) + 1;
	SET @cot2 = (select count(*) from Drop_Items) + 1;
	
	SET @id = ('UCS-ITEM-') + CONVERT(nvarchar(3), @cot);
	 
	insert into Items(Item_Code, Item_Name, Item_Type_Code, Item_Price, Item_img_ID, [Date-Time]) 
	values(@id, @name, @type_code, @price, @img_id, GETDATE())
	
	insert into Drop_Items(Drop_id, Item_Code, Quantity, [Type], [Date-Time]) 
	values(('UCS-DP-ITEM-') + CONVERT(nvarchar(10), @cot2), @id, 0, 'NULL', GETDATE())
	
	SET @cot2 = (select count(*) from Drop_Items) + 1;
	
	insert into Drop_Items(Drop_id, Item_Code, Quantity, [Type], [Date-Time]) 
	values(('UCS-DP-ITEM-') + CONVERT(nvarchar(10), @cot2), @id, 0, 'DISS', GETDATE())
	
	SET @cot2 = (select count(*) from Drop_Items) + 1;
	
		insert into Drop_Items(Drop_id, Item_Code, Quantity, [Type], [Date-Time]) 
	values(('UCS-DP-ITEM-') + CONVERT(nvarchar(10), @cot2), @id, 0, 'SELL', GETDATE())
END
GO
/****** Object:  UserDefinedFunction [dbo].[Password]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Password](@username nvarchar(20))
returns nvarchar(300)
as begin
  declare @result nvarchar(300)

select @result=Password from Users where [User_Name] = @username

return @result
end
GO
/****** Object:  View [dbo].[New Items]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[New Items]
AS
SELECT     TOP (100) PERCENT dbo.Items.Item_Code AS [Item Code], dbo.Items.Item_Name AS [Item Name], dbo.Item_Type.Item_Type_Name AS [Item Type], 
                      dbo.Items.Item_Price AS Price, dbo.Items.[Date-Time] AS [Date & Time]
FROM         dbo.Items INNER JOIN
                      dbo.Item_Type ON dbo.Items.Item_Type_Code = dbo.Item_Type.Item_Type_Code
ORDER BY [Item Code] DESC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Items"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 175
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Item_Type"
            Begin Extent = 
               Top = 9
               Left = 284
               Bottom = 113
               Right = 458
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1500
         Alias = 1125
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'New Items'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'New Items'
GO
/****** Object:  UserDefinedFunction [dbo].[SHOP_NON_PARA]    Script Date: 03/01/2015 11:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[SHOP_NON_PARA]()
RETURNS TABLE 
AS
RETURN 
(
	select [Item Code], [Item Name], [Item Type], [Quantity], [Price] from NEW_SHOP('')
)
GO
