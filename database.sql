/*
Created		31/03/2022
Modified		03/04/2022
Project		
Model		
Company		
Author		
Version		
Database		MS SQL 7 
*/

USE [master]
GO
/****** Object:  Database [ShopMotoBike]    Script Date: 11/26/2021 10:35:02 AM ******/
CREATE DATABASE [Vitaminhouse]
GO
USE [Vitaminhouse]
GO

Create table [Category] (
	[CategoryId] Integer Identity(1,1) NOT NULL UNIQUE,
	[CategoryName] Nvarchar(100) NOT NULL,
	[CategoryDescription] Ntext NULL,
Primary Key  ([CategoryId])
) 
go

Create table [Product] (
	[ProductId] Integer Identity(1,1) NOT NULL UNIQUE,
	[ProductName] Nvarchar(100) NOT NULL,
	[ProductImage] Nvarchar(50) NOT NULL,
	[ProductUnit] Nvarchar(50) NOT NULL,
	[ProductProviders] Nvarchar(100) NOT NULL,
	[ProductPrice] Money NOT NULL,
	[ProductNumber] Integer NOT NULL,
	[ProductDescription] Ntext NULL,
	[ProductDiscount] Float NULL,
	[CategoryId] Integer NOT NULL,
Primary Key  ([ProductId])
) 
go

Create table [Order] (
	[OrderId] Integer Identity(1,1) NOT NULL,
	[OrderDate] Datetime NOT NULL,
	[OrderAddress] Nvarchar(255) NOT NULL,
	[OrderStatus] Integer NOT NULL,
	[OrderRecipientName] Nvarchar(100) NOT NULL,
	[OrderRecipientPhone] Nvarchar(15) NOT NULL,
	[OrderTotalMoney] Money NOT NULL,
	[OrderNotes] Ntext NULL,
	[AccountId] Integer NOT NULL,
Primary Key  ([OrderId])
) 
go

Create table [OrderDetail] (
	[ProductId] Integer NOT NULL,
	[OrderId] Integer NOT NULL,
	[OrderDetailNumber] Integer NOT NULL,
	[OrderDetailPrice] Money NULL,
	[OrderDetailDiscount] Float NULL,
Primary Key  ([ProductId],[OrderId])
) 
go

Create table [Account] (
	[AccountId] Integer Identity(1,1) NOT NULL UNIQUE,
	[AccountName] Nvarchar(100) NOT NULL,
	[AccountPassword] Nvarchar(30) NOT NULL,
	[AccountRole] Integer NOT NULL,
	[AccountStatus] Bit NOT NULL,
	[AccountEmail] Varchar(100) NOT NULL,
	[AccountPhone] Varchar(15) NULL,
	[AccountAddress] Nvarchar(255) NULL,
Primary Key  ([AccountId])
) 
go

Create table [Newspaper] (
	[NewspaperId] Integer Identity(1,1) NOT NULL,
	[NewspaperTitle] Ntext NOT NULL,
	[NewspaperDescription] Ntext NOT NULL,
	[NewspaperDate] Datetime NOT NULL,
	[NewspaperImage] Nvarchar(50) NOT NULL,
Primary Key  ([NewspaperId])
) 
go


Alter table [Product] add  foreign key([CategoryId]) references [Category] ([CategoryId]) 
go
Alter table [OrderDetail] add  foreign key([ProductId]) references [Product] ([ProductId]) 
go
Alter table [OrderDetail] add  foreign key([OrderId]) references [Order] ([OrderId]) 
go
Alter table [Order] add  foreign key([AccountId]) references [Account] ([AccountId]) 
go


Set quoted_identifier on
go

Set quoted_identifier off
go
USE [Vitaminhouse]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (1, N'Đồ uống nhập khẩu', N'Vitamin House chuyên cung cấp Nước Giải Khát, Sữa nhập khẩu từ các thương hiệu uy tín - nổi tiếng trên thế giới.
Với quy trình nhập khẩu, bảo quản Nước Giải Khát, Sữa Nhập Khẩu chặt chẽ đảm bảo mang lại cho khách hàng những sản phẩm đạt chất lượng cao nhưng vẫn giữ được hương vị.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (2, N'Thực phẩm sấy khô', N'Vitamin House chuyên cung cấp Thực Phẩm Sấy Khô nhập khẩu từ các thương hiệu uy tín - nổi tiếng trên thế giới.
Với quy trình nhập khẩu, bảo quản Thực Phẩm Sấy Khô chặt chẽ đảm bảo mang lại cho khách hàng những sản phẩm đạt chất lượng cao nhưng vẫn giữ được hương vị.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (3, N'Bánh, kẹo nhập khẩu', N'Vitamin House chuyên cung cấp Kẹo Nhập Khẩu từ các thương hiệu uy tín - nổi tiếng trên thế giới.
Với quy trình nhập khẩu, bảo quản Kẹo, Bánh chặt chẽ đảm bảo mang lại cho khách hàng những sản phẩm đạt chất lượng cao nhưng vẫn giữ được hương vị.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (4, N'Thực phẩm đông lạnh', N'Với quy trình nhập khẩu, bảo quản Thực phẩm đông lạnh chặt chẽ đảm bảo mang lại cho khách hàng những sản phẩm đạt chất lượng cao nhưng vẫn giữ được hương vị.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription]) VALUES (5, N'Trái cây tươi', N'Với quy trình nhập khẩu, bảo quản Trái cây tươi chặt chẽ đảm bảo mang lại cho khách hàng những sản phẩm đạt chất lượng cao nhưng vẫn giữ được hương vị.')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (1, N'Nước ép lựu Hàn Quốc 180ml', N'uong_1.png', N'Chai', N'Công ty WOONGJIN', 20000.0000, 20, N'Nước ép Lựu Woongjin là thức uống cao cấp được nhập khẩu từ Hàn Quốc. Sản phẩm được chiết suất 100% nước lựu tươi , thơm ngon và hấp dẫn.
Với tinh chất lựu có trong thành phần nước lựu Woongjin chứa vitamin C và E bảo vệ cơ thể khỏi các gốc tự do gây lão hóa, tim mạch, azheimer và ung thư. Đặc biệt là chất chống oxy hóa polyphenol.
', 10, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (2, N'Nước ép nho Hàn Quốc 180ml', N'uong_2.png', N'Chai', N'Công ty WOONGJIN', 18000.0000, 16, N'Nước ép nho Woongjin xuất xứ từ Hàn Quốc với hương vị thơm ngon giúp bổ sung năng lượng và vitamin thiết yếu, cho cơ thể thanh nhiệt trong những ngày nắng nóng.
Sản phẩm được sản xuất từ trái cây nguyên chất, không phẩm màu, không chứa chất bảo quản, đạt tiêu chuẩn an toàn vệ sinh thực phẩm. Nước ép nho nguyên chất dành cho mọi gia đình vô cùng bổ dưỡng và thuận tiện, có tác dụng giảm nhiệt cơ thể và tăng cường vitamin C.', 10, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (3, N'Chai Nước Ép Rauch Các Vị 200ml', N'uong_3.png', N'Chai', N'Công ty RAUCH', 33000.0000, 1, N'Nước trái cây Rauch được làm từ trái cây tươi tự nhiên trên vùng núi cao tại đất nước Áo xinh đẹp. Một trong những điểm nổi bật của nhà máy là vùng nguyên liệu trái cây tươi, và nguồn nước sử dụng sản xuất từ dãy núi Alps đảm bảo độ sạch và tinh khiết. Nguyên liệu được lựa chọn, kiểm tra nghiêm ngặt. Nước trái cây Rauch từ trái cây tươi tự nhiên, không thêm đường, không chất bảo quản. Với công nghệ sản xuất hiện đại, nước ép Rauch lưu giữ trọn vitamin có trong trái cây, giúp cơ thể sảng khoái, tươi mát suốt ngày dài.
Rauch là nước ép trái cây cao cấp từ Áo, Châu Âu và công ty Ân Nam độc quyền phân phối tại Việt Nam. Rauch được làm từ những loại trái cây tươi ngon nhất từ khắp nơi trên thế giới, đặc biệt có chứng chỉ ‘Vegan’ (thuần chay).  không sử dụng bất cứ nguyên liệu nào có nguồn gốc từ động vật, ví dụ như Gelatin trong quá trình sản xuất nên là 100% thuần chay. Nước Ép Rauch không chứa cồn (Alcohol) nên bạn có thể yên tâm sử dụng.', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (4, N'Hộp Cà Phê Hòa Tan Davidoff Rich 25pack', N'uong_4.jpg', N'Hộp', N'Công ty DAVIDOFF', 150000.0000, 20, N'Davidoff là thương hiệu quốc tế thượng hạng cho người sành cà phê

– Cà phê Davidoff được chế biến từ loại cà phê Arabica gieo trồng trên những vùng đất trù phú do được dung nham của núi lửa bồi đắp, có độ cao 1000-2000m, trong môi trường khí hậu điều hòa tinh khiết với lượng mưa ổn định quanh năm và nhiệt độ 15-25oC. Chính những đặc trưng về địa lý này đã mang lại hương vị nồng nàn, quyến rũ đặc thù riêng của cà phê Davidoff.

– Sản phẩm được thiết kế trong những lọ thủy tinh sang trọng với những đường nét mượt mà và tinh tế mà nhà sản xuất Davidoff đã dày công xây dựng và phát triển qua nhiều thập kỷ.

– Toàn bộ các sản phẩm cà phê hiệu Davidoff đều được nhập khẩu trực tiếp từ nhà sản xuất và đạt tiêu chuẩn thực phẩm quốc tế (IFS). Cà phê Davidoff

– Chất lượng vượt trội, sang trọng và an toàn', 0, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (5, N'Hộp Cafe Hòa Tan Nestle Gold Blend Nhật', N'uong_5.jpg', N'Hộp', N'Công ty NESTLE', 105000.0000, 20, N'Với mục tiêu mang hương vị hảo hạng đến với mọi người và bất kỳ lúc nào trong ngày bạn cũng sẽ có thể thưởng thức đủ mọi hương vị.
Bạn sẽ không cần phải chờ quá lâu để có 1 ly thơm nóng thơm trên tay của mình.
Thật sự đây là một trong những thương hiệu cà phê chỉ cần bạn thưởng thức 1 lần duy nhất mãi bạn sẽ không bao giờ quên được ', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (6, N'Bách Niên Cổ Trà Bạch Thiên 60g', N'uong_6.jpg', N'Hộp', N'Công ty TIÊN THIÊN TRÀ', 410000.0000, 100, N'Tiên Thiên là khởi nguyên của Vũ Trụ, là nguyên khí của trời đất, là khí thuần dương thúc đẩy muôn loài hóa sinh…
Chè Shan Tuyết Cổ Thụ là loài cây quý hiếm hấp thụ dồi dào chân khí Tiên Thiên, loại trà thu hoạch từ đó được gọi là Tiên Thiên Trà.
Đội ngũ Tiên Thiên luôn có năng lượng sáng tạo cũng như tầm nhìn khách biệt, với mong muốn đưa cây chè Shan Tuyết cổ thụ quý hiếm tới người yêu trà trong và ngoài nước.
Với những giá trị cốt lõi: Quy tụ – Cống Hiến và Lan Tỏa đội ngũ Tiên Thiên mang trong mình một Sứ Mệnh Kết nối, công hưởng và tôn vinh những người làm Trà, lan tỏa văn hóa Trà Việt tới cộng đồng yêu trà, từ đó hỗ trợ người dân bản địa giữ gìn và bảo tồn giống Chè Cổ Thụ Quý hiếm này.
Với Tầm nhìn và Sứ mênh đó Tiên Thiên Trà đã cho ra mắt các sản phẩm như Bạch Trà, Hồng Trà, Lục Trà,…', 30, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (7, N'Hộp Hồng Trà Túi Lọc Etre 50g', N'uong_7.jpg', N'Hộp', N'VITAMIN HOUSE', 42000.0000, 0, N'Đây là BST trà đen túi lọc Noori tiện lợi đến từ nước Nga, với nhiều vị trái cây thơm ngon, dễ uống. Là nhãn hiệu trà có mặt trên thị trường từ năm 1995, của công ty Orimi Trade, cũng chính là hãng sản xuất là trà Greenfield và Tess trứ danh đấy ạ. Do vậy chất lượng và hương vị trà mọi người cứ mạnh dạn trải nghiệm và thưởng thức. rà túi lọc 100% từ thiên nhiên với hương vị hảo hạng nhất.', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (8, N'Trà chanh Ít Đường Marigold Ice Lemon Tea 250ml', N'uong_8.jpg', N'Hộp', N'Công ty MARIGOLD', 14000.0000, 20, N'Nước ép trái cây MARIGOLD được nhập khẩu tại SINGAPORE không chỉ có màu sắc hấp dẫn, hương vị ngọt thanh, nước ép trái cây còn đa dạng về vị và cực dễ uống. Đều đặn uống nước ép trái cây mỗi ngày, bạn sẽ có sức đề kháng tốt, một làn da khỏe mạnh và còn chứa rất nhiều vitamin thiết yếu cho cơ thể.
Nước ép hoa quả 100% MariGold được sản xuất từ trái cây nguyên chất trên dây chuyền công nghệ hiện đại, với quy trình sản xuất nghiêm ngặt, kiểm soát chặt chẽ từ nông trại đến nhà máy, không sử dụng chất bảo quản hay màu nhân tạo, nên không làm mất đi chất dinh dưỡng vốn có của trái cây tươi.
Nước ép trái cây MARIGOLD được nhập khẩu tại Singapore không chỉ có màu sắc hấp dẫn, hương vị ngọt thanh, nước ép trái cây còn đa dạng về vị và cực dễ uống. Đều đặn uống nước ép trái cây mỗi ngày, bạn sẽ có sức đề kháng tốt, một làn da khỏe mạnh và còn chứa rất nhiều vitamin thiết yếu cho cơ thể rất tốt cho các bé và cả nhà.
Nước trái cây rất thơm ngon, chứa nhiều vitamin B và C. Nước trái cây hỗ trợ các triệu chứng viêm khớp, cũng như giúp xoa dịu, giảm nhẹ và làm sạch hệ tiêu hóa. Loại nước uống này cũng hiệu quả trong việc điều trị chứng táo bón và tiêu chảy. Nhất là các bé chuẩn bị đi học sau dịch trong tiết trời tháng 5, tháng 6 rất nắng nóng Nước ép hoa quả MariGold rất tiện lợi cho bé mang đi học và cả gia đình đi picnic.
 Hiện tại nhà Min đang có các vị: Trà hoa cúc, trà bí đao, trà chanh, trà chanh lúa mạch, trà long nhãn - táo đỏ, nước ép táo-kiwi, nước ép vải, nho, cam, xoài, táo.', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (9, N'Thạch Gumi Gumi Vitamin C 150g', N'uong_9.jpg', N'Túi', N'Công ty GUMI GUMI', 16000.0000, 10, N'Gumi Gumi là một thương hiệu nước uống trái cây toàn cầu luôn được người dùng tin cậy. Sản phẩm được sản xuất bởi Công ty TNHH Sappe Nhật Bản. Thương hiệu này bao gồm nhiều loại thức uống khác nhau, đáp ứng đầy đủ nhu cầu của những người yêu thích sức khỏe và sự tiện lợi.
Nước Thạch Trái Cây Jelly Gumi Gumi 150g bổ sung Vitamin cho cơ thể, có chứa nhiều Vitamin C và Collagen, L-Carnitine, Glutathione giúp hệ miễn dịch khỏe mạnh, chống lão hóa da. Sản phẩm có chưa rất ít calories, phù hợp cho mọi người. Nhất là phái đẹp, uống Jelly Gumi Gumi giúp da đẹp dáng chuẩn.
Với hương vị kết hợp giữa thạch và nước ép trái cây tạo nên vị chua ngọt dịu nhẹ kích thích, kết hợp cùng thạch dai giòn mang đến cảm giác giải nhiệt ngay tức thì.
Có thể sử dụng trước bữa ăn để tạo sự ngon miệng, có thể mang theo khi đi học, đi chơi, đi picnic với gia đình mà vẫn đảm bảo sức khoẻ.
Nước ép trái cây thạch Jelly Gumi Gumi có thể bù đắp nguồn năng lượng cho bạn trong giờ giải lao, cung cấp nước, xua tan mệt mỏi ngày dài.', 10, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (10, N'Nước OKF Watermelon With Aloe 500ml', N'uong_10.jpg', N'Chai', N'Công ty OKF', 32000.0000, 20, N'Nước ép nho Woongjin xuất xứ từ Hàn Quốc với hương vị thơm ngon giúp bổ sung năng lượng và vitamin thiết yếu, cho cơ thể thanh nhiệt trong những ngày nắng nóng.
Sản phẩm được sản xuất từ trái cây nguyên chất, không phẩm màu, không chứa chất bảo quản, đạt tiêu chuẩn an toàn vệ sinh thực phẩm. Nước ép nho nguyên chất dành cho mọi gia đình vô cùng bổ dưỡng và thuận tiện, có tác dụng giảm nhiệt cơ thể và tăng cường vitamin C.', 10, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (11, N'Nước ép xoài Hàn Quốc 1lít rưỡi', N'uong_11.jpg', N'Chai', N'Công ty WOONGJIN', 90000.0000, 20, N'Trong 1 ly sinh tố xoài chúng ta sẽ nhận được tỷ lệ dinh dưỡng: 103 kalo, 75% vitamin C, 24% vitamin A, 12% vitamin B6 và 1 số vitamin B khác, 10% lợi khuẩn, 8% đồng, 8% kali và 5% magie. Chúng đều là những chất dinh dưỡng quan trọng với cơ thể, giúp cơ thể bé tăng sức đề kháng, hỗ trợ tốt cho tim mạch và trí não.
Trong 1 ly sinh tố xoài chúng ta sẽ nhận được tỷ lệ dinh dưỡng: 103 kalo, 75% vitamin C, 24% vitamin A, 12% vitamin B6 và 1 số vitamin B khác, 10% lợi khuẩn, 8% đồng, 8% kali và 5% magie. Chúng đều là những chất dinh dưỡng quan trọng với cơ thể, giúp cơ thể bé tăng sức đề kháng, hỗ trợ tốt cho tim mạch và trí não.
Tăng cường thị lực: lượng vitamin A trong xoài là thành phần tốt cho sức khỏe đôi mắt bé. Bên cạnh đó, các chất chống oxy hóa zeaxanthin và lutein trong xoài còn giúp bảo vệ mắt trẻ khỏi các sóng ánh sáng năng lượng cao như tia cực tím của ánh sáng mặt trời, giữ gìn sức khỏe và nét đẹp cho đôi mắt.
Hỗ trợ tiêu hóa: ngoài đu đủ, xoài cũng là trái cây chứa enzym để chuyển hóa protein trong quá trình tiêu hóa.
Chất xơ trong xoài giúp hệ tiêu hóa của bé khỏe mạnh, ngăn ngừa táo bón. Các enzym có lợi còn được dùng để chữa kiết lị, nhiễm trùng đường tiết niệu.
Tăng cường hệ miễn dịch: với hàm lượng lớn vitamin A và C, cộng với 26 loại carotenoids khác nhau có trong xoài, nó giúp duy trì sự bền vững và khỏe mạnh của hệ thống miễn dịch, giúp bé học hỏi và phát triển tốt hơn.
Cải thiện trí nhớ: xoài chứa vitamin B6, nó giúp kích thích não bộ và duy trì chức năng của bộ nhớ, đồng thời thúc đẩy nhận thức, cải thiện trí nhớ và sự tập trung.
Cho bé uống nước ép hay sinh tố xoài cũng thật tốt cho "sức khỏe" trí não.', 0, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (12, N'Nước ép Bundaberg Apple 375ml', N'uong_12.png', N'Chai', N'Công ty BUNDABERG', 54000.0000, 10, N'Nhắc đến nước ép, người ta thường nghĩ ngay đến các sản phẩm với nguồn gốc tự nhiên đem đến trải nghiệm tuyệt vời cho người uống. Và Bundaberg cũng vậy. Với hàng loạt hương vị trái cây khác nhau, những chai nước ép táo này thực sự là điểm nhấn đầy hấp dẫn cho người uống.
Là loại thức uống được làm từ táo và trải qua quá trình lên men tự nhiên nhằm đem đến mùi vị tuyệt vời trong từng ngụm nước ép.
Bundaberg sở hữu hương vị thơm dịu, cùng vị ngọt dịu đặc trưng của táo. Tất cả đem đến cho người uống một loại thức uống thơm ngon.
Nước ép táo thơm ngon, giàu vitamin cùng các dưỡng chất cho cơ thể. Nước ép được chứa trong những chai thuỷ tinh nhỏ xinh 375ml đủ để bạn trải nghiệm và thưởng thức hương vị của các loại nước ép hấp dẫn này.', 10, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (13, N'Nước ép Bundaberg Creaming Soda 375ml', N'uong_13.png', N'Chai', N'Công ty BUNDABERG', 54000.0000, 20, N'Vị nho đặc trưng nổi bật, mang hương vị ngọt dịu và khá thu hút người dùng.
Nước ép được làm từ những quả nho nguyên chất, được lên men khá kỹ lưỡng (7 ngày) để vị nước ép trở nên thơm ngon và hấp dẫn hơn. Đặc biệt, Bundaberg với dư vị ngọt ngào cùng trải nghiệm tuyệt vời khi thưởng thức. Vị nho đặc trưng nổi bật, mang hương vị ngọt dịu và khá thu hút người dùng. Thêm vào đó, các loại nước ép lại dễ uống với hậu vị ngọt vừa và thích hợp với khẩu vị nhiều người. Thêm một điểm cộng, chính là những chai nước ép Bundaberg này được bổ sung thêm gas, nhằm đem đến cảm giác thú vị cho vị giác người dùng.
Là một trong số những dòng nước ép thơm ngon, sở hữu hương vị trái cây tự nhiên và mềm mại. Vị nước ép thơm ngon, được đóng trong những chai thuỷ tinh 375ml đủ sức chinh phục người uống.
Là một trong số những loại thức uống thơm ngon, thú vị và hấp dẫn, các loại nước ép Bundaberg sẽ ngon hơn khi thưởng thức lạnh. Nước ép khi dùng lạnh dễ uống, dễ cảm nhận và dễ thưởng thức hơn bao giờ hết.', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (14, N'Nescafé Gold Vanilla Latte UK', N'uong_14.jpg', N'Hộp', N'Công ty NESTLE', 95000.0000, 0, N'Với mục tiêu mang hương vị hảo hạng đến với mọi người và bất kỳ lúc nào trong ngày bạn cũng sẽ có thể thưởng thức đủ mọi hương vị.
Bạn sẽ không cần phải chờ quá lâu để có 1 ly thơm nóng thơm trên tay của mình.
Thật sự đây là một trong những thương hiệu cà phê chỉ cần bạn thưởng thức 1 lần duy nhất mãi bạn sẽ không bao giờ quên được.', 0, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (15, N'Nước Ép Nho Woongjin Hàn Quốc 1L5', N'uong_15.jpg', N'Chai', N'Công ty WOONGJIN', 105000.0000, 1, N'Nho được biết đến như một loại hoa quả có nhiều chất dinh dưỡng, hơn nữa hợp chất flavon trong trái nho và lá nho có tác dụng kháng ôxy hóa tốt hơn sinh tố C và E. Vì vậy, quả nho còn có tác dụng làm đẹp rất hiệu quả, đặc biệt đối với chị em phụ nữ.
Nho được biết đến như một loại hoa quả có nhiều chất dinh dưỡng, hơn nữa hợp chất flavon trong trái nho và lá nho có tác dụng kháng ôxy hóa tốt hơn sinh tố C và E. Vì vậy, quả nho còn có tác dụng làm đẹp rất hiệu quả, đặc biệt đối với chị em phụ nữ, nước nho Woongjin có tác dụng chống oxy hóa, giúp duy trì một làn da luôn tươi trẻ, rất tốt cho sức khỏe.
Nước ép nho Woongjin Hàn Quốc được sản xuất từ 100% là nước ép nho tự nhiên mang lại hương vị đậm đà, tuyệt ngon, không phẩm màu, không chứa chất bảo quản, đạt tiêu chuẩn an toàn vệ sinh thực phẩm, nước ép nho Woongjin với hương vị thơm ngon, giúp bổ sung năng lượng và vitamin thiết yếu cho cơ thể của bạn.
Những tác dụng nổi bật của nước ép nho 100% nguyên chất như: tăng cường sức đề kháng, bảo vệ tim mạch, chống oxy hóa, ngăn ngừa ung thư, có tác dụng thải độc, giúp làn da tươi trẻ và giúp giảm cân hiệu quả... Nước ép nho nguyên chất dành cho mọi gia đình vô cùng bổ dưỡng và thuận tiện, có tác dụng giảm nhiệt cơ thể và tăng cường vitamin C.', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (16, N'Nước ép Bundaberg Ginger Beer (Diet)', N'uong_16.jpg', N'Chai', N'Công ty WOONGJIN', 53000.0000, 20, N'Bia gừng Ginger Beer diet Bundaberg 375ml là loại nước giải khát không cồn, có ga, mang hương vị Gừng mạnh mẽ và không đường dành cho những người đang giảm cân hoặc kiêng đường. Đây là loại nước uống thơm ngon, mang lại nhiều tác dụng tốt cho sức khỏe, rất được yêu thích tại Anh Quốc, Mỹ, Úc và nhiều nước khác trên thế giới. Tuy nhiên, đối với người tiêu dùng tại Việt Nam, nó còn khá xa lạ, và bia Gừng chỉ mới phổ biến trong thời gian gần đây, tuy nhiên ngày càng nhiều người yêu thích nó.
Sản phẩm không đường mang thương hiệu Bundaberg, là một thương hiệu đến từ Úc, thuộc sở hữu của gia đình.Bia Gừng Ginger beer Diet Bundaberg nổi tiếng loại đồ uống không đường được yêu thích của Úc. Nó được sản xuất bằng phương pháp thủ công, trải qua quá trình ủ, lên men từ công thức đặc biệt của dòng họ được truyền lại từ thế hệ này sang thế hệ khác. Nó là một di sản không chỉ của riêng gia đình, mà còn là di sản của nước Úc, có tên gọi là “Bundaberg Brewed”.', 20, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (17, N'Nước ép đào Gaya Woongjin 1L5', N'uong_17.png', N'Chai', N'Công ty BUNDABERG', 75000.0000, 18, N'Đào là một loại trái cây giàu vitamin và khoáng chất, đem đến nhiều lợi ích sức khỏe cho bạn. Nước ép đào Gaya Woongjin 1L5 không chỉ thơm ngon, đậm vị mà còn giúp bạn hấp thụ các dưỡng chất nhanh hơn. Uống một ly nước ép đào hằng ngày không chỉ cải thiện sức khỏe mà còn tăng khả năng miễn dịch, bảo vệ cơ thể khỏi nhiều vấn đề sức khỏe không mong muốn.
Đào có nguồn gốc ở miền bắc Trung Quốc nay được trồng và cấy ghép phổ biến ở nhiều quốc gia trên khắp thế giới và là một loại trái cây văn hóa, ẩm thực. Không những thế nó còn dùng như một loại dược liệu dùng để chữa trị nhiều loại bệnh.
Có mặt từ năm 1991, trang trại Gaya tại Hàn Quốc đã gây ấn tượng với người tiêu dùng bằng hàng loạt nước ép trái cây tự nhiên được lựa chọn kĩ càng từ nguồn nguyên liệu tươi xanh. Và một trong số loại được yêu thích phải kể đến là Nước ép đào Gaya Farm 1.5L.
Khác với những sản phẩm đã có mặt trên thị trường, Gaya Farm chỉ sử dụng đào tươi và có hàm lượng đào được tăng cao nhằm mang đến hương vị độc đáo giúp người dùng cảm nhận được rõ hơn vị thơm đặc trưng của đào.
Ngoài công dụng là một loại nước giải khát, nước ép đào còn giúp bổ sung năng lượng và vitamin thiết yếu cho cơ thể thanh nhiệt.', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (18, N'Nước ép việt quất HQ 1L5', N'uong_18.jpg', N'Chai', N'Công ty WOONGJIN', 90000.0000, 20, N'Nước ép việt quất nguyên chất dành cho mọi gia đình vô cùng bổ dưỡng và thuận tiện, có tác dụng giảm nhiệt cơ thể và tăng cường vitamin C.
WoongJin là thương hiệu có xuất xứ từ Hàn Quốc, chuyên sản xuất kinh doanh các loại nước giải khát đóng lon có hương vị Hàn Quốc đặc trưng thơm ngon hấp dẫn. Các sản phẩm đã được chọn lựa từ những nguyên liệu cao cấp, trên quy trình chế biến hiện đại, không chỉ được người dân trong nước tin dùng mà còn xuất khẩu sang các nước ngoài, được nhiều người tìm mua và săn đón.
Sản phẩm được sản xuất từ trái cây nguyên chất, không phẩm màu, không chứa chất bảo quản, đạt tiêu chuẩn an toàn vệ sinh thực phẩm.
Nước ép việt quất nguyên chất dành cho mọi gia đình vô cùng bổ dưỡng và thuận tiện, có tác dụng giảm nhiệt cơ thể và tăng cường vitamin C.
Sản phẩm được đóng chai tiện lợi cho việc bảo quản cũng như dễ dàng mang theo bên người khi cần di chuyển. Chai 1.5 L giúp tiết kiệm thời gian mua sắm và chi phí.', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (19, N'Nước ép lựu HQ 1L5', N'uong_19.jpg', N'Chai', N'Công ty WOONGJIN', 95000.0000, 2, N'Nước ép Lựu Woongjin là thức uống cao cấp được nhập khẩu từ Hàn Quốc. Sản phẩm được chiết suất 100% nước lựu tươi , thơm ngon và hấp dẫn.
Với tinh chất lựu có trong thành phần nước lựu Woongjin chứa vitamin C và E bảo vệ cơ thể khỏi các gốc tự do gây lão hóa, tim mạch, azheimer và ung thư. Đặc biệt là chất chống oxy hóa polyphenol.
', 5, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (20, N'Đậu Phộng Rang Planters Mỹ 454g', N'kho_1.png', N'Túi', N'Công ty PLANTERS', 165000.0000, 20, N'Đậu Phộng Planters Dry Roasted Peanuts là loại đậu phộng giúp bạn no lâu và hỗ trợ tiêu hóa, Niacin (Vitamin B) có chứa trong thành phần của đậu phộng giúp chuyển hóa thức ăn thành năng lượng, cung cấp khoảng 15% lượng Niacin cần thiết mỗi ngày.
Vitamin E giúp chống oxy hóa và chứa 80% loại chất béo tốt cho sức khỏe. Những bằng chứng khoa học chỉ ra rằng ăn mỗi ngày những loại hạt như: đậu phộng, hạnh nhân, hồ trăn, hồ đào… không những không dẫn đến tăng lượng calo mà còn làm giảm nguy cơ mắc bệnh tim mạch vành. Hướng dẫn sử dụng Mở gói và dùng trực tiếp không cần chế biến.
Lưu ý: Khi sử dụng còn bạn nên cột kỹ miệng để tránh gió vào sẽ làm dịu bánh gây mất độ giòn. Để nơi khô ráo, tránh ánh nắng trực tiếp, nên để ở nhiệt độ phòng', 10, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (21, N'Bịch Hạt Hỗn Hợp Hồ Trăn Và Bạch Quả Alesto (tím)', N'kho_2.jpg', N'Túi', N'Công ty ALESTO', 180000.0000, 4, N'Thương hiêu Alesto đến từ Úc nổi tiếng với các sản phẩm hạt tốt cho sức khỏe trong đó Hạt hạnh nhân Alesto là một trong những sản phẩm '''' best seller '''' của hãng. Được sản xuất từ những hạt hạnh nhân chọn lọc kĩ lưỡng mang tới hương vị thơm ngon, cung cấp một lượng dinh dưỡng nhất định cho cơ thể hoạt động trong suốt ngày dài.
Với thiết kế túi zip tiện lợi cho mỗi lần sử dụng, sản phẩm tiện lợi để mang theo khi đi xa. Hạnh nhân Alesto được sản xuất trên dây chuyền hiện đại với các nguyên liệu được chọn lọc kỹ lưỡng đảm bảo an toàn tuyệt đối cho gia đình bạn.
Các loại hạt có chứa chất béo không bão hòa, giúp lượng cholesterol trong máu thấp hơn. Mỗi loại hạt trong tác động tích cực của nó đối với sức khỏe của bạn: tăng cường tim và mạch máu, giúp bệnh tiểu đường và rối loạn tiêu hóa, cân bằng sự trao đổi chất và giúp các bệnh ngoài da. Một hỗn hợp như vậy của các loại hạt có thể cung cấp cho cơ thể của bạn với các vitamin và khoáng chất thiết yếu.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (22, N'Khoai lang sấy Kenji 400g Taiwan', N'kho_3.jpg', N'Túi', N'Công ty KENJI', 475000.0000, 20, N'Khoai lang là thuộc thực phẩm giàu dinh dưỡng như vitamin A,B, C, D,E protein, tinh bột, axit amin và rất nhiều các nguyên tố vi lượng như canxi, sắt , kẽm …Đây là một trong những thực phẩm thường xuyên có mặt trong bữa ăn gia đình.
Khoai lang là thuộc thực phẩm giàu dinh dưỡng như vitamin A,B, C, D,E protein, tinh bột, axit amin và rất nhiều các nguyên tố vi lượng như canxi, sắt , kẽm …Đây là một trong những thực phẩm thường xuyên có mặt trong bữa ăn gia đình.
Tăng cường sức khỏe tổng quát nhờ hàm lượng vitamin dồi dào Vitamin D trong khoai lang có tác dụng hỗ trợ hệ miễn dịch và tăng cường sức khỏe. Vitamin D góp phần giữ cho hệ xương, tim mạch thần kinh răng và tuyến giáp khỏe mạnh.
Khoai lang giúp cân bằng lượng đường trong máu: khoai lang có chứa nhiều carotenoics có chức năng điều hòa đường huyết. Ngoài ra, nó còn có khả năng làm giảm sự kháng insulin. Insulin rất cần thiết cho cơ thể để mở khóa tế bào, cho phép đường từ máu đi vào tế bào. Kháng insulin nghĩa là khi tế bào không đáp ứng với insulin không cho phép đường huyết đi vào tế bào một cách tự nhiên để nuôi dưỡng tế bào.Nguồn chất sơ phong phú có trong khoai lang cũng có tác dụng làm giảm nồng độ đường huyết bằng cách làm giảm tốc độ của thực phẩm bị biến chuyển thành glucose để hấp thụ vào máu.', 0, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (23, N'Sầu Riêng Sấy Sriwanna Thái Lan 210g', N'kho_4.jpg', N'Túi', N'Công ty WOONGJIN', 260000.0000, 1, N'Sầu Riêng Sấy Sriwanna Thái Lan có vị ngọt thanh tự nhiên, không đường, giòn xốp, hương vị hương vị thơm ngon, bổ dưỡng, nguyên chất đặc trưng cho những miếng sầu riêng sấy khô giòn béo, đậm chất, đậm mùi không khác gì quả tươi. Được chọn lọc từ những nguyên liệu tươi ngon chọn loại sầu riêng tươi thơm ngon nổi tiếng để chế biến sầu riêng sấy khô từ những nông trại đạt tiêu chuẩn không làm mất các chất dinh dưỡng trong quá trình sấy, đảm bảo vệ sinh an ninh thực phẩm. hoàn toàn không sử dụng hóa chất và phụ gia thực phẩm.
Với công nghệ sấy thăng hoa (sấy đông khô), nhà sản xuất lựa chọn loại sầu riêng tươi ngon, tách bỏ vỏ - hạt, và đông khô 100% thành phần là cơm sầu riêng. Công nghệ sản xuất đã giúp cho sản phẩm giữ được nguyên vẹn cấu trúc, mùi vị, màu sắc và hình dạng như lúc tươi và quan trọng hơn công nghệ giúp cho sản phẩm không bị mất các chất dinh dưỡng mà vẫn giữ nguyên các vi chất, vitamin, protein…trong cơm của quả sầu riêng.
Giá trị dinh dưỡng của sầu riêng: người ta ghi nhận trái sầu riêng có tác dụng giúp tăng cường và phục hồi sức khỏe cho người ốm yếu, có ích cho cơ bắp, duy trì sự chắc khỏe của xương, giúp duy trì và điều hòa hoạt động của tuyến giáp, bảo vệ sự khỏe mạnh cho răng và lợi; cung cấp một nguồn chất béo thô có lợi cho cơ thể, giúp phòng tránh và giảm bớt chứng táo bón, giúp tiêu hóa tốt và làm giảm bệnh đau nửa đầu.
Do chứa chất acid amin tryptophan cao, nên sầu riêng có tác dụng giúp giảm bớt trầm cảm, mất ngủ, tạo ra cảm giác thư thái cho con người bằng cách tăng mức độ serotonin trong não bộ, đẩy lùi tình trạng lo âu, chán nản. Sầu riêng còn giúp làm sạch máu.
Bảo quản sầu riêng: nếu bạn dùng một lần không hết một sản phẩm sầu riêng sấy thì hãy gấp kín miệng bao và cho vào ngăn mát dùng dần. Không nên dùng trên 1 tháng.', 10, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (24, N'Đậu Hà Lan sấy giòn DJ&A', N'kho_5.jpg', N'Túi', N'Công ty DJ&A', 53000.0000, 20, N'Đậu Hà Lan Sấy Giòn Dj&A Gói 75g là sản phẩm không có bột ngọt, không biến đổi gen. Không có màu nhân tạo, hương vị hoặc bảo quản. Không chỉ giàu chất dinh dưỡng mà còn thân thiện với môi trường.
Các nhà nghiên cứu đã phát hiện ra coumestrol một loại dinh dưỡng thực vật trong đậu Hà Lan có tác dụng chống lại bệnh ung thư, tốt cho sức khỏe:
     -  Giảm lượng đường trong máu
     -   Tăng cường sức khỏe mắt
     -   Hỗ trợ tiêu hóa
     -   Tăng cường miễn dịch
     -   Giúp giảm cân
     -   Tăng cường sức khỏe da và tóc.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (25, N'Táo Đỏ Sấy Khô 500g', N'kho_6.jpg', N'Túi', N'Công ty WOONGJIN', 390000.0000, 10, N'Táo đỏ sấy khô là một trong loại thực phẩm được ưa thích nhất hiện nay không chỉ bởi hương vị đặc trưng thơm ngon mà còn nổi tiếng là một loại thực phẩm rất giàu dinh dưỡng liều thuốc bổ thường được dùng chưng cùng yến cực kỳ tốt và bổ dưỡng.
Sản phẩm giàu dinh dưỡng bởi các thành phần như: Protein, canxi, photpho, các Viatmin A, C, B1, B2,... mang giá trị tuyệt vời cho sức khỏe tăng cường miễn dịch, hô hấp, tốt cho tiêu hóa, bổ gan thận, giải độc. Đặc biệt nó bổ sung lượng sắt dồi dào hết sức cần thiết cho thai phụ.
Táo đỏ mật được sử dụng như món ăn truyền thống của người Hàn Quốc, Triều Tiên, Việt Nam… Ngoài ra, nó cũng được dùng để làm mứt táo, làm chè táo, hoặc xi rô trà ngâm đường chứa táo đỏ được chứa trong các chai lọ thủy tinh, còn trà táo đóng hộp hay đóng túi giấy cũng có sẵn.', 0, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (26, N'Táo đỏ hộp 1KG UHAC Hàn Quốc (new)', N'kho_7.jpg', N'Hộp', N'Công ty UHAC', 150000.0000, 20, N'Táo đỏ Hàn Quốc sấy khô chứa nhiều loại vitamin A, C, B1, canxi, lipit, protein, đường, sắt,.. Không chỉ là loại quả được nhiều người thích, táo đỏ sấy còn là một liều thuốc bổ chữa các bệnh liên quan tới dạ dày, thần kinh,... giúp bổ sung khí huyết và phục hồi sức khỏe một cách nhanh chóng.
Táo đỏ có nguồn gốc từ Bắc Phi, được di thực sang Ấn Độ và Trung Quốc. Hiện nay, cây được trồng rộng rãi tại các nước vùng nhiệt đới. Táo đỏ là loại thảo dược dùng được cả quả, hạt và lá táo đỏ để làm thuốc nhưng thông thường, người ta hay sử dụng quả đem phơi khô do có nhiều dưỡng chất hơn.
Nhiều nghiên cứu đã chỉ ra trong loại quả này chứa nhiều nước, protein, vitamin C và các acid hữu cơ như malic acid và gallic acid, Flavonoid, kali, Natri, Ca, Mg, Fe, …Đặc biệt, hàm lượng vitamin C trong loại quả này cao hơn hẳn các loại quả khác như táo, nho, đào, sơn tra, cam, quýt. Ngoài ra nó còn chứa vitamin A, vitamin nhóm B, vitamin PP, muối khoáng, chất màu, axit hữu cơ, chất thơm, tannin, …Riêng hàm lượng sắt, trong 100g táo khô ước tính có tới 1,7mg.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (27, N'Bịch Hạt Dẻ Cười Rang Muối Alesto Đức 250g', N'kho_8.jpg', N'Túi', N'Công ty ALESTO', 210000.0000, 1, N'HẠT DẺ CƯỜI ALESTO ( không tách vỏ) - Món ngon ăn vặt không thể thiếu trong ngày Tết ạ! món ăn vặt được nhiều người yêu thích bởi hương vị thơm ngon, bùi ngậy. 
Hạt dẻ cười cũng có hàm lượng dinh dưỡng khá cao và rất tốt cho sức khỏe. 
Trong hạt dẻ cười có chứa các chất như vitamin B6, vitamin E và hơn 30 loại vitamin khác rất có ích cho cơ thể,đặc biệt là trong việc hỗ trợ phân giải và hấp thụ các chất dinh dưỡng.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (28, N'Hộp Hạt Hỗn Hợp Low Cholesterol JC 200g', N'kho_9.png', N'Hộp', N'Công ty JC', 170000.0000, 20, N'Hỗn hợp hạt tự nhiên ít Cholesterol nhập khẩu chính hãng Úc, cho người ăn kiêng, bệnh nhân tiểu đường, tim mạch, cao huyết áp JC''s là thương hiệu hàng đầu các loại hạt tự nhiên tại Úc, nhiều năm liền là thương hiệu dành cho sức khoẻ.
Quy cách: Túi 200g.
HSD: 10 tháng từ ngày sản xuất.
Cách dùng: ăn trực tiếp, dùng làm bánh, nấu ăn, làm sữa hạt.
Thành phần: hạnh nhân, hạt bí, hạt hướng dương, trái cây sấy khô,...', 20, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (29, N'Me không hạt Thái Lan ngọt 180g ( hộp đỏ )', N'kho_10.jpg', N'Hộp', N'Công ty VITAMINHOUSE', 130000.0000, 5, N'Me được sấy khô, tách vỏ và đóng gói kín đáo, trái me to, vị ngọt tự nhiên hòa quyện với vị chua đặc trưng, thêm vị cay của bột ớt tươi rất kích thích vị giác nên được thực khách nhiều lứa tuổi yêu thích.
Me không hạt Thái Lan vị chua ngọt là sản phẩm được nhập khẩu trực tiếp từ Thái Lan. Me được sấy khô, tách vỏ và đóng gói kín đáo, trái me to, vị ngọt tự nhiên hòa quyện với vị chua đặc trưng, thêm vị cay của bột ớt tươi rất kích thích vị giác nên được thực khách nhiều lứa tuổi yêu thích.
Sản phẩm được sản xuất trên dây chuyền hiện đại, không chất hóa học nên sẽ là sự lựa chọn đáng tin cậy cho bạn và cả gia đình. Bên cạnh đó, Me không hạt Thái Lan vị cay đã được đóng gói nhỏ gọn nên rất thích hợp cho bạn mang theo bên mình đến trường lớp, cơ quan làm việc hay trong những chuyến đi chơi để thưởng thức cùng bạn bè, người thân.
', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (30, N'Sầu Riêng Sấy Lát Chainoi Durian Chips 45g', N'kho_11.jpg', N'Túi', N'Công ty WOONGJIN', 53000.0000, 20, N'Với công nghệ sấy thăng hoa (sấy đông khô), nhà sản xuất lựa chọn loại sầu riêng tươi ngon, tách bỏ vỏ - hạt, và đông khô 100% thành phần là cơm sầu riêng.
Với công nghệ sấy thăng hoa (sấy đông khô), nhà sản xuất lựa chọn loại sầu riêng tươi ngon, tách bỏ vỏ - hạt, và đông khô 100% thành phần là cơm sầu riêng. Công nghệ sản xuất đã giúp cho sản phẩm giữ được nguyên vẹn cấu trúc, mùi vị, màu sắc và hình dạng như lúc tươi và quan trọng hơn công nghệ giúp cho sản phẩm không bị mất các chất dinh dưỡng mà vẫn giữ nguyên các vi chất, vitamin, protein…trong cơm của quả sầu riêng. 
Sầu riêng sấy khô được cắt thành từng miếng dày 3-5cm với hương vị thơm ngon, giòn béo, đậm chất, đậm mùi không khác gì quả tươi. Được đựng trong túi PP 100g, bên trong được đóng thành 2 gói nhỏ tiện lợi, giữ nguyên dinh dưỡng và hương vị sầu riêng tươi nguyên chất.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (31, N'Xoài Sấy Dẻo Hộp 200g', N'kho_12.png', N'Hộp', N'Công ty VITAMINHOUSE', 75000.0000, 20, N'Xoài Sấy Dẻo 200g với thành phần từ trái xoài thái tươi ngon mang đến cho bạn món xoài sấy dẻo, ngọt và chua vừa phải, kích thích cảm giác ăn uống. Sản phẩm được sản xuất trên dây chuyền công nghệ hiện đại, đảm bảo chất lượng và hương vị thơm ngon, an toàn cho người sử dụng.
Công dụng của xoài sấy dẻo giúp ngăn ngừa nhiều loại bệnh hiệu quả: 
    -   Ngăn ngừa ung thư ...
    -   Giảm lượng cholesterol. ...
    -   Làm đẹp da. ...
    -   Tốt cho mắt. ...
    -   Kiểm soát stress. ...
    -   Ngăn ngừa đau nửa đầu và cải thiện trí nhớ ...
    -   Cung cấp nguồn khoáng và chất xơ cho cơ thể', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (32, N'Nho Khô Nguyên Cành Long Crimson', N'kho_13.jpg', N'Cành', N'Công ty LONG CRIMSON', 470000.0000, 20, N'Nho khô nguyên cành Úc có chất lượng cao là loại nho có màu vàng trông giống màu hổ phách. Nho phơi khô tự nhiên đảm bảo hương vị, màu sắc, 100% tự nhiên. Nho khô rất ngọt với độ đường lên tới 30-40%.
Điểm đặc biệt của loại nho nổi tiếng này là - khi nho chín, người ta dùng máy cắt các cành nho và để cho nho tự khô trên cành. Sau khi thu hoạch, nho khô được chuyển về nhà máy để rửa sạch và đóng gói. Nho phơi khô 100% tự nhiên đảm bảo hương vị, màu sắc, không thêm bất kỳ đường hóa học hay chất tạo màu. Nho khô rất ngọt với độ đường lên tới 30-40%.
Nho khô nguyên cành của Úc có vị ngọt thanh mát, không gắt như nho sấy bình thường. Ngoài ra nho khô nguyên cành Úc giữ lại hầu như toàn bộ hàm lượng dinh dưỡng, cũng như chất khoáng bên trong quả do không có sự can thiệp của nhiệt độ cao (nguyên nhân làm mất hàm lượng dinh dưỡng).
Nho khô nguyên cành Úc giúp chắc xương, bổ sung canxi cho người già, người mang thai và em bé, người bị bệnh tim mạch, tiểu đường, ngừa ung thư, ngừa bệnh thiếu máu, hỗ trợ năng lượng cho cơ thể và rất tốt cho tiêu hoá.', 20, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (33, N'Hạt Dẻ Nhật Gold Award', N'kho_14.jpg', N'Túi', N'Công ty GOLD AWARD', 120000.0000, 5, N'Hạt dẻ Gold Award với hạt to, thơm, ngọt hơn các loại hạt dẻ khác, và được tuyển chọn từ loại hạt tươi ngon nhất, qua quá trình tách vỏ và chọn lọc những hạt nguyên không hư. Hạt dẻ với vị béo bùi tuyệt ngon hoàn toàn tự nhiên - thích hợp cả với các bạn ăn kiêng hay tiểu đường, đặc biệt sản phẩm không chất bảo quản hay chất tạo màu.
Tốt cho tim : hạt dẻ có thể làm giảm LDL (cholesterol "xấu") và tăng HDL (cholesterol "tốt). Hàm lượng cao các chất chống oxy hóa như vitamin A và E trong hạt dẻ có thể giúp cơ thể chống lại chứng viêm, bảo vệ mạch máu và làm giảm nguy cơ bị bệnh tim.
Giảm nguy cơ bị bệnh tiểu đường: Hạt dẻ có thể giúp ngăn ngừa bệnh tiểu đường loại 2. Nó có thể cung cấp phốt pho cho cơ thể và chuyển hóa các protein thành các axit amin, hỗ trợ cơ thể dung nạp glucose và phốt pho để giảm nguy cơ bị bệnh tiểu đường.
Tốt cho máu: Hạt dẻ là một nguồn rất giàu vitamin B6. Vitamin B6 cần thiết để tạo hemoglobin - một loại protein chịu trách nhiệm vận chuyển oxy qua dòng máu đến các tế bào và làm tăng lượng oxy trong máu.
Tốt cho hệ thống thần kinh: Lượng vitamin B6 phong phú trong hạt dẻ có tác dụng mạnh mẽ tới hệ thống thần kinh. Các phân tử axit amin làm nhiệm vụ dẫn truyền thông tin phải có vitamin B6 mới thực hiện tốt chức năng của nó.
Có lợi cho mắt: Hạt dẻ chứa 2 loại carotenoid là lutein và zeaxanthin mà hầu hết các loại hạt khác không có. Hai carotenoid này có chức năng như chất chống oxy hóa, bảo vệ các tế bào khỏi tác hại của gốc tự do, giảm nguy cơ phát triển thoái hóa điểm vàng liên quan đến tuổi tác mà thoái hóa điểm vàng lại là nguyên nhân hàng đầu dẫn đến khiếm thị và mù lòa. Do đó, hạt dẻ được cho là rất có lợi cho mắt.
Tăng cường hệ thống miễn dịch: Một hệ thống miễn dịch khỏe mạnh đòi hỏi phải có đủ lượng vitamin B6. Thiếu vitamin B6 có thể làm chậm hoạt động của não cũng như làm giảm hiệu quả chống nhiễm trùng của hệ thống miễn dịch. Hạt dẻ rất giàu vitamin B6, do đó nó có sthể hỗ trợ hệ thống miễn dịch hoạt động tốt.
Tốt cho da: Hạt dẻ là một nguồn tuyệt vời của vitamin E - một chất chống oxy hoá hòa tan trong chất béo. Vitamin E còn được cho là cần thiết trong việc việc duy trì tính toàn vẹn của màng tế bào và giữ cho làn da khỏe mạnh. Vitamin E làm một công việc tuyệt vời bảo vệ da khỏi tác hại của tia cực tím, chống lại lão hóa sớm và ung thư da. Vì vậy, bạn nên ăn hạt dẻ nếu muốn có làn da khỏe đẹp.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (34, N'Bịch Hạt Óc Chó Tự Nhiên JC 150g', N'kho_15.jpg', N'Túi', N'Công ty JC', 220000.0000, 20, N'Hạt óc chó Alesto Walnuts 200g được tuyển chọn từ những quả óc chó chất lượng mang hàm lượng dinh dưỡng cao,  rất giàu chất acid béo Omega-3, các chất dinh dưỡng vitamin A, B, E  và một số khoáng chất rất tốt cho tim mạch, chống bệnh ung thư, đột quỵ, tiểu đường, huyết áp cao, béo phì và trầm cảm..
Hạt óc chó là gì ?
Quả óc chó còn gọi là quả Hồ Đào hay quả Hạnh đạo, loại quả này là là hạt của cây thuộc chi Juglans – một loại thực vật thân gỗ cao lớn. Loại thực vật này có rất nhiều giống loài khác nhau phân bố khắp nơi trên thế giới, từ Đông Âu sang Nhật Bản, từ đông nam Canada tới California. Theo Wikipedia.
Tại sao loại quả này khi về Việt Nam lại được gọi với cái tên quái dị như vậy nhỉ !? – có lẽ cái tên này xuất phát từ hình dáng của nhân quả sau khi tách vỏ, rất giống với một bộ não thu nhỏ, kì dị và khá lạ mắt đó nha.
Hạt óc chó được gọi là "siêu hạt" mà thiên nhiên ưu đãi cho con người, nó được mệnh danh là "Vua của các loại hạt" trong các loại thực phẩm nói chung và các loại hạt nói riêng. Hạt óc chó có vị ấm hơi ngọt, thơm, bùi và béo ngậy. Sau khi ăn sẽ để lại vị hơi nhẫn đắng - và cái vị hơi nhẫn nhẫn ấy chính là thành phần bỗ dưỡng nhất đem lại nhiều lợi ích cho sức khoẻ con người.
Nắm bắt được xu hướng và các công dụng tuyệt vời của hạt óc cho Hãng Alesto cho ra đời sản phẩm Hạt óc chó Alesto 200g, với thiết kế túi nhỏ gọn sẽ giúp bạn dễ dàng mang theo cũng như sử dụng mà không sợ hạt bị mềm. ', 0, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (35, N'Dâu tây sấy giòn DJ & A', N'kho_16.jpg', N'Túi', N'Công ty DJ&A', 90000.0000, 20, N'Vị dâu tây giòn ngọt, tan ngay trong miệng sẽ mang lại cảm giác thú vị và mới lạ cho bạn khi thưởng thức.
Dâu tây là một loại quả đặc biệt có lợi cho sức khỏe con người, giàu Vitamin C và là nguồn cung cấp dồi dào các chất Flavonoid giúp chống oxy hóa cực tốt cho làn da trẻ đẹp và giúp cơ thể khỏe mạnh. Có mùi thơm hấp dẫn cùng vị ngọt lẫn chua nên dâu tây rất được ưa chuộng để làm các món tráng miệng, sinh tố dâu chua ngọt tươi mát.
Dâu tây sấy giòn DI&A được làm từ quả dâu tây thuần chủng trồng theo mô hình sạch organic tại Australia.
Những quả dâu được chắt lọc rất kỹ về chất lượng và kích cỡ và sấy lạnh bằng công nghệ Freeze Dried DJ&A.
Freeze Dried Strawberries vẫn giữ được hình dạng, hương vị và độ chua ngọt vừa phải của quả dâu tươi.
Độ giòn của quả dâu sấy lạnh DJ&A giúp bạn cảm nhận món ăn tuyệt vời này tương tự như Snack, ngon miệng, giàu dưỡng chất và tốt cho sức khỏe.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (36, N'Hạt kiều mạch ăn liền Goodwill 400g', N'kho_17.jpg', N'Túi', N'Công ty GOODWILL', 45000.0000, 20, N'Hạt kiều mạch có giá trị dinh dưỡng cao, cao hơn rất nhiều lần so với các loại ngũ cốc khác. Kiều mạch không chứa gluten như các loại lúa mạch, thành phần chính của kiều mạch là carbonhydrates nhưng đồng thời chúng cũng chứa protein.
Bên cạnh đó, kiều mạch còn chứa chất xơ, vitamin và các loại khoáng chất như chất chống oxy hóa, mangan, đồng, sắt, phót pho và các hợp chất khác như rutin, vitexin, quercetin,…
Với hàm lượng các chất dinh dưỡng, hạt kiều mạch được xem như một loại thực phẩm thần kỳ, được sử dụng thường xuyên trong các bữa ăn. Ngày nay, người ta đã sáng tạo ra nhiều công thức chế biến kiều mạch để bữa ăn được ngon hơn và không kém phần dinh dưỡng.
Hạt kiều mạch giàu chất chống oxy hóa ngăn ngừa bệnh tim, chống lại ung thư. Chất chống oxy hóa có trong kiều mạch là các hợp chất phenolic như polyphenolic có tác dụng chống lại các gốc tự do, hay quá trình oxy hóa, ngăn ngừa nguy cơ bệnh tim, hỗ trợ não, gan và sức khỏe tiêu hóa. Đồng thời chúng còn hỗ trợ chức năng tế bào bằng cách bảo vệ DNA khỏi tổn thương và ngăn ngừa tình trạng hình hình tế bào ung thư.
Chất xơ có trong hạt kiều mạch cải thiện hệ tiêu hóa. Chất xơ chiếm đến 2,7% khối lượng kiều mạch đã nấu chín, và chất xơ này chủ yếu bao gồm celluloso và lignin. Những thành phần này có lợi đối với sức khỏe hệ tiêu hóa nhất là đại tràng. Hạt kiều mạch còn có thể bảo vệ hệ tiêu hóa khỏi nhiễm trùng, đặc biệt là ngăn chặn quá trình oxy hóa trong đường tiêu hóa.
Carbonhydrat có trong kiều mạch giúp ngăn chặn bệnh tiểu đường. Ăn kiều mạch có thể giúp điều hòa lượng đường trong máu, trở thành sự lựa chọn tuyệt vời dành cho những bệnh nhân tiểu đường.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (37, N'Hạt Dẻ Cười Tách Vỏ Alesto 70g', N'kho_18.jpg', N'Túi', N'Công ty ALESTO', 120000.0000, 20, N'Hạt dẻ cười Alesto là món ăn vặt được nhiều người yêu thích bởi hương vị thơm ngon, bùi ngậy. Hạt dẻ cười cũng có hàm lượng dinh dưỡng khá cao và rất tốt cho sức khỏe. Trong hạt dẻ cười có chứa các chất như vitamin B6, vitamin E và hơn 30 loại vitamin khác rất có ích cho cơ thể,đặc biệt là trong việc hỗ trợ phân giải và hấp thụ các chất dinh dưỡng.
Các công dụng của hạt dẻ cười:
    -   Bảo vệ sức khỏe tim mạch
    -   Giảm cholesterol LDL
    -   Ngừa tiểu đường
    -   Ổn định huyết áp
    -   Giúp mắt khỏe
    -   Bổ máu
    -   Tốt cho thần kinh.
    -   Làm đẹp da và giảm béo', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (38, N'Hạt hạnh nhân alesto 200g', N'kho_19.jpg', N'Túi', N'Công ty ALESTO', 180000.0000, 20, N'Thương hiêu Alesto đến từ Úc nổi tiếng với các sản phẩm hạt tốt cho sức khỏe trong đó Hạt hạnh nhân Alesto là một trong những sản phẩm '''' best seller '''' của hãng. Được sản xuất từ những hạt hạnh nhân chọn lọc kĩ lưỡng mang tới hương vị thơm ngon, cung cấp một lượng dinh dưỡng nhất định cho cơ thể hoạt động trong suốt ngày dài.
Với thiết kế túi zip tiện lợi cho mỗi lần sử dụng, sản phẩm tiện lợi để mang theo khi đi xa. Hạnh nhân Alesto được sản xuất trên dây chuyền hiện đại với các nguyên liệu được chọn lọc kỹ lưỡng đảm bảo an toàn tuyệt đối cho gia đình bạn.
Hạt hạnh nhân được mệnh danh là nữ hoàng trong các loại hạt bổ ích cho sắc đẹp và sức khỏe của con người. Nói về hạt hạnh nhân thì có rất nhiều công dụng phải kể ra như: là một bài thuốc dưỡng da cực kỳ hiệu quả, là loại thực phẩm ngon và bổ dưỡng cho cơ thể con người, mang lại lợi ích to lớn về sức khỏe, thanh xuân.
Cây hạnh nhân có nguồn gốc từ Tiểu Á (Asie Mineure) và Lưỡng Hà (Mésopotamie), xuất hiện đầu tiên ở các nước thuộc khu vực Địa trung hải, phân bố nhiều là Ấn Độ và một số nước Trung Đông như Pakistan, Afghanistan, Iran, Israel,… và các nước Trung Á khác. Nó được nhân rộng ra trong thời cổ đại dọc theo bờ biển Địa Trung Hải vào Bắc Phi và miền Nam châu Âu, gần đây là California Hoa Kỳ.
Hạnh nhân thuần ban đầu là một loại hạt có chứa chất độc, tuy nhiên theo thời gian đã được con người thuần hóa và cải tiến để chúng phát triển thành một loại hạt thơm ngon và bổ dưỡng, có lợi cho sức khỏe của con người. Do đó mà ngày nay hạt hạnh nhân được phân bố rộng rãi hơn ở nhiều nước trên thế giới nhằm đáp ứng nhu cầu tiêu thụ của con người.
Giá trị dinh dưỡng mà hạnh nhân mang đến: giá trị dinh dưỡng có trong hạt hạnh nhân là vô cùng lớn, mỗi hạt chứa tới khoảng trên 20 loại chất béo, vitamin và khoáng chất có lợi cho sức khỏe của con người. Trong đó nhiều nhất là chất béo, canxi, magie, phốt pho, kali… đều là những chất bổ dưỡng rất cần thiết hằng ngày đối với chúng ta. Rất hiếm có một loại hạt nào lại có thể giàu dinh dưỡng và cung cấp nhiều chất bổ như hạt hạnh nhân, vì thế mà hạt hạnh nhân mới đứng top đầu trong các loại hạt.', 20, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (39, N'Hạt Chia Samen Alnatura Úc 200g', N'kho_20.jpg', N'Túi', N'Công ty SAMEN ALNATURA', 150000.0000, 20, N'Công dụng:
    -   Omega Hạt Chia tốt cho sự phát triển của trí não, thích hợp cho trẻ em và người già.
    -   Giúp tăng cường sức khỏe, giảm béo, không những thế còn giúp các cơ bắp trở nên săn chắc hơn.
    -   Chống lão hóa da, cải thiện sức sống cho làn da của bạn, phục hồi thể lực cho người mới ốm dậy, người thường xuyên mệt mỏi.
    -   Ổn định đường huyết, tốt cho những bệnh nhân mắc bệnh tiểu đường và các bệnh về tim mạch.
    -   Tăng cường sữa cho phụ nữ sau sinh, chống táo bón, dễ hấp thụ,.. Dưỡng chất Omega 3 trong Hạt Chia cao hơn gấp nhiều so với các loại thực phẩm khác, kể cả hải sản, không chứa các thành phần kim loại độc hại như ở hải sản, hàm lượng natri thấp, hàm lượng protein, chất béo, chất xơ và chất chống oxy hóa cao hơn cả quả việt quất,..
    -   Chất đạm khá nhiều, dễ tiêu hóa hơn các loại thực phẩm từ thịt, các loại ngũ cốc, chính vì thế giúp cơ thể hồi phục nhanh chóng sau những tổn thương, đặc biệt là phụ nữ sau sinh khi dùng hạt chia cũng sẽ giúp sản sinh nhiều sữa hơn.
    -   Hạt Chia còn có chứa hàm lượng lớn vitamin nhóm B và canxi cao gấp 6 lần so với sữa nhưng lại dễ hấp thụ hơn so với sữa. Cung cấp các khoáng chất như Mg, Fe, Cu, Zn,..
Lưu ý khi sử dụng: Không thích hợp cho người có huyết áp thấp Mỗi ngày không sử dụng quá 15g/người. Nếu sử hơn 15g thì sẽ có hiện tượng đầy bụng và buồn nôn.', 0, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (40, N'Hạt Chia Black Bag Chia Úc 1KG', N'kho_21.jpg', N'Túi', N'Công ty OMD', 250000.0000, 20, N'Công dụng:
    -   Omega Hạt Chia tốt cho sự phát triển của trí não, thích hợp cho trẻ em và người già.
    -   Giúp tăng cường sức khỏe, giảm béo, không những thế còn giúp các cơ bắp trở nên săn chắc hơn.
    -   Chống lão hóa da, cải thiện sức sống cho làn da của bạn, phục hồi thể lực cho người mới ốm dậy, người thường xuyên mệt mỏi.
    -   Ổn định đường huyết, tốt cho những bệnh nhân mắc bệnh tiểu đường và các bệnh về tim mạch.
    -   Tăng cường sữa cho phụ nữ sau sinh, chống táo bón, dễ hấp thụ,.. Dưỡng chất Omega 3 trong Hạt Chia cao hơn gấp nhiều so với các loại thực phẩm khác, kể cả hải sản, không chứa các thành phần kim loại độc hại như ở hải sản, hàm lượng natri thấp, hàm lượng protein, chất béo, chất xơ và chất chống oxy hóa cao hơn cả quả việt quất,..
    -   Chất đạm khá nhiều, dễ tiêu hóa hơn các loại thực phẩm từ thịt, các loại ngũ cốc, chính vì thế giúp cơ thể hồi phục nhanh chóng sau những tổn thương, đặc biệt là phụ nữ sau sinh khi dùng hạt chia cũng sẽ giúp sản sinh nhiều sữa hơn.
    -   Hạt Chia còn có chứa hàm lượng lớn vitamin nhóm B và canxi cao gấp 6 lần so với sữa nhưng lại dễ hấp thụ hơn so với sữa. Cung cấp các khoáng chất như Mg, Fe, Cu, Zn,..
Lưu ý khi sử dụng: Không thích hợp cho người có huyết áp thấp Mỗi ngày không sử dụng quá 15g/người. Nếu sử hơn 15g thì sẽ có hiện tượng đầy bụng và buồn nôn.', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (41, N'Hạt Chia Seeds Biosis 1kg', N'kho_22.jpg', N'Túi', N'Công ty KJD', 220000.0000, 20, N'Hạt chia Úc 1kg Biosis Organic Black Chia Seeds dễ sử dụng, pha nước ấm uống trực tiếp hoặc pha chế chung các loại nước uống, thức ăn.
Sử dụng phù hợp cho mọi đối tượng: trẻ em, người lớn, phụ nữ mang thai, vận động viên.
Chống lão hóa, làm đẹp da, giảm cân.
Ổn định đường huyết, tốt cho tim mạch và tiêu hóa
Đặc biệt là Omega-3, một hợp chất đóng vai trò quan trọng đối với sự phát triển của thai nhi, đặc biệt là bộ não
Folat được khuyến cáo nên cung cấp đủ trước khi mang thai và trong 3 tháng đầu của thai kỳ để phòng tránh dị tật ống thần kinh thai nhi.
Bạn có thể ăn trực tiếp nhưng nhớ uống thêm nhiều nước vì loại hạt này hút nước mạnh.
Cách pha: bạn có thể cho hạt vào nước ấm, đợi hạt nở là có thể uống ngay. Ngoài ra, cho thêm loại hạt này vào các loại thức uống như nước ép, nước chanh, yaourt, smothie, trà và cà phê,…
Cách chế biến hạt chia: bạn có thể cho thêm hạt vào các món ăn để tăng lượng dinh dưỡng, như salad, bánh mì, thịt nướng, soup, trứng chiên,', 5, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (42, N'Bánh Mềm Vani Funwari Nhật', N'banh_1.png', N'Hộp', N'Công ty FUNWARI', 40000.0000, 100, N'Bánh Funwari Vani kích thích vị giác, đem lại món bánh tráng miệng tuyệt hảo cho bạn và gia đình
Bánh có thành phần nguyên liệu được lựa chọn kỹ lưỡng, không chứa hóa chất độc hại, an toàn cho người dùng.
Sản phẩm được sản xuất trên quy trình công nghệ hiện đại, được kiểm duyệt chặt chẽ, đảm bảo chất lượng và đây còn là sản phẩm được ưa chuộng trên thị trường.
Bánh thường được dùng trong bữa sáng hoặc bữa ăn nhẹ để bổ sung dinh dưỡng, giúp cơ thể luôn sẵn sàng năng lượng cho các hoạt động hàng ngày.
Sản phẩm đóng gói tiện dụng, dễ bảo quản và đem theo cho những chuyến dã ngoại cùng bạn bè và người thân.', 20, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (43, N'Bánh Gạo Vị Rong Biển Want Want 160g', N'banh_2.jpg', N'Túi', N'Công ty WANT WANT', 55000.0000, 20, N'Những chiếc bánh gạo từ lâu đã trở thành món ăn quen thuộc của mọi người với hương vị thơm ngon khiến bạn chỉ muốn ăn mãi. Bánh gạo Want Want được làm từ những thành phần hảo hạng được lựa chọn kĩ lưỡng, dưới bàn tay điêu luyện của những người thợ lành nghề đã mang đến cho bạn một loại bánh hảo hạng, với chất lượng tốt nhất. Thành phần có trong bánh giúp bổ sung sắt và canxi cần thiết cho cơ thể.
Bánh gạo Want Want được sản xuất theo quy trình hiện đại, không chứa chất bảo quản, không chất tạo màu, không chiên qua dầu nhiều lần giúp giữ được hương vị ngọt tự nhiên từ hạt gạo. Từng chiếc bánh có vị ngon tuyệt dễ ăn sẽ bổ sung vào list ăn vặt của bạn thêm phong phú. Sản phẩm được đóng gói nhỏ gọn, bạn có thể dễ dàng mang theo trong những chuyến đi chơi xa hay làm quà tặng cho bạn bè, người thân.
Ngoài ra, bánh còn cung cấp năng lượng, protein, chất béo và một số vitamin thích hợp làm món ăn nhẹ cho những người bận rộn. Vị ngọt tự nhiên của gạo cùng vị mặn của rong biển hòa quyện với nhau, giòn tan trong miệng. Bánh được đóng trong từng gói nhỏ rất tiện để mang theo đi làm, đi học hoặc bất cứ khi nào cần bổ sung năng lượng.
Hướng dẫn sử dụng và bảo quản: sử dụng trực tiếp, bảo quản ở nơi khô ráo, tránh ánh nắng trực tiếp của mặt trời', 5, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (44, N'Bánh Bông Lan Bơ Patisserie Tradition Pháp 500G', N'banh_3.jpg', N'Chiếc', N'Công ty PATISSERIE', 170000.0000, 0, N'Mang cả niềm tự hào ẩm thực vào trong từng chiếc bánh, Bánh bà đầm Pháp Patisserie Tradition luôn là lựa chọn hàng đầu trong các loại bánh ngọt.
Khi nói đến nước Pháp, người ta không thể không nhắc đến những thương hiệu, tên tuổi lừng danh về các loại bánh mỳ, bánh ngọt được sản xuất theo công thức truyền thống đặc biệt và thơm ngon đặc trưng, tạo nên một nét riêng biệt làm người ăn sẽ nhớ mãi. Và một trong những thương hiệu nổi tiếng đó là bánh bà đầm.
Bánh ngoại cao cấp bà đầm là sản phẩm được nhập khẩu trực tiếp từ Pháp, không ai còn nghi ngờ gì về độ thơm ngon và chất lượng nữa. Bánh luôn là một khối dài vàng rộm, hấp dẫn ngay từ cái nhìn đầu tiên.
Bánh bà đầm Pháp Patisserie Tradition mềm, ẩm, bạn có thể dễ dàng cắt hành từng khoanh mỏng. Mỗi bữa sáng, bé chỉ cần ăn 2 đến 4 lát bánh kèm một hộp sữa là vừa no vừa đủ chất. Đặc biệt, Bánh bà đầm Pháp Patisserie Tradition có thời gian sử dụng ngắn, không quá 3 tuần bởi sản phẩm hoàn toàn không sử dụng chất bảo quản.', 5, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (45, N'Kẹo Dẻo Trolli Hotdog 150g', N'banh_4.jpg', N'Túi', N'Công ty TROLLI', 100000.0000, 20, N'Kẹo dẻo Trolli Hot Dog có hình dáng ngộ nghĩnh, đáng yêu cùng hương vị thơm ngon dai dai được các bé yêu thích. Sản phẩm được làm từ nguyên liệu tự nhiên, an toàn với sức khỏe của bé. 
Các đặc điểm chính của kẹo dẻo Trolli Hot Dog
Kẹo dẻo hotdog Trolli dẻo dẻo, dai dai với hình bánh mì hot dog dễ thương, có từng lớp xúc xích, rau củ, cà chua và sốt mù tạt rưới lên trên y như hot dog thiệt luôn.
Kẹo dẻo Trolli là sản phẩm được làm 100% từ các nguyên liệu trái cây tự nhiên có tác dụng làm sạch răng, cung cấp Vitamin C, tạo độ cứng chân răng cho trẻ nhỏ.
Độ tuổi sử dụng kẹo dẻo Trolli
Kẹo dẻo Trolli dành cho các bé từ 2 tuổi trở lên. Sản phẩm không những được các bé yêu thích mà đây còn là kẹo ăn vặt lý tưởng của mỗi người.
Bảo quản sản phẩm nơi khô ráo thoáng mát, tránh ánh nắng mặt trời.', 5, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (46, N'Gói Kẹo Ribon Trái Cây Tổng Hợp 10 Vị', N'banh_5.jpg', N'Gói', N'Công ty RIBON', 60000.0000, 20, N'Kẹo Ribon Trái Cây Tổng Hợp vị trái cây tổng hợp tự nhiên với thành phần chính là nước cốt trái cây nguyên chất vừa giúp người dùng thay đổi khẩu vị, vừa mang đến sự thích thú và cuốn hút khi ăn, ngoài ra còn cung cấp vitamin cần thiết cho cơ thể.
Vì được làm nên từ những loại trái cây tươi tự nhiên, nên kẹo trái cây Ribon Fruit Candy chứa một lượng lớn các vitamin cung cấp vào cơ thể. Với gói kẹo nhỏ gọn này, có thể mang theo trong những chuyến đi, picnic, du lịch một cách dễ dàng để chia sẻ cùng người thân, đồng nghiệp hoặc bạn bè.
Là một trong những sản phẩm nổi tiếng của hãng bánh kẹo Ribon Nhật Bản. Được tạo nên từ niềm đam mê trái cây, do đó người dùng sẽ cảm nhận được hương trái cây thật sự. Đồng thời, đã được kiểm định chất lượng và không chứa các nguyên liệu hóa học gây hại cho sức khỏe.
Kẹo mang đến nhiều lợi ích cho não bộ, giảm stress, có lợi cho tim mạch, hệ kháng thể và nhất là kéo dài tuổi thanh xuân. Còn gì tuyệt vời bằng việc nhâm nhi một viên kẹo sau những giờ làm việc căng thẳng.', 0, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (47, N'Gói Kẹo Dẻo Haribo Happy Cola', N'banh_6.jpg', N'Gói', N'Công ty WOONGJIN', 30000.0000, 20, N'Thương hiệu: Haribo
Xuất xứ: Đức
Trọng lượng: 30g
HSD: 18 tháng kể từ ngày sản xuất
Thành phần: Đường, siro glucose, dầu thực vật, nước ép trái cây cô đặc, vitamin B, gelatin,...
Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.
HDSD: Dùng trực tiếp sau khi mở bao bì.
Hương vị cola độc đáo hoà quyện trong viên kẹo mềm dẻo, hình dáng ngộ nghĩnh, tạo cảm giác thích thú khi thưởng thức.
Là món ăn vặt không chỉ các bé mà người lớn cũng không thể cưỡng lại được. 
Cực kì phù hợp làm quà thưởng cho các bé sau những buổi học căng thẳng.', 5, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (48, N'Bịch Kẹo Halls Relief Honey Lemon 40g', N'banh_7.jpg', N'Bịch', N'Công ty HALLS', 20000.0000, 20, N' Kẹo ngậm Halls chiết xuất từ chanh và mật ong tạo cảm giác sảng khoái, dễ chịu cho người sử dụng.
 Kẹo Halls không đường nên rất phù hợp cho những người ăn kiêng hay người bị bệnh tiểu đường.
 Kẹo Halls sử dụng cho trẻ từ 5 tuổi trở lên.', 0, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (49, N'Gum Trident Vị Cam Xoài', N'banh_8.jpg', N'Hộp', N'Công ty TRIDENT', 30000.0000, 20, N'Kẹo cao su Trident Tropical Twist rất ngon với hương vị trái cây nhiệt đới như cam, kiwi; viên kẹo mềm dẻo với hương thơm lưu rất lâu.
Nhai kẹo cao su giúp hơi thở thơm tho. Đặc biệt dùng kẹo cao su không đường Trident sau khi ăn/uống, bạn sẽ tránh được các bệnh về răng miệng như: sâu răng, ố vàng răng, hôi miệng. Nó giúp loại bỏ thức ăn và trung hòa axit mảng bám.
Hãy sử dụng kẹo cao su Trident không đường, để:
   – Làm sạch răng.
   – Bảo vệ răng.
  – Chống sâu răng.', 5, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (50, N'Gói Socola Sữa Kisses Holiday Grinch 269g', N'banh_9.jpg', N'Gói', N'Công ty HERSHEY', 190000.0000, 20, N'Chắc hẳn những ai là tín đồ của chocolate sẽ nghe đến thương hiệu nổi tiếng Kisses cho ra đời chocolate Kisses Milk hình quả núi gắn lá cờ trắng nhỏ của nước Mỹ. Ý nghĩa mang đến tình yêu thương cho tất cả mọi người của Kisses được rất nhiều người ủng hộ và yêu mến.

Hershey’s Kisses Hugs Milk Chocolate có vị đắng pha chút ngọt cực ngon. Như hình ảnh, bên ngoài là lớp socola sữa viền socola đen, bên trong là nhân socola thật tuyệt vời. Không ngọt, không đắng chỉ có thể là “ghiền.

', 0, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (51, N'Gum Cuộn Hubba Bubba Vị Nho', N'banh_10.jpg', N'Cuộn', N'Công ty HUBBA BUBBA', 60000.0000, 5, N'Là một trong những loại gum nổi tiếng và được ưa chuộng nhất nước Mỹ cũng là #bestseller bao mùa.
Là một trong những loại gum nổi tiếng và được ưa chuộng nhất nước Mỹ cũng là #bestseller bao mùa - Hubba đặc trưng với cuộn gum dài 180cm quấn vòng gọn ghẽ trong hộp, chỉ cần kéo ra và xé măm thôi.
Gum Hubba Bubba có vị trái cây tươi ngon thơm nức nở, gum ngọt nhẹ lại dai dai rất hấp dẫn và giờ không bàn đến độ nổi tiếng của em này nữa hãy nhanh đến các chi nhánh nhà Vitamin để rinh về cho mình em gum nổi tiếng này nhé.', 5, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (52, N'Chả cá hải sản cay 70g', N'lanh_1.png', N'Chiếc', N'Công ty SAJO', 30000.0000, 20, N'Chả cá que – món ăn không thể thiếu của các bạn trẻ xứ Hàn, từ đó Sajo đã cho ra mắt thêm Chả các que hải sản với thanh chả cá hình chữ nhật, được tẩm ướp từ nhiều gia vị kết hợp thêm hương vị hải sản ngập tràn thì làm sao các bạn có thể cưỡng lại.
Chả cá hải sản cay 70g được làm từ thịt cá tươi xay nhuyễn, có dạng hình thanh chữ nhật vỏ ngoài dai nhẹ hòa với độ mọng của hải sản và mùi thơm từ hải sản giúp món ăn trở nên hấp dẫn. Có vị cực kì kích thích nên chắc chắn sẽ khiến bạn thích thú ngay lập tức.
Chả cá hải sản cay 70g được làm hoàn toàn từ những nguyên liệu tươi ngon, thông qua chọn lọc kĩ càng, đảm bảo mang đến khách hàng sản phẩm thơm ngon và chất lượng. Đồng thời rất tiện lợi, chế biến nhanh, giúp các chị nội trợ tiết kiệm thời gian.
Bảo quản: 0 – 10 độ C hoặc ngăn đông tủ lạnh
Hạn sử dụng: 12 tháng từ ngày sản xuất.
Hướng dẫn sử dụng: Chiên hoặc hâm nóng là sử dụng được ngay.', 0, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (53, N'Chả cá Fish&Yuba EB 300g', N'lanh_2.png', N'Bịch', N'Công ty EB', 70000.0000, 20, N'Chả cá Fish&Yuba EB 300g được làm từ thịt cá tươi xay nhuyễn, có dạng hình vuông, lát mỏng vỏ ngoài dai nhẹ hòa với độ mọng nước và mùi thơm từ cá giúp món ăn trở nên hấp dẫn. Có vị thanh đạm và nhẹ nhàng nên chắc chắn sẽ khiến bạn thích thú ngay lập tức.
Có thành phần từ thịt cá chiếm đến 56% nên khi ăn sẽ có hương thơm nhẹ của cá. Ngoài ra chả cá có kết cấu mềm bên trong, dai bên ngoài ăn rất ngon. Vì vậy chả cá Yuba hiện được săn đón rất nhiều trên thị trường.
Sau khi thành lập được vài năm (kể từ 2015), EB Food đã ngày càng trở nên lớn mạnh và được nhiều người dân tin dùng với những thực phẩm protein nổi bật như đậu hủ phô mai, cá viên nhân phô mai, gà viên nhân phô mai, gà viên nhân xúc xích, tôm viên, chả cá,..
Chả Cá Yuba - Fish & Yuba EB - Hàng nhập khẩu trực tiếp Malaysia. Sản phẩm được phân phối trong hệ thống nhà hàng Haidilao, khẳng định chất lượng đã được kiểm chứng và được rất nhiều khách hàng ưu chuộng hiện nay. Vị ngon, dai, và tính tiện lợi chế biến nhanh, giúp các chị nội trợ tiết kiệm thời gian.

Cách dùng:
Có thể kết hợp nhiều phương thức nấu khác nhau cho món chả cá. Ngoài ra, các thành phần trong chả cá rất tự nhiên và lành tính nên các em nhỏ cũng có thể ăn được.
Dùng để thả lẩu: Thay vì những nguyên liệu chính là thịt và rau thì chả cá chính là điểm nhấn mới của món lẩu. Giúp món lẩu trở nên đa dạng, hấp dẫn hơn. Từng miếng chả cá hòa quyện cùng nước dùng lẩu tạo nên một hương vị thơm khó tả.
Dùng để chiên: Có thể dùng làm món phụ trong bữa ăn hàng ngày bằng món chả cá chiên. Chả cá có vỏ ngoài giòn, bên trong mềm. Chấm với một ít nước sốt hay tương ớt sẽ khiến bữa ăn ngon miệng hơn. Ngoài ra, có thể dùng làm món xế cho gia đình.
Dùng để làm món chính (Kho/ xào): Vì chả cá mềm nên khi kho/ xào sẽ ngấm gia vị. Khi ăn sẽ tạo cảm giác thỏa mãn, đồng thời ăn kèm rau và cơm thì rất tuyệt vời.

Lưu ý:
Đối với nấu canh, xào hoặc nấu lẩu, trước khi chế biến nên chiên sơ nhanh qua, để chả cá giòn và có màu hấp dẫn hơn. Khi chế biến gần xong hãy cho chả cá vào để chả cá vẫn còn giòn nhé.', 5, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (54, N'Kem trứng muối Cremo 90ml', N'lanh_3.jpg', N'Chiếc', N'Công ty CREMO', 25000.0000, 0, N'Kem trứng muối Cremo 90gđược làm từ các nguyên liệu tự nhiên cao cấp, không sử dụng các hóa chất độc hại mang lại hương vị tuyệt vời nhất cho sản phẩm. Ngoài ra, với công nghệ sản xuất hiện đại của Đài Loan, kem trứng muối Cremo 90g đảm bảo tiêu chuẩn quốc tế an toàn cho sức khỏe người sử dụng.
Kem trứng muối Cremo 90g thoạt nhìn hẳn bạn sẽ bị ấn tượng bởi diện mạo hấp dẫn của que kem, vị mặn mặn của trứng muối, vị ngọt nhẹ, không quá béo và không thể thiếu những viên trân châu dai dai, dẻo mềm.
Cremo là một trong những nhãn hiệu kem được ưa chuộng và yêu thích bởi chất lượng tuyệt vời của sản phẩm. Kem được nhập khẩu trực tiếp tại Thái Lan, giữ nguyên hương vị đặc trưng mang đến cho bạn những trải nghiệm tuyệt vời.', 5, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (55, N'Đậu hũ cá phô mai hình bông EB Malaysia 380g', N'lanh_4.png', N'Túi', N'Công ty EB', 95000.0000, 20, N'Đậu hủ cá phô mai hình bông hoa EB 380g được làm từ thịt cá, bọc bên trong là lớp phô mai béo thơm, có độ mềm dai vừa phải, đây có thể nói là một sự kếp hợp hoàn hảo hứa hẹn mang lại cho bạn nồi lẩu với những viên topping đẹp mắt và hấp dẫn.
Sau khi thành lập được vài năm (kể từ 2015), EB Food đã ngày càng trở nên lớn mạnh và được nhiều người dân tin dùng với những thực phẩm protein nổi bật như đậu hủ phô mai, cá viên nhân phô mai, gà viên nhân phô mai, gà viên nhân xúc xích, tôm viên,...
Nhằm mang đến thêm nhiều sự lựa chọn đa dạng cho khách hàng, EB Food vừa cho ra mắt thêm sản phẩm Đậu hũ cá phô mai hình bông EB Malaysia 380g với hình dạng bông hoa cực ấn tượng và gây thu hút đến người tiêu dùng.

Hướng dẫn sử dụng: 
    -   Sản phẩm được rã đông trước khi nấu từ 30-60 phút
Chiên giòn: Chiên ở nhiệt độ 170-180 độ C cho đến khi có màu vàng nâu.
    -   Nấu lẩu: Đun sôi trong súp nóng ở 100 độ C trong 1-2 phút.
Hấp hoặc xào: Cùng với khác nguyên liệu khác ( rau, hải sản, mì, cơm,..).

Bảo quản : bảo quản ở ngăn đông tủ lạnh ( -18 độ )', 0, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (56, N'Đậu nành Edamame Thái 400g', N'lanh_5.png', N'Túi', N'Công ty WOONGJIN', 50000.0000, 20, N'Đậu nành Edamame Thái 400g được sản xuất tại Thái Lan theo công nghệ và tiêu chuẩn của Nhật Bản. Đậu nành giàu chất xơ, rất tốt cho hệ tiêu hóa, phù hợp với người mắc chứng khó tiêu, đầy hơi. Ngoài ra, đây cũng là một nguồn protein chất lượng, cung cấp hầu hết các axit amin thiết yếu, tác động tích cực tới hệ tim mạch. Đối với những người bị tiểu đường tuýp 2 và người đang thực hiện chế độ ăn kiêng low-carb, đậu nành được xem là sự lựa chọn lý tưởng bởi nó chứa lượng carbonhydrate thấp.

Đậu nành nhật ( Edamame) là gì?
Edamame là tên gọi tiếng Nhật của một loại đậu gồm cả vỏ và hạt, được thu hoạch lúc còn non. Đậu Edamame đã xuất hiện đầu tiên ở Hoa Kỳ vào năm 1855 và mãi đến năm 2008 giống đậu này mới được trồng tại các nước châu Âu.
Đậu Edamame có màu xanh lục và thường được bán nguyên trái gồm có vỏ và hạt đậu bên trong. Lớp vỏ ngoài có nhiều lông tơ.
Đậu Edamame có hương vị ngon nhất sau khi thu hoạch nên bạn ăn càng sớm càng tốt, ít nhất 10 tiếng sau khi thu hoạch và có thể bảo quản tươi trong tủ lạnh khoảng 3 ngày. Vỏ quả cần được giữ ẩm trong quá trình bảo quản để tránh bị chuyển màu và giảm đi chất dinh dưỡng.
Đậu Edamame thường được bán đông lạnh vì có thể duy trì chất lượng được vài tháng. Khi mua về, bạn chỉ cần hấp, luộc, áp chảo hoặc hâm bằng lò vi sóng vài phút là được.', 0, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (57, N'Trái Lê Nam Phi size 52 (new)', N'qua_1.jpg', N'Quả', N'NAM PHI', 28000.0000, 1, N'Lê Nam Phi với vỏ màu xanh xen lẫn màu vàng có vệt đỏ rực rỡ khi quả chín. Quả hình chuông nhỏ, tròn và thon đều, bên trong thịt trắng với hương vị thơm mát, ngọt nhẹ.', 0, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (58, N'Nho Ngón Tay Hello Úc - Nhập Khẩu', N'qua_2.jpg', N'Kilogram', N'Công ty VITAMINHOUSE', 350000.0000, 20, N'Đặc điểm của nho ngón tay Úc:
   -   Nho ngón tay hay còn gọi là nho móng tay là giống nho lai tạo giữa giống nho Mỹ và giống nho Địa Trung Hải. Thay vì hình dạng thu nhỏ truyền thống, chúng thuôn dài như ngón tay. Khi chín, quả nho có màu đen đậm, da bóng, có lớp bột bên ngoài.
   -   Nho ngón tay không hạt lúc mới cắn có vị ngọt nhẹ nhưng khi vô miệng lại ngọt ngọt chua chua, giòn giòn ăn rất thích, là loại nho cao cấp với vị ngọt sắc, thịt quả chắc và mùi thơm rất tự nhiên.
Nho ngón tay Úc có giá trị dinh dưỡng cao, thích hợp ăn vặt, làm quà biếu sang trọng

Lợi ích của nho ngón tay Úc đối với sức khoẻ:
   -   Nho ngón tay cung cấp nhiều chất chống oxy hóa rất tốt cho tim mạch, huyết áp cao. Chúng cũng rất tốt cho mắt, não và trí nhớ.
Ngoài ra, vỏ nho còn rất tốt cho sức khỏe như: tăng cường sức đề kháng, chống lão hóa, có tác dụng thải độc tố…
   -   Hàm lượng resveratrol trong vỏ nho phong phú hơn trong thịt và hạt nho, đồng thời có tác dụng giảm máu nhiễm mỡ, chống tụ huyết, phòng chống xơ vữa động mạch và tăng cường hệ thống miễn dịch của cơ thể.
   -   Việc ăn nho hàng ngày giúp cơ thể khỏe mạnh, giúp nhanh phục hồi đối với những người bị thiếu máu kinh niên, những bệnh nhân bị huyết áp cao, viêm phế quản, gout, viêm dạ dày và táo bón…
Lưu ý bảo quản và sử dụng


﻿Nho ngón tay có rất nhiều lợi ích cho sức khoẻ:
   -   Nho ngón tay Úc chỉ được thu hoạch khi đã chín do không tăng độ ngọt thêm sau khi hái. Cần nhẹ tay để tránh nho bị rụng, tránh để nho đè chồng lên nhau.
   -   Khó bảo quản trong điều kiện bình thường, nên dùng ngay khi nho vừa chín.
   -   Có thể bảo quản ở điều kiện lạnh từ 0-4 độ C để giữ nho tươi trong khoảng 1 tuần.
   -   Không nên rửa nho trước khi chưa ăn để tránh tình trạng nước xâm nhập gây mềm, úng và làm giảm độ ngọt của nho.
Tránh để cùng các thực phẩm gây mùi như tỏi, hành, các đồ ăn tươi sống…
   -   Loại nho này thường được ăn trực tiếp, ngon hơn khi ăn lạnh. Ngoài ra, nước ép nho ngón tay Úc cũng cực kì tốt cho sức khoẻ.
Nho ngón tay còn có thể được dùng trong 1 số món ăn: như salad trái cây, phô mai, xà lách, các loại bánh ngọt…

Mua nho ngón tay Úc ở đâu an toàn?
   -   Bạn nên tới các cửa hàng hoa quả nhập khẩu tại thành phố Hồ Chí Minh uy tín để tránh mua phải hàng kém chất lượng, không đảm bảo vệ sinh an toàn thực phẩm hoặc nguồn gốc sản phẩm.
   -   Vitamin House tự hào là đơn vị chuyên cung cấp nho móng tay Úc chính gốc, giấy tờ nguồn gốc rõ ràng, cho ra thị trường những múi sầu riêng Musang King tươi ngon chất lượng nhất, được rất nhiều các gia đình đã và đang lựa chọn sử dụng.', 5, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (59, N'Táo Rockit New Zealand - Nhập Khẩu 424g', N'qua_3.jpg', N'Kilogram', N'NEW ZEALAND', 420000.0000, 0, N'Táo Rockit New Zealand có hình dáng nhỏ, vỏ ngoài màu hồng đậm pha chút sắc vàng, táo chắc giòn, hàm lượng nước cao, phần thịt màu trắng ngà như kem, vị ngọt đậm, mang hương vị hoàn toàn khác biệt so với các loại táo khác.
Là loại trái cây thích hợp để ăn chơi, ăn vặt, bổ sung nhiều dưỡng chất, dùng làm quà tặng rất sang trọng. Táo Rockit sau khi nhập về được bảo quản bằng hệ thống bảo quản lạnh liên tục nên luôn giữ được độ tươi ngon và dưỡng chất tự nhiên của nó.
Táo Rockit có tác dụng giúp giảm cân nhanh, làm đẹp da, vì cung cấp nhiều chất dinh dưỡng như một bữa ăn nhẹ nên rất được nhiều chị em phụ nữ ưa chuộng.
Giảm cholesterol: Một quả táo có kích cỡ trung bình thường cung cấp nhiều chất xơ, táo là một trong những loại hoa quả chứa nhiều pectin, một loại chất xơ giúp giảm cholesterol. Pectin có tác dụng ngừa cholesterol hình thành trên thành mạch máu, qua đó giảm được nguy cơ bị chứng vữa xơ động mạch và bệnh tim.
Ngừa huyết áp cao: Do táo chứa nhiều kali, một loại khoáng chất giúp kiểm soát huyết áp, nên ăn táo giúp giảm nguy cơ đột quỵ.
Giảm béo phì: Vỏ táo chứa một loại axit là Axit Ursolic thúc đẩy cơ thể đốt cháy calo, tăng việc hình thành cơ và giảm chất béo lâu năm trong cơ thể.', 0, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (60, N'Cam Vàng Mỹ - Nhập Khẩu', N'qua_4.jpg', N'Kilogram', N'Công ty VITAMINHOUSE', 150000.0000, 20, N'Cam Navel ruột vàng Mỹ vỏ màu vàng, ruột màu vàng đậm, vị ngọt thanh, không hạt, mọng nước. Thường dùng để ăn chứ không ép nước. Ăn cam vàng mỹ thường xuyên sẽ giúp bảo vệ bạn khỏi mắc các bệnh truyền nhiễm do virus, giảm đáng kể nguy cơ mắc bệnh sỏi thận. Nếu bạn muốn tránh lượng calo dư thừa, hãy thêm cam vàng mỹ mới Navel Mỹ vào chế độ dinh dưỡng hằng ngày của gia đình mình.
Cam vàng Navel Mỹ là một giống cam đột biến, có nguồn gốc từ Brasil sau đó được du nhập và trồng nhiều tại Mỹ, Úc, Nam Phi, Ai Cập…Giống cam vàng này có tên Navel vì phần đối diện với cuống trên trái cam có hình dạng giống như rốn người hay navel. Cho đến nay, cam vàng Navel Mỹ được nhân giống theo phương pháp ghép cành vì trong trái cam không có hạt.
Cam Navel rất dễ để nhận biết bởi hình dáng to, tròn đều, lớp vỏ mềm mại màu vàng cam rực rỡ. Phần cuống trái đặc trưng có hình dạng như cái rốn. Dưới lớp vỏ hơi dày, dễ lột là những múi cam căng mọng, vàng tươi không hạt.
Cam vàng Navel Mỹ có chất lượng hảo hạng. Trái cam to tròn, vỏ có màu vàng cam và sáng tự nhiên như ánh mặt trời. Cam Navel Mỹ rất dễ để lột vỏ do có lớp vỏ mỏng. Các múi bên trong trái cam Navel cũng dễ dàng tách rời nhau. Khi cắt cam ra, phần thịt trái bên trong với những tép mọng nước, màu vàng tươi, không hạt và ít xơ. Ăn vào có vị ngọt đậm đà và có mùi thơm đặc trưng rất dễ chịu.   
Cam vàng Navel Mỹ có chứa nhiều Vitamin C, tốt cho da, chống lão hóa, giảm Cholesterol, có tác dụng hồi phục sức khỏe nhanh, tăng cường chức năng tạo hồng huyết cầu, giảm căng thẳng thần kinh. Việc tiêu thụ vitamin C ở liều cao (khoảng 500mg mỗi ngày) rất tốt cho người ốm.

Cách bảo quản:
    -  Cam vàng Navel Mỹ có thể được bảo quản ở nhiệt độ phòng hoặc trong tủ lạnh. Nếu bảo quản trong tủ lạnh, nhiệt độ thích hợp nhất từ 7 – 9 độ C. Khi để cam ở bên ngoài nhiệt độ phòng, cần tránh để cam tiếp xúc với ánh nắng trục tiếp.
    -  Đối với cả hai phương pháp bảo quản, cam vàng Mỹ thường sẽ giữ được độ tươi ngon trong khoảng hai tuần và hàm lượng vitamin trong trái cam cũng không suy giảm.
    -  Không nên để loại trái cây này vào túi nhựa vì nếu tiếp xúc với độ ẩm trái cam sẽ rất dễ bị nhiễm nấm mốc.', 5, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductUnit], [ProductProviders], [ProductPrice], [ProductNumber], [ProductDescription], [ProductDiscount], [CategoryId]) VALUES (61, N'Bưởi Da Xanh Loại 1', N'qua_5.png', N'Quả', N'Công ty VITAMINHOUSE', 80000.0000, 5, N'Bưởi da xanh là một giống bưởi có nguồn gốc đầu tiên ở xã Thanh Tân, huyện Mỏ Cày Bắc, tỉnh Bến Tre. Trái bưởi da xanh có dạng hình cầu, nặng trung bình từ 1,2 – 2,5 kg/trái; vỏ có màu xanh đến xanh hơi vàng khi chín, dễ lột và khá mỏng (14–18 mm); tép bưởi màu hồng đỏ, bó chặt và dễ tách khỏi vách múi; vị ngọt không chua (độ brix: 9,5–12%); mùi thơm; không hạt đến khá nhiều hạt (có thể có đến 30 hạt/trái); tỷ lệ thịt/trái >55%.
Giống bưởi này đã được Bộ Nông nghiệp & Phát triển Nông thôn Việt Nam công nhận là giống quốc gia. Bưởi da xanh đã được xuất khẩu sang 50 thị trường khác nhau trên thế giới. Trong điều kiện bình thường quả bưởi da xanh có thể để lâu hơn 15 ngày.

Cách chọn mua:
   -  Cuống quả phải bám chắc vào quả và còn tươi, gai trên cuống phải to
   -  Da căng, không sần sùi. Vỏ có màu xanh hơi ngả vàng.
Quả đều và cân đối, cầm sẽ có cảm giác chắc tay.', 0, 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (1, N'Nguyễn Hoài Linh', N'111', 1, 1, N'hoai0405@gmail.com', N'0373312315', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (2, N'Nguyễn Lan', N'123456', 1, 1, N'lanng478@gmail.com', N'0372217717', N'Gia Xuyên - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (3, N'Phạm Kiên', N'123456', 1, 1, N'kien585@gmail.com', N'0373567725', N'Hoàng Diệu - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (4, N'Ngô Thủy', N'123456', 1, 1, N'thuy55@gmail.com', N'0366317519', N'Thạch Khôi - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (5, N'Trần Hằng', N'123456', 1, 1, N'hangt858@gmail.com', N'0333317515', N'Nhị Châu - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (6, N'Hà Huệ', N'123456', 1, 1, N'hahue55@gmail.com', N'0373317713', N'Trần Hưng Đạo - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (7, N'Nguyễn Dịu', N'123456', 1, 1, N'ngdiu69@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (8, N'Vũ Doan', N'123456', 1, 1, N'vudoan96@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (9, N'Đỗ Hà', N'123456', 1, 1, N'dha92@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (10, N'Nguyễn Đoàn', N'123456', 1, 1, N'ngdoan89@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (11, N'Đỗ Nam', N'123456', 1, 1, N'donam58@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (12, N'Bá Nam', N'123456', 1, 1, N'banam69@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (13, N'Thào Mỷ', N'123456', 1, 1, N'thaomy85@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (14, N'Nguyễn Kiên', N'123456', 1, 1, N'kien895@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (15, N'Hứa Duy', N'123456', 1, 1, N'duy332@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (16, N'Nguyễn Dũng', N'123456', 1, 1, N'dunglitu33@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (17, N'Đoàn Dũng', N'123456', 1, 1, N'ddung45@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (18, N'Nguyễn Trang', N'123456', 1, 1, N'ntrang90@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (19, N'Phùng Trang', N'123456', 2, 1, N'ptrang22@gmail.com', N'0392117736', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (20, N'Nguyễn Huân', N'123456', 2, 1, N'nguyenhuan89@gmail.com', N'0369817789', N'Nhị Châu - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (21, N'Trần Huân', N'123456', 2, 1, N'tranhuan58@gmail.com', N'0325217752', N'Thạch Khôi - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (22, N'Đoàn Nam', N'123456', 2, 1, N'doannam98@gmail.com', N'0325631771', N'Gia Xuyên - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (23, N'Lê Tú Anh', N'123456', 2, 1, N'tuanh45@gmail.com', N'0355217715', N'Trần Hưng Đạo - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (24, N'Lê Anh Tuấn', N'123456', 2, 1, N'anhtuan32@gmail.com', N'0375521771', N'Lê Thanh Nghị - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (25, N'Nguyễn Châu', N'123456', 2, 1, N'chau222@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (26, N'Hoàng Thắng', N'123456', 2, 1, N'thang22@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (27, N'Nguyễn Hương', N'123456', 2, 1, N'huong23@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (28, N'Hoàng Khánh', N'123456', 2, 1, N'khanh22@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (29, N'Nguyễn Điệp', N'123456', 3, 1, N'diep23@gmail.com', N'0373315815', N'Thạch Khôi - TP Hải Dương')
INSERT [dbo].[Account] ([AccountId], [AccountName], [AccountPassword], [AccountRole], [AccountStatus], [AccountEmail], [AccountPhone], [AccountAddress]) VALUES (30, N'Phạm Hoài Anh', N'111', 3, 1, N'hoai04@gmail.com', N'0373317715', N'Liên Hồng - TP Hải Dương')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (1, CAST(N'2021-05-14 00:00:00.000' AS DateTime), N'Đồng Lại - Liên Hồng - TP Hải Dương', 4, N'Phạm Nghĩa', N'0372251189', 106950.0000, NULL, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (2, CAST(N'2021-07-11 00:00:00.000' AS DateTime), N'Qua Bộ - Liên Hồng - TP Hải Dương', 3, N'Ngô Thủy', N'0382223176', 1248000.0000, NULL, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (3, CAST(N'2022-01-18 00:00:00.000' AS DateTime), N'Quỳnh Khuê - Thống Nhất - Gia Lộc', 3, N'Trần Hằng', N'0332151112', 162000.0000, NULL, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (4, CAST(N'2022-03-30 00:00:00.000' AS DateTime), N'Đồng Lại - Liên Hồng - TP Hải Dương', 3, N'Hà Huệ', N'0332251132', 64800.0000, NULL, 2)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (5, CAST(N'2022-01-01 00:00:00.000' AS DateTime), N'Lương Đình - Gia Lương - Gia Lộc', 2, N'Nguyễn Dịu', N'0333251165', 38000.0000, NULL, 2)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (6, CAST(N'2021-02-01 00:00:00.000' AS DateTime), N'Tâng Thượng - Liên Hồng - TP Hải Dương', 2, N'Nguyễn Trang', N'0352251145', 180000.0000, NULL, 3)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (7, CAST(N'2021-02-01 00:00:00.000' AS DateTime), N'Tâng Thượng - Liên Hồng - TP Hải Dương', 4, N'Vũ Doan', N'0367251895', 17200.0000, NULL, 3)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (8, CAST(N'2021-01-12 00:00:00.000' AS DateTime), N'Đồng Lại - Liên Hồng - TP Hải Dương', 1, N'Đỗ Hà ', N'0392251145', 30000.0000, NULL, 4)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (9, CAST(N'2021-12-01 00:00:00.000' AS DateTime), N'Đồng Lại - Liên Hồng - TP Hải Dương', 1, N'Nguyễn Điệp', N'0372252341', 135000.0000, NULL, 4)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [OrderAddress], [OrderStatus], [OrderRecipientName], [OrderRecipientPhone], [OrderTotalMoney], [OrderNotes], [AccountId]) VALUES (10, CAST(N'2022-04-24 12:07:30.000' AS DateTime), N'Yết Kiêu - Gia Lộc - Hải Dương', 1, N'Phạm Trung Kiên', N'0356665252', 2042500.0000, NULL, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (2, 1, 3, 18000.0000, 10)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (2, 4, 4, 18000.0000, 10)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (2, 5, 2, 20000.0000, 5)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (2, 6, 4, 25000.0000, 20)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (2, 7, 1, 18000.0000, 10)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (2, 8, 2, 15000.0000, 0)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (2, 9, 10, 15000.0000, 10)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (3, 1, 1, 33000.0000, 5)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (5, 2, 2, 105000.0000, 20)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (6, 2, 3, 450000.0000, 20)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (7, 3, 4, 45000.0000, 10)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (14, 10, 20, 95000.0000, 0)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (17, 10, 2, 75000.0000, 5)
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [OrderDetailNumber], [OrderDetailPrice], [OrderDetailDiscount]) VALUES (52, 1, 1, 30000.0000, 10)
SET IDENTITY_INSERT [dbo].[Newspaper] ON 

INSERT [dbo].[Newspaper] ([NewspaperId], [NewspaperTitle], [NewspaperDescription], [NewspaperDate], [NewspaperImage]) VALUES (1, N'Noel nên tặng quà gì cho bạn gái chiếm trọn trái tim', N'Giáng sinh đang đến rất gần và vấn đề muôn thuở của các chàng trai là tặng quà gì dành cho nửa kia của mình để có thể chiếm trọn trái tim nàng. Nếu bạn đang có những suy nghĩ như trên thì đừng quá lo lắng. Bài viết dưới đây sẽ mách nước ngay noel nên tặng quà gì cho bạn gái để ghi điểm tuyệt đối, khiến cho nàng phải nhớ mãi. Hãy cùng Vitamin House tham khảo ngay nhé!

Cách chọn quà noel cho bạn gái
Ý nghĩa của món quà Giáng sinh với các bạn nữ không chỉ nằm ở giá trị vật chất của món quà mà còn là từ sự thấu hiểu nắm bắt sở thích cũng như sự chân thành của chính bạn. Việc chọn quà đôi khi phải phụ thuộc vào mối quan hệ, cũng như mức độ thân thiết, tình cảm của đôi bên.

Cách chọn quà noel cho bạn gái
Để chọn được đúng món quà thì bạn nên xác định xem mối quan hệ của mình và người ấy đang ở giai đoạn nào, từ đó việc chọn quà sẽ trở lên dễ dàng hơn, không khiến người nhận cảm thấy ái ngại.
Nếu hai bạn mới quen nhau
Đối với người bạn gái mới quen, chưa có dịp tiếp xúc nhiều để hiểu nhau, bạn cần phải tìm hiểu một thời gian mới có thể biết sở thích của đối phương là gì. Lúc này bạn không nên chọn những món quà đắt tiền vì có thể khiến bạn gái cảm thấy ngại, không thoải mái.
Thay vào đó ta có thể lựa chọn những món quà kẹo ngọt, đồ lưu niệm như đồ handmade hoặc những món quà tự làm tay nhỏ và ý nghĩa. Điều đó sẽ khiến người ấy trân trọng thêm tình cảm của bạn cũng như món quà dành tặng cô ấy.

Với hai bạn đã quen nhau lâu
Khi hai bạn đã có một khoảng thời gian dài quen nhau, có lẽ chàng trai cũng đủ hiểu sở thích, mong muốn bạn gái mình là gì.
Đối với người bạn gái đã đồng hành cùng mình cả một khoảng thời gian dài, mối quan hệ 2 bạn có thể tiến tới hôn nhân. Lúc này bạn có thể lựa chọn những món quà đắt tiền hoặc thiết thực như nước hoa, điện thoại, sữa tắm hay một chuyến du lịch xa hâm nóng tình cảm hai người hoặc tạo bất ngờ cho bạn gái bằng một màn cầu hôn lãng mạn.', CAST(N'2022-02-01 00:00:00.000' AS DateTime), N'tintuc_1.jpg')
INSERT [dbo].[Newspaper] ([NewspaperId], [NewspaperTitle], [NewspaperDescription], [NewspaperDate], [NewspaperImage]) VALUES (2, N'Cách làm chocolate tươi ngon cực đỉnh siêu hấp dẫn', N'Chocolate tươi được biết tới là món ăn tráng miệng có nguồn gốc từ đất nước Nhật Bản xinh đẹp và được rất nhiều người yêu thích đặc biệt là các bạn trẻ. Cùng Vitamin House tham khảo cách làm chocolate tươi siêu ngon trong bài viết này nhé!
Nguyên liệu làm chocolate tươi
Nguyên liệu làm socola tươi bạn có thể dễ dàng tìm kiếm ở siêu thị lớn hoặc các cửa hàng bán đồ làm bánh. Bạn cần chuẩn bị 100ml kem tươi, 200g chocolate (loại 70-75% cacao), 15g bơ nhạt, 1 thìa canh rượu brandy, rum,..(nếu có), 2 thìa cà phê loại bột ca cao để phủ chocolate, một khuôn inox cỡ 10x10cm.


Nguyên liệu làm chocolate tươi
Người Nhật sáng chế ra dùng bột cacao để thay cho lớp vỏ socola cứng tạo nên sản phẩm socola tươi ngon tuyệt đỉnh. Hương vị đặc trưng này được toàn thế giới yêu thích.
Lưu ý để có được thành phẩm ngon chuẩn vị, bạn nên chọn mua nguyên liệu chocolate, bột ca cao, bơ nhạt loại chất lượng, thông tin sản xuất rõ ràng, thương hiệu uy tín để không làm hỏng hương vị sau khi chế biến. Bạn có thể tới Vitamin House để được tư vấn các sản phẩm chính hãng, uy tín để về thể hiện tài năng nấu bếp của mình.

Cách làm chocolate tươi
Cùng vào bếp trổ tài làm chocolate tươi ngon chuẩn hương vị theo các bước dưới đây nhé!
Những lưu ý khi chọn nguyên liệu làm chocolate tươi
Điểm khác biệt nổi bật giữa socola tươi và những loại chocolate khác chính là ở độ mềm, tan chảy nhanh. Khi cho miếng socola tươi vào miệng sẽ tan chảy ngay, vị chocolate sẽ ngập tràn, kích thích vị giác người thưởng thức.

Để có được hương vị chocolate tươi như ý, bạn nên lưu ý như sau:
Khi chọn socola, bạn không nên chọn loại socola sữa mà hãy dùng loại có hàm lượng ca cao trong đó từ 70-75%. Nếu như bạn yêu thích ăn socola đắng thì chọn loại hàm lượng cao hơn nữa.
Nguyên liệu bơ nên chọn là loại bơ động vật, không dùng bơ thực vật cho món chocolate. Nếu không có bơ nhạt thì không nên dùng bơ mặn thay thế bởi sẽ ảnh hưởng tới thành phẩm cuối cùng.
Kem tươi để làm socola nên chọn đúng loại ghi whipping cream, không chọn kem topping hay kem ăn liền. Kem tươi chuẩn vị để làm socola tươi là loại có khoảng 37% chất béo trở lên. Nếu nguyên liệu bạn mua có thành phần ít hơn thế thì nên tăng thêm chút khối lượng bơ khi chế biến.

Cách làm socola tươi ngon
Thao tác làm chocolate tươi khá nhanh nên bạn hãy chuẩn bị đong sẵn các nguyên liệu như ghi trong công thức để tiện làm hơn.
Phần socola và bơ hãy cắt nhỏ để dễ dàng hòa quyện vào kem. Khuôn inox để làm socola tươi thường có kích thước 10x10cm. Nếu bạn muốn thành phẩm nama chocolate mỏng hơn thì hãy dùng khuôn to hơn chút. Tuy nhiên, nếu lớp socola mỏng quá có thể bị vỡ khi lấy ra thưởng thức.
Khuôn inox nên được rửa sạch lau khô, không có đọng nước trên bề mặt khuôn để đảm bảo chocolate không xuất hiện những lỗ nhỏ sau khi hoàn thành. Hãy dùng giấy nến để lót cạnh và đáy của khuôn.

Xem thêm: Bơ thực vật bao nhiêu calo? Cần lưu ý gì khi ăn bơ thực vật?

Làm chocolate tươi
Bước 1: Đầu tiên bạn hãy đun với mức nhiệt nhỏ nguyên liệu kem tươi trong một chiếc nồi hoặc bạn có thể đun cách thủy. Khi đun bạn nên lưu ý vì kem tươi rất dễ bị trào. Do đó, khi bạn vừa thấy bong bóng xuất hiện ở mép nồi thì hãy nhấc nồi xuống bếp ngay tránh bị trào ra ngoài.
Bước 2: bạn cho phần bơ và chocolate đã cắt nhỏ vào nồi kem tươi vừa đun, khuấy đều tay để bơ và chocolate tan hết. Khi hỗn hợp chuyển hoàn toàn sang dạng sệt, mịn, bám dính thì đã đạt yêu cầu. Sau khi chocolate và bơ đã tan chảy bạn cho rượu có hương như Rum hay Brandy vào hỗn hợp nhé. Nguyên liệu vị rượu là không bắt buộc, nó chỉ làm chocolate thơm hương hấp dẫn hơn.
Bước 3: Khi đã hoàn thành được hỗn hợp socola tươi đun chảy thì bạn hãy đổ vào khuôn. Để loại bỏ bọt khí và hỗn hợp dàn đều bạn hãy vỗ nhẹ khuôn xuống mặt bàn. Sau đó bạn để khuôn chocolate vào ngăn tủ mát 4 tiếng. Chocolate tươi đông lạnh mang vị tươi mát và khi ăn bạn chỉ cần cắt nhỏ.
Những lưu ý khi cắt chocolate tươi

Lưu ý khi cắt socola tươi
Để cắt miếng socola tươi bạn cần chuẩn bị một chiếc khăn nóng và con dao lưỡi dài. Hãy làm ấm dao bằng chiếc khăn nóng và cắt chocolate thành từng viên hình vuông cạnh khoảng 2 cm.
Lưu ý để các lần cắt được những miếng chocolate vuông vức thì bạn hãy nhớ liên tục lau sạch dao bằng khăn ấm.
Sau khi cắt xong bạn rây bột cacao lên mặt trên của chocolate tươi bằng dụng cụ rây bột lưới nhỏ.Tùy theo sở thích, lượng bột cacao rắc lên sẽ nhiều, ít khác nhau.

Theo như kinh nghiệm những người đã từng làm, nếu rây bột cacao trước khi cắt socola tươi thì bạn sẽ cảm thấy đỡ bị dính, dễ cắt hơn. Phủ lớp bột không những làm tăng hương vị thơm ngon mà còn giúp che những giọt nước bám trên bề mặt socola tươi do chênh lệch nhiệt độ khi bỏ từ tủ lạnh ra môi trường bên ngoài.

Qua bài viết trên đây, Vitamin House tin rằng bạn đã có được công thức làm món socola tươi ngon chuẩn vị và có thể trổ tài ngay cho gia đình, bạn bè thưởng thức. Bạn có thể đến để sắm nguyên liệu có sẵn tại Vitamin House chính hãng, chất lượng.', CAST(N'2022-03-01 00:00:00.000' AS DateTime), N'tintuc_2.jpg')
INSERT [dbo].[Newspaper] ([NewspaperId], [NewspaperTitle], [NewspaperDescription], [NewspaperDate], [NewspaperImage]) VALUES (3, N'Mách mẹ thông thái top gia vị rắc cơm cho bé ngon tuyệt', N'Có nên dùng gia vị rắc cơm cho bé?
Gia vị rắc cơm là sản phẩm có xuất xứ từ đất nước Nhật Bản với các nguyên liệu hoàn toàn tự nhiên được sao khô và trộn lẫn với nhau. Ở Việt Nam món ăn này cũng gần giống với món ruốc thịt, ruốc vừng nhưng giàu dinh dưỡng và kích thích vị giác trẻ nhỏ hơn.

Gia vị rắc cơm cho bé dinh dưỡng thơm ngon
Thành phần của món gia vị giảm muối và chứa các thành phần dinh dưỡng phù hợp với các em bé như: vitamin, canxi, sắt,...Ba mẹ hoàn toàn yên tâm lựa chọn gia vị rắc cơm cho bé yêu. Những điểm cộng của loại gia vị này khiến sản phẩm được các mẹ tin dùng có thể kể tới như:
Gia vị rắc cơm rất thuận tiện khi sử dụng, ba mẹ chỉ cần rắc lên cơm hoặc cháo trắng là bé có thể thưởng thức.
Mẹ còn có thể dùng gia vị rắc cơm để tăng thêm hương vị món ăn của bé cũng như để trang trí món ăn.
Sử dụng gia vị rắc cơm khiến món ăn có nhiều mùi vị khác nhau, giúp bé hào hứng khi ăn. Mỗi gói sản phẩm đều có nhiều vị để bé thay đổi không bị chán ngán.
Gia vị rắc cơm còn cung cấp đủ dinh dưỡng cần thiết cho bé như đạm, sắt, canxi, vitamin,....Lượng muối trong các sản phẩm gia vị rắc cơm cũng được tính phù hợp với trẻ em.
Không thay thế hoàn toàn các món ăn, thực phẩm cho trẻ nhỏ như cá, thịt, tôm,...nhưng gia vị rắc cơm là món không thể thiếu khiến bé yêu thích các bữa ăn. Có thể nói là một sản phẩm thực sự phù hợp sản xuất từ các nguyên liệu tốt, lành tính. Bạn nên dùng để chăm sóc sức khỏe cho những em bé từ 9 tháng tuổi trở lên có khả năng ăn thô tốt.
Top các loại gia vị rắc cơm cho bé ngon, bổ dưỡng
Gia vị rắc cơm bổ sung thêm các chất cho bé như canxi, sắt, đạm,...và mang lại sự đa dạng trong thực đơn của bé. Trên thị trường, có rất nhiều các loại gia vị rắc cơm, hầu hết đều khuyến cáo cho bé từ 9 tháng tuổi trở lên. Các mẹ cũng nên tìm hiểu kỹ thông tin trước khi chọn lựa để có được quyết định mua sắm ưng ý!

Gia vị rắc cơm cho bé Tanaka Food
Món gia vị rắc cơm Tanaka cho bé
Gia vị rắc cơm Tanaka Furikake bao gồm 30 gói nhỏ sẽ chia làm 6 vị: cá thu rong biển, cá ngừ nướng Mirin, trứng rong biển, rong biển, trứng cá tuyết, cá hồi. Để sử dụng mẹ chỉ cần rắc gói gia vị rắc cơm lên cháo trắng hoặc cơm nóng cho bé là bé có thể ăn ngay mà vẫn đầy đủ chất dinh dưỡng.
Ngoài ra mẹ có thể là sushi, cơm nắm với màu sắc và hình thù bắt mắt để các bé luôn thích thú với bữa ăn.
Sản phẩm được sản xuất từ Nhật Bản, không chứa chất bảo quản, chất phụ gia độc hại, an toàn với sức khỏe của bé. Gia vị thơm ngon ngày còn giiúp bổ sung các chất dinh dưỡng cần thiết cho bé phát triển toàn diện. Sản phẩm được nhà sản xuất khuyến cáo phù hợp cho bé từ 1 tuổi trở lên.

Gia vị rắc cơm Hello Kitty
Gia vị rắc cơm cho trẻ em Hello Kitty
Gia vị rắc cơm cho bé Hello Kitty của Nhật thành phần gồm nhiều loại thực phẩm khác nhau được đóng thành từng gói nhỏ rất tiện lợi. Các mẹ chỉ cần trộn hoặc nắm cơm cho trẻ là đã có một bữa cơm thơm ngon, nhanh gọn mà tiện lợi.
Mẹ có thể dùng gia vị rắc cơm Hello Kitty cho bé từ 9 tháng tuổi.
Gia vị rắc cơm Hello Kitty có 20 gói nhỏ gồm 5 vị là cá hồi, rong biển, cá bào, trứng cá tuyết. Sản phẩm sẽ giúp mẹ xoay vòng bữa ăn của bé, thay đổi các vị khác nhau, khiến trẻ lạ vị, cảm thấy thích thú và ăn ngon hơn.

Gia vị rắc cơm cho bé Marumiya
Gia vị rắc cơm cho trẻ em thương hiệu Marumiya của Nhật
Gia vị rắc cơm cho trẻ em thương hiệu Marumiya của Nhật cũng rất nổi tiếng trên thị trường. Sản phẩm đã được chế biến sẵn nên chỉ cần rắc lên cháo trắng, cơm hay các món luộc và bạn không cần chế biến lại. Sản phẩm gia vị rắc cơm Marumiya dùng cho bé từ 9 tháng tuổi trở lên.
Gia vị Marumiya có thể dùng rắc lên rau củ luộc, cơm trắng, cơm trộn, trứng tráng, làm nem, trứng cuộn,....Đặc biệt, gia vị rắc cơm không chứa chất tạo màu tạo mùi, chất bảo quản, rất an toàn cho bé. Sản phẩm được đóng dạng gói rất tiện lợi khi sử dụng nhất là tiện lợi mang theo cho bé khi đi chơi xa.

Qua bài viết trên đây, Vitamin House hi vọng đã cung cấp tới cho ba mẹ những thông tin hữu ích về sản phẩm gia vị rắc cơm cho bé đang được yêu thích trên toàn thế giới. Để chăm sóc những em bé, ba mẹ cần tìm được địa chỉ bán hàng chất lượng, uy tín, đảm bảo an toàn sức khỏe. Hãy đến Vitamin House ngay hôm nay để có được quyết định mua hàng ưng ý nhất nhé!', CAST(N'2021-01-01 00:00:00.000' AS DateTime), N'tintuc_3.jpg')
INSERT [dbo].[Newspaper] ([NewspaperId], [NewspaperTitle], [NewspaperDescription], [NewspaperDate], [NewspaperImage]) VALUES (4, N'Noel nên tặng quà gì cho bạn gái chiếm trọn trái tim', N'Giấm táo hữu cơ là một loại giấm được làm từ các trái táo được canh tác hữu cơ, không trải qua quá trình lọc và tiệt trùng, ủ lên men trong thời gian dài. Thành phẩm có vị chua nhẹ, vàng nhạt, không hóa chất độc hại, rất tốt cho sức khỏe người sử dụng. Sản phẩm hoàn toàn tự nhiên này có thể dùng để trộn salad, rắc nêm thêm vào một số món ăn để tăng vị hấp dẫn. Cùng Vitamin House khám phá top những loại giấm táo hot nhất hiện nay trong bài viết này nhé!
Giấm táo hữu cơ được biết đến như một loại thuốc bổ cho cơ thể với rất nhiều công dụng tốt, cụ thể:
Giấm táo dạng hữu cơ chưa tiệt trùng giống như các loại thực phẩm lên men khác có chứa các loại vi khuẩn có lợi cho đường ruột, giúp hệ tiêu hóa hoạt động tốt.
Những vi khuẩn lành mạnh trong giấm táo còn giúp tăng cường hệ miễn dịch của bạn, giúp tăng cường khả năng chống lại bệnh tật.

Giấm táo hữu cơ tốt cho sức khỏe
Nếu tóc bạn khô, dễ gãy hay ngứa da đầu thì giấm táo có thể giúp cải thiện vấn đề trên bằng cách cân bằng độ PH của tóc.
Giấm táo loại hữu cơ cũng được sử dụng để cải thiện, điều trị giúp da và móng tay khỏe mạnh hơn nhờ đặc tính kháng khuẩn và kháng nấm tự nhiên.
Đặc biệt để ngăn ngừa sự gia tăng lượng đường trong máu bạn hãy uống bốn thìa cà phê giấm táo trước bữa ăn.
Ngoài ra thì trong giấm táo còn chứa sắt, magie, photpho, mangan, chất chống oxy hóa,... tăng cường dinh dưỡng hiệu quả cho bạn.
Giấm táo loại hữu cơ còn có pectin giúp trung hòa cholesterol, sẽ giúp bạn xấu cải thiện sức khỏe tim mạch.
Top những loại giấm táo hữu cơ được ưa chuộng
Hiện nay, giấm táo hữu cơ càng được biết đến nhiều hơn bởi hương vị thơm ngon và những lợi ích tuyệt vời cho sức khỏe. Cùng điểm danh top những sản phẩm giấm táo được các bà nội trợ yêu thích trong nội dung tiếp theo nhé!


Giấm táo hữu cơ Bragg được yêu thích
Giấm táo hữu cơ Bragg là một thương hiệu của Mỹ được yêu thích ở các quốc gia trên thế giới. Sản phẩm của Bragg được sản xuất bằng loại táo hữu cơ trồng tại Hoa Kỳ. Người tiêu dùng sẽ không phải băn khoăn mối lo táo biến đổi gen hay ô nhiễm thuốc trừ sâu độc hại bởi nguyên liệu sản xuất đều được kiểm tra gắt gao trước khi chế biến.
Giấm táo hữu cơ Bragg không lọc, không hấp khử trùng, bảo toàn các axit amin, enzyme, các vi khuẩn có lợi. Sản phẩm này được chứng nhận theo tiêu chuẩn của bộ Nông nghiệp Mỹ - USDA.

Giấm táo loại hữu cơ thương hiệu Bragg ứng dụng rộng rãi trong thực phẩm và làm đẹp: 
    -   Loại giấm này có thể dùng làm các món salad, ăn kèm với rau, cá, thịt trắng hoặc làm gia vị, nước sốt.
    -    Ngoài ra bạn có thể pha loãng giấm táo Bragg với nước uống hằng ngày để hỗ trợ giảm cân, tăng cường hệ miễn dịch, thải độc cơ thể, tăng cường hệ tiêu hóa, cân bằng insulin trong máu, giúp giảm đau họng và xoa dịu tình trạng viêm.
    -    Giấm táo Bragg còn dùng để trị mụn, tẩy da chết, thu nhỏ lỗ chân lông, giảm nếp nhăn, làm sáng da, phục hồi da cháy nắng,...

Giấm táo hữu cơ Heinz nổi tiếng từ lâu đã là thương hiệu nổi tiếng, là sự lựa chọn tin cậy của mọi nhà. Với những quả táo được trồng hữu cơ được chọn lọc nghiêm ngặt, giấm táo Heinz rất sạch sẽ, có hương vị êm dịu hăng nhẹ. Sản phẩm là lựa chọn lý tưởng cho các món salad và nhiều món ăn khác.
Trên thị trường, giấm táo loại hữu cơ Heinz có một mức giá cao hơn hầu hết các loại khác tuy nhiên người dùng vẫn rất ưa chuộng bởi độ ngon lành của nó. Giấm táo Heinz có công dụng làm gia vị, giúp gia trắng mịn, giúp bổ sung trong chế độ ăn uống.

Giấm táo hữu cơ White House
Giấm táo hữu cơ chất lượng tốt, uy tín. Giấm táo hữu cơ White House làm từ táo lên men, không sản xuất theo phương pháp truyền thống. Vì thế nên bạn có thể thưởng thức trọn vẹn hương vị của giấm. Sản phẩm được đóng thành các chai nhỏ nên rất tiện khi sử dụng và dễ dàng khi mang đi ra ngoài. Bạn có thể dùng giấm White House để làm salad, trộn với thức ăn để mang tới hương vị đặc trưng ngon hấp dẫn.

Ngày nay trên thị trường giấm táo được bán khá phổ biến, được người tiêu dùng khen ngợi và rất ưa chuộng. Tuy nhiên bạn cũng nên tìm hiểu, lựa chọn sản phẩm uy tín để tránh mua phải hàng giả, hàng kém chất lượng gây ảnh hưởng xấu tới sức khỏe người dùng. Hãy đến Vitamin House ngay hôm nay để được tư vấn và chọn lựa sản phẩm giấm táo hữu cơ chất lượng, nguồn gốc sản xuất uy tín, tốt cho sức khỏe cả gia đình nhé!', CAST(N'2021-11-12 00:00:00.000' AS DateTime), N'tintuc_4.jpg')
INSERT [dbo].[Newspaper] ([NewspaperId], [NewspaperTitle], [NewspaperDescription], [NewspaperDate], [NewspaperImage]) VALUES (5, N'Lợi ích đáng kinh ngạc của đậu nành Nhật với sức khỏe', N'Đậu nành Nhật không còn quá xa lạ với người tiêu dùng tại Việt Nam bởi nguồn dinh dưỡng dồi dào và hương vị đặc biệt thơm ngon. Từ khi mới vào thị trường, đậu nành Edamame đã trở thành món ăn yêu thích của nhiều gia đình Việt. Loại đậu nành này có những lợi ích nào cho sức khỏe khiến chúng hot đến như vậy? Cùng Vitamin House tìm hiểu ngay trong bài viết này nhé!
Những lợi ích của đậu nành Nhật
Đậu nành Edamame là đậu nành nhật non, nguyên trái, có màu xanh lá cây. Bởi vậy, bằng mắt thường, chúng ta có thể nhận thấy loại đậu nành này có màu rất đặc trưng khác với màu nâu nhạt hoặc màu be của đậu bình thường.

Đậu nành Nhật được yêu thích tại Việt Nam
Đậu nành Edamame thường được trồng ở Nhật, hiện đã được đưa giống về trồng ở An Giang, Cái Dầu. Khi thu hoạch loại đậu nành này bạn cần chú ý thu hoạch vào lúc sáng sớm khi trái còn non để hạt đậu còn tươi xanh và không nên thu hoạch khi hạt đậu đã già. Hạt đậu nành Edamame có vị ngọt và chứa rất nhiều dinh dưỡng như protein, axit amin, chất xơ, chất khoáng,.... cần thiết cho cơ thể.

Tốt cho người ăn chay và chế độ giảm cân
Hạt đậu nành Edamame chứa các protein rất tốt cho cơ thể. Vì thế nên đậu nành Edamame là thực phẩm hỗ trợ rất tốt để dùng cho ăn chay hoặc giảm cân. Bạn sẽ hoàn toàn an tâm bởi cơ thể được cung cấp đủ protein, các chất cần thiết mà không hề sợ bị béo. Sử dụng thực phẩm hỗ trợ và kết hợp các bài tập điều độ sẽ giúp bạn có một vóc dáng như ý, một chế độ giảm cân khoa học.
Chế độ dinh dưỡng tốt cho người tiểu đường
Như khoa học đã chứng minh những món ăn có carbohydrate cao khi ăn nhiều sẽ có nguy cơ mắc các bệnh mãn tính như tim, tiểu đường, động kinh,...Và điểm cộng ở đây của đậu nành Edamame chính là có lượng carbohydrate thấp không ảnh hưởng xấu tới sức khỏe người sử dụng.

Đậu nành Nhật tốt cho sức khỏe
Hơn thế, loại đậu nành Nhật này còn được bổ sung vào thực đơn của những người đang mắc tiểu đường. Với những người bị căn bệnh này thì ăn uống kiêng khem sẽ khiến cơ thể thiếu hụt chất dinh dưỡng. Sử dụng đậu nành Nhật chính là giải pháp hữu hiệu tốt cho sức khỏe.
Thành phần tốt cho hệ tiêu hóa, tim mạch, cải thiện tâm trạng
Đậu này Edamame của Nhật Bản cung cấp chất xơ, giúp giảm cholesterol để hỗ trợ ngăn ngừa các bệnh liên quan đến tiêu hóa và tim mạch. Một loại thực phẩm tốt như vậy đã khiến các bà nội trợ rất ưa chuộng, quan tâm.
Bên cạnh đó, trong đậu nành loại này còn chứa folate giúp ngăn chặn homocysteine, tác nhân gây ảnh hưởng không tốt đến tâm trạng của chúng ta. Từ đó, sử dụng đậu nành Nhật giúp tâm trạng luôn vui vẻ, giải tỏa căng thẳng.

Giúp cải thiện trí nhớ, tốt cho giấc ngủ
Đậu nành Edamame của Nhật có chứa choline có tác dụng tốt đối với cơ bắp, giấc ngủ và trí nhớ của bạn. Ngoài ra còn giúp giảm tình trạng viêm của người hen suyễn và giúp chống lại các triệu chứng viêm dẫn đến bệnh tim mạch.
Ngoài ra, theo nghiên cứu của các chuyên gia đã cho thấy ăn đậu nành Edamame của nhật có thể sẽ làm giảm nguy cơ mắc ung thư tuyến tiền liệt, một lợi ích vàng cho sức khỏe người sử dụng.

Những lưu ý khi sử dụng đậu nành Nhật
Để phát huy tốt đa dinh dưỡng của đậu nành Nhật, bạn cũng cần trang bị những kiến thức dưới đây để trở thành người tiêu dùng thông thái.


Những lưu ý khi dùng đậu nành Nhật
   -  Đậu Edamame chuẩn thì bên ngoài có màu xanh lục rất đặc trưng, có vỏ bên ngoài với nhiều lông tơ và hạt bên trong.
   -  Đậu Edamame ngon nhất ăn khi thu hoạch xong. Bạn có thể bảo quản khoảng 10 tiếng sau khi thu hoạch đậu và nếu để trong tủ lạnh có thể để được 3 ngày.
   -  Khi bảo quản tại gia đình, bạn cần lưu ý là vỏ quả cần được giữ ẩm để tránh giảm chất dinh dưỡng của đậu.
   -  Trên thị trường đậu Edamame thường bán đông lạnh vì đây là phương pháp bảo quản tốt nhất có thể duy trì chất lượng, giữ được chất lượng vốn có của đậu trong vòng vài tháng. Vì thế nên khi tìm mua đậu Edamame ở cửa hàng thực phẩm hay siêu thị bạn nên kiểm tra thời hạn sử dụng, nguồn gốc xuất xứ, chất lượng của sản phẩm. Khi mua về bạn chỉ cần luộc, hấp, hâm lò vi sóng trong vài phút hoặc áp chảo là có thể sử dụng.

Qua bài viết trên đây, Vitamin House hi vọng bạn đã biết được những lợi ích tuyệt vời của đậu nành Nhật và mong muốn tìm mua được sản phẩm uy tín, chất lượng về cho gia đình sử dụng. Hãy qua Vitamin House ngay hôm nay để được tư vấn, chọn lựa sản phẩm ưng ý nhất nhé!', CAST(N'2022-04-05 00:00:00.000' AS DateTime), N'tintuc_5.jpg')
SET IDENTITY_INSERT [dbo].[Newspaper] OFF


