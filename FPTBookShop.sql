USE [master]
GO
/****** Object:  Database [FPTBOOKStore]    Script Date: 3/8/2022 7:33:37 PM ******/
CREATE DATABASE [FPTBOOKStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTBOOKStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTBOOKStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTBOOKStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTBOOKStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPTBOOKStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTBOOKStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTBOOKStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FPTBOOKStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTBOOKStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTBOOKStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FPTBOOKStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTBOOKStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTBOOKStore] SET  MULTI_USER 
GO
ALTER DATABASE [FPTBOOKStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTBOOKStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTBOOKStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTBOOKStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTBOOKStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPTBOOKStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPTBOOKStore] SET QUERY_STORE = OFF
GO
USE [FPTBOOKStore]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassAdmin] [varchar](30) NOT NULL,
	[Username] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthID] [int] IDENTITY(1,1) NOT NULL,
	[AuthName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[AuthDesc] [nvarchar](max) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [Pk_Author] PRIMARY KEY CLUSTERED 
(
	[AuthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[BookDesc] [nvarchar](max) NULL,
	[BookPic] [varchar](50) NULL,
	[DayUpdate] [datetime] NULL,
	[Quality] [int] NULL,
	[TopicID] [int] NULL,
	[PubID] [int] NULL,
 CONSTRAINT [Pk_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookWriter]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookWriter](
	[AuthID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
	[Role] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](50) NULL,
	[Birthday] [datetime] NULL,
 CONSTRAINT [Pk_KhachHang] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Quality] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [Pk_ChiTietDatHang] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[DeliDate] [datetime] NULL,
	[ComplePay] [bit] NULL,
	[DeliStatus] [bit] NULL,
 CONSTRAINT [Pk_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PubID] [int] IDENTITY(1,1) NOT NULL,
	[PubName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [Pk_Publisher] PRIMARY KEY CLUSTERED 
(
	[PubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 3/8/2022 7:33:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](50) NOT NULL,
 CONSTRAINT [Pk_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Username]) VALUES (N'admin', N'123456', N'Vang Hoàng Phi')
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Username]) VALUES (N'user', N'654321', N'Mr Phi')
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthID], [AuthName], [Address], [AuthDesc], [Phone]) VALUES (1, N' Matthieu richard Trịnh Xuân Thuận', N'', N'', N'')
INSERT [dbo].[Author] ([AuthID], [AuthName], [Address], [AuthDesc], [Phone]) VALUES (2, N' Robert B. Laughlin', N'', N'', N'')
INSERT [dbo].[Author] ([AuthID], [AuthName], [Address], [AuthDesc], [Phone]) VALUES (3, N' John Simmons', N'', N'', N'')
INSERT [dbo].[Author] ([AuthID], [AuthName], [Address], [AuthDesc], [Phone]) VALUES (4, N' Joanna Martine Woolfolk', N'', N'', N'')
INSERT [dbo].[Author] ([AuthID], [AuthName], [Address], [AuthDesc], [Phone]) VALUES (5, N' Carl Sagan', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [BookName], [Price], [BookDesc], [BookPic], [DayUpdate], [Quality], [TopicID], [PubID]) VALUES (1, N' Cái vô hạn trong lòng bàn tay - Từ Bigbang đến giác ngộ', CAST(25000 AS Decimal(18, 0)), N' Cái Vô Hạn Trong Lòng Bàn Tay là nội dung toàn bộ cuộc nói chuyện giữa nhà vật lý thiên văn nổi tiếng Trịnh Xuân Thuận và một nhà sư, vốn là một nhà khoa học Mỹ, Matthieu Ricard, về bản chất của hiện thực và ý thức qua lăng kính của vật lý cùng các ngành khoa học tự nhiên và Phật giáo.', N'KH_CVHTLBT.png', CAST(N'2016-01-04T00:00:00.000' AS DateTime), 15, 1, 1)
INSERT [dbo].[Book] ([BookID], [BookName], [Price], [BookDesc], [BookPic], [DayUpdate], [Quality], [TopicID], [PubID]) VALUES (2, N' Một vũ trụ lạ thường', CAST(15000 AS Decimal(18, 0)), N' Nhà vật lý đoạt giải Nobel Robert B. Laughlin đã lập luận rằng, ta vẫn chưa chạm được đến hồi kết của khoa học, mà thậm chí còn chưa tiến gần được đến đó. Ta mới chỉ đi tới cuối con đường của một lối suy nghĩ nào đấy theo quy giản luận mà thôi. Nếu thay cho việc tìm kiếm những lý thuyết tối hậu, ta hãy xem xét thế giới của những đặc tính đột sinh – có nghĩa là những đặc tính kiểu như tính rắn và hình dạng của một tinh thể, kết quả có được từ sự tổ chức của một số lượng lớn các nguyên tử – thì đột nhiên những điều huyền bí nhất sẽ trở nên gần gũi dễ hiểu như một cục nước đá hay một hạt muối vậy thôi. Và rồi Laughlin còn đi xa hơn nữa: những định luật cơ bản nhất của vật lý học – như các định luật chuyển động của Newton hay cơ học lượng tử – hẳn sẽ phải đột sinh. Các định luật này là những đặc tính của những tập hợp vật chất rộng lớn, và khi độ chính xác của chúng được nghiên cứu một cách thật gần cận, chúng sẽ tan biến thành hư không.', N'KH_MVTLT.jpg', CAST(N'2016-01-04T00:00:00.000' AS DateTime), 17, 1, 1)
INSERT [dbo].[Book] ([BookID], [BookName], [Price], [BookDesc], [BookPic], [DayUpdate], [Quality], [TopicID], [PubID]) VALUES (3, N' 100 nhà khoa học có ảnh hưởng nhất trên Thế Giới', CAST(35000 AS Decimal(18, 0)), N' Các nhà khoa học được giới thiệu trong cuốn sách này đều là những nhân vật hàng đầu trong lĩnh vực của mình, họ có ảnh hưởng sâu sắc đối với sự phát triển của thế giới hiện nay. Họ đã mô tả các quy luật vận động, phát hiện ra nguyên lý hoạt động của điện và mô tả kết cấu của nguyên tử. Họ phân giải hóa chất đến nguyên tố, đồng thời đã phát hiện ra sự tồn tại của nguyên tố trên mặt trời, trên mặt trăng, trên các tinh thể và cả nơi sâu nhất trong tâm trái đất.', N'KH_NKH.jpg', CAST(N'2016-02-04T00:00:00.000' AS DateTime), 30, 1, 2)
INSERT [dbo].[Book] ([BookID], [BookName], [Price], [BookDesc], [BookPic], [DayUpdate], [Quality], [TopicID], [PubID]) VALUES (4, N' Quy luật vũ trụ', CAST(75000 AS Decimal(18, 0)), N' Từ trước đến nay chưa từng có cuốn sách chiêm tinh nào giống cuốn sách này. Chỉ trong vài giờ đồng hồ đọc sách bạn đã có thể hiểu rõ về chính mình và vận dụng những hướng dẫn của sách vào từng năm trong cuộc sống để tiên đoán được những sự kiện trong tương lai: được mất, bại thành trong mọi sự việc, đồng thời hiểu rõ ta sinh ra từ đâu và ta từ đâu đến, nhiệm vụ của ta là gì...', N'KH_QLVT.jpg', CAST(N'2016-03-04T00:00:00.000' AS DateTime), 5, 1, 3)
INSERT [dbo].[Book] ([BookID], [BookName], [Price], [BookDesc], [BookPic], [DayUpdate], [Quality], [TopicID], [PubID]) VALUES (5, N' Vũ Trụ', CAST(45000 AS Decimal(18, 0)), N' Vũ Trụ - Sự Tiến Hóa Của Vũ Trụ, Sự Sống Và Nền Văn Minh Mười ba câu chuyện tuyệt đẹp về Vũ trụ. Qua lời kể trữ tình của Carl Sagan, người đọc sẽ có dịp du hành trong vũ trụ, khám phá thế giới từ vĩ mô của những thiên hà to lớn...', N'KH_VT.jpg', CAST(N'2016-04-04T00:00:00.000' AS DateTime), 9, 1, 4)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[BookWriter] ON 

INSERT [dbo].[BookWriter] ([AuthID], [BookID], [Role], [Position]) VALUES (1, 1, N'', N'')
INSERT [dbo].[BookWriter] ([AuthID], [BookID], [Role], [Position]) VALUES (2, 2, N'', N'')
INSERT [dbo].[BookWriter] ([AuthID], [BookID], [Role], [Position]) VALUES (3, 3, N'', N'')
INSERT [dbo].[BookWriter] ([AuthID], [BookID], [Role], [Position]) VALUES (4, 4, N'', N'')
INSERT [dbo].[BookWriter] ([AuthID], [BookID], [Role], [Position]) VALUES (5, 5, N'', N'')
SET IDENTITY_INSERT [dbo].[BookWriter] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (1, N' Nhà xuất bản trẻ', N' 161 B Lý Chính Thắng - Phường 7 - Quận 3 - Thành phố Hồ Chí Minh', N'84839316289')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (2, N' Nhà xuất bản văn hóa thông tin', N' ', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (3, N' Nhà xuất bản đồng nai', N' ', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (4, N' Nhà xuất bản thế giới', N'', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (5, N' Nhà xuất bản khoa học kỹ thuật', N'', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (6, N' Nhà xuất bản hồng đức', N'', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (7, N' Nhà xuất bản thời đại', N'', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (8, N' Nhà xuất bản lao động - xã hội', N' ', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (9, N' Nhà xuất bản tổng hợp TP. HCM', N'', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (10, N' Nhà xuất bản phương đông', N'', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (11, N' Nhà xuất bản lao động', N'', N'')
INSERT [dbo].[Publisher] ([PubID], [PubName], [Address], [Phone]) VALUES (12, N' Nhà xuất bản tri thức', N'', N'')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (1, N' Khoa học')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (2, N' Giáo dục')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (3, N' Chiêm tinh học')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (4, N' Tâm lý con người')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (5, N' Sinh học con người')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (6, N' Công nghệ thông tin')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (7, N' Kỹ năng')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (8, N' Kinh doanh')
INSERT [dbo].[Topic] ([TopicID], [TopicName]) VALUES (9, N' Phật học')
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534631C5F7F]    Script Date: 3/8/2022 7:33:38 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__C9F28456C18C5A8C]    Script Date: 3/8/2022 7:33:38 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [Fk_Publisher] FOREIGN KEY([PubID])
REFERENCES [dbo].[Publisher] ([PubID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [Fk_Publisher]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [Fk_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([TopicID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [Fk_Topic]
GO
ALTER TABLE [dbo].[BookWriter]  WITH CHECK ADD  CONSTRAINT [Fk_Author] FOREIGN KEY([AuthID])
REFERENCES [dbo].[Author] ([AuthID])
GO
ALTER TABLE [dbo].[BookWriter] CHECK CONSTRAINT [Fk_Author]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [Fk_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [Fk_Book]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [Fk_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [Fk_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [Fk_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Fk_Customer]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([Quality]>(0)))
GO
USE [master]
GO
ALTER DATABASE [FPTBOOKStore] SET  READ_WRITE 
GO
