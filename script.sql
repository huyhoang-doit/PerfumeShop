--drop database Perfume_Website 


CREATE DATABASE Perfume_Website 

USE [Perfume_Website]

-- Tạo bảng [dbo].[Users]
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL ,
	[UserName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Email] [nvarchar](50)  NULL,
	[BirthDay] date NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](11) NOT NULL,
)

INSERT INTO [dbo].[Users] ([UserName], [FullName], [Password], [Address],[Image], [Email],[BirthDay], [Phone], [RoleID])
VALUES 
    ('john_doe', 'John Doe', 'password123', '123 Main St, CityA', 'images/users/thanh.png', 'aaaa@gmail.com', '2003-08-09', '12345678901', 1)
	
-- Tạo bảng [dbo].[Categories]
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	CONSTRAINT [PK_Categories] PRIMARY KEY([CategoryID])
)

INSERT INTO [dbo].[Categories] ([CategoryName], [Description])
VALUES 
    ('Men', 'Perfume for men'),
    ('Women', 'Perfume for women'),
    ('Kids', 'Perfume for kids'),
    ('Unisex', 'Perfume suitable for both genders'),
	('Gift Set', 'Perfume suitable for both genders');



-- Tạo bảng [dbo].[Suppliers]
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
	CONSTRAINT [PK_Suppliers] PRIMARY KEY([SupplierID])
)



INSERT INTO [dbo].[Suppliers] ([CompanyName], [ContactName], [Country], [Phone], [Fax], [HomePage])
VALUES 
    ('Versace', 'Supplier Contact Versace', 'Italy', '+39 02 1234 5678', '+39 02 1234 5679', 'http://www.versace.com'),
    ('Hugo Boss', 'Supplier Contact Hugo Boss', 'Germany', '+49 30 9876 5432', '+49 30 9876 5431', 'http://www.hugoboss.com'),
    ('Jaguar', 'Supplier Contact Jaguar', 'United Kingdom', '+44 20 3456 7890', '+44 20 3456 7891', 'http://www.jaguar.com'),
    ('Armani', 'Supplier Contact Armani', 'Italy', '+39 02 2345 6789', '+39 02 2345 6781', 'http://www.armani.com'),
    ('Paco Rabanne', 'Supplier Contact Paco Rabanne', 'France', '+33 1 3456 7890', '+33 1 3456 7891', 'http://www.pacorabanne.com'),
    ('Ralph Lauren', 'Supplier Contact Ralph Lauren', 'USA', '+1 212 555 1234', '+1 212 555 5678', 'http://www.ralphlauren.com'),
    ('Bvlgari', 'Supplier Contact Bvlgari', 'Italy', '+39 06 1234 5678', '+39 06 1234 5679', 'http://www.bvlgari.com'),
    ('Coach', 'Supplier Contact Coach', 'USA', '+1 212 555 6789', '+1 212 555 6790', 'http://www.coach.com'),
    ('Kenzo', 'Supplier Contact Kenzo', 'France', '+33 1 8765 4321', '+33 1 8765 4322', 'http://www.kenzo.com'),
    ('D&G', 'Supplier Contact D&G', 'Italy', '+39 02 3456 7890', '+39 02 3456 7891', 'http://www.dolcegabbana.com'),
    ('Jean Paul Gaultier', 'Supplier Contact Jean Paul Gaultier', 'France', '+33 1 2345 6789', '+33 1 2345 6781', 'http://www.jeanpaulgaultier.com'),
    ('Ajmal', 'Supplier Contact Ajmal', 'United Arab Emirates', '+971 4 1234 5678', '+971 4 1234 5679', 'http://www.ajmalperfume.com'),
    ('Calvin Klein', 'Supplier Contact Calvin Klein', 'USA', '+1 212 555 7890', '+1 212 555 7891', 'http://www.calvinklein.com'),
    ('The Body Shop', 'Supplier Contact The Body Shop', 'United Kingdom', '+44 20 9876 5432', '+44 20 9876 5431', 'http://www.thebodyshop.com'),
    ('Lattafa', 'Supplier Contact Lattafa', 'United Arab Emirates', '+971 6 2345 6789', '+971 6 2345 6781', 'http://www.lattafa.com');



-- Tạo bảng [dbo].[Products]
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](100) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[QuantitySold] [int] NULL,
	[StarRating] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[describe] [nvarchar](max) NULL,
	[releaseDate] [date] NULL,
	[Discount] [float] NULL,
	CONSTRAINT [PK_Products] PRIMARY KEY([ProductID]),
	CONSTRAINT [FK_Products_Supplier]
    FOREIGN KEY ([SupplierID])
    REFERENCES [dbo].[Suppliers] ([SupplierID]),
	CONSTRAINT [FK_Products_Category]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories] ([CategoryID])
)


INSERT INTO [dbo].[Products] (
    [ProductName], 
    [SupplierID], 
    [CategoryID], 
    [QuantityPerUnit], 
    [UnitPrice], 
    [UnitsInStock], 
    [QuantitySold], 
    [StarRating], 
    [Discontinued],
	[image1],
	[image2],
	[describe],
	[releaseDate],
	[Discount]
	)
VALUES 
-- 10 products for Men (https://missi.com.vn/danh-muc/nuoc-hoa-nam/)
    ('NAUTICA VOYAGE N-83 EDT', 1, 1, '100ml', 19.99, 100, 20, 5, 0, 'images/products/Men/1-1.png', 'images/products/Men/1-2.png',
	N'Nautica Voyage N-83 Eau de Toilette for men là mùi hương mang đến cho bạn cảm giác tươi mát, và yếu tố nam tính và mạnh mẽ của phái mạnh
	. Mở đầu bằng sự kết hợp giữa Hương biển, Tinh dầu lá chanh và Bạc hà, tổ hợp hương thơm trong tầng hương đầu khiến không gian trở nên trong 
	lành và chắc hẳn tầng hương này sẽ giúp những chàng trai thể hiện phong cách phóng khoáng và năng động. Khi tầng hương đầu lắng xuống, bạn sẽ
	cảm thấy sự ấm áp như đang tạo nên một bước cân bằng cảm xúc và gây ấn tượng với những người xung quanh, đó là mùi hương của thảo mộc thư giãn,
	dễ chịu, cùng hương thơm quyến rũ của Lavender. Dù mở đầu bằng sự kết hợp của những notes hương thanh mát, Nautica Voyage N-83 Eau de Toilette 
	lại kết thúc bằng sự nồng nàn, hương thơm trở nên đậm hơn, sâu hơn với Gỗ đàn hương, Gỗ tuyết tùng và Xạ hương.', '2023-11-12',0.7),

    ('JEAN PAUL GAULTIER LE MALE ELIXIR', 2, 1, '125ml', 29.99, 50, 10, 3, 0, 'images/products/Men/2-1.png', 'images/products/Men/2-1.png', N'Vị ngọt làm nên 
	tính cách của Jean Paul Gaultier Le Male Elixir đến từ Vanilla và Mật ong. Vanilla bông phấn mịn màng, quyện cùng Mật ong sánh đặc, tạo nên tông vị mềm 
	mại nhưng vẫn da diết vô cùng. Thuốc lá đến ngay sau đó như khẳng định sự nam tính vẫn ở đó xuyên suốt hành trình mùi hương. 
	Dù "ngọt" là tính từ chính để miêu tả Jean Paul Gaultier Le Male Elixir, thế nhưng ấn nấp trong các tầng hương còn có cả Bạc hà the lạnh, 
	Oải hương đậm đà hương thảo mộc, và cả Đậu tonka khô hăng, ấm áp nữa.', '2023-11-02',0.5),

    ('NAUTICA VOYAGE SPORT EDT', 3, 1, '100ml', 39.99, 75, 15, 3, 0, 'images/products/Men/3-1.png', 'images/products/Men/3-2.png', N'Nautica Voyage Sport mang đậm dấu ấn của phiên bản gốc 2006. Như thể Nautica
	đang kêu gọi chúng ta một lần nữa chèo trên con thuyền Gỗ và bắt lấy những con sóng xanh rì. Lấy cảm hứng từ tinh thần thể thao của những chàng trai, 
	Nautica Voyage Sport công bố là một phiên bản mang đậm vẻ đẹp thể thao, năng động, nơi chúng ta có thể bắt gặp sự tươi mát của biển với nước cam chanh 
	lấp lánh, muối biển và hương gỗ quý. Nautica Voyage Sport hướng đến một người đàn ông năng động, người đảm nhận từng nhiệm vụ và đẩy mạnh giới hạn của chính mình. 
	Anh ấy ngoan cường, thích mạo hiểm. Thành phần mô tả tính cách của anh ấy kết hợp từ vẻ tươi mát của nước, gió, muối của biển. Rau mùi, táo giòn, lá cọ, tiêu xanh, 
	phong lữ, gỗ Brazil, xạ hương gợi cảm, cỏ vetiver thanh lịch và hoắc hương. Hương biển tươi mát và mặn mà là nốt hương chính biểu thị sự hấp dẫn của phiên bản này, 
	đẩy mạnh sắc thái cuồng nhiệt. Sự pha trộn màu xanh lá cây tràn đầy năng lượng của táo, tiêu xanh và lá cọ mô tả sức sống và sức mạnh của một người đàn ông. 
	Một dấu vết hương gỗ-xạ hương mang đến một nét nam tính ấm áp và thanh lịch trong thành phần.', '2016-10-02',0.3),

    ('MONTALE AOUD LEATHER EDP', 4, 1, '100ml', 49.99, 120, 30, 4, 0, 'images/products/Men/4-1.png', 'images/products/Men/4-2.png', N'Montale Aoud Leather khai thác nét đẹp của nốt hư
	ơng Da thuộc, Trầm hương và Nhụy nghệ tây. Nói là các yếu tố mạnh mẽ, nhưng Da thuộc và Trầm hương lại được Montale xử lý rất uyển chuyển trong Aoud Leather, 
	chúng hòa quyện lại với nhau và bổ trợ qua lại một cách thú vị, Da thuộc khô, Trầm hương ẩm bên cạnh cái mùi hương nhẵn mịn như kim loại của Nhụy nghệ tây. Mượt mà
	, êm ái và sẽ làm hài lòng tất cả những ai yêu thích những mùi hương đậm chất phương Đông.', '2023-10-02',0.45),

    ('MOSCHINO TOY BOY', 5, 1, '100ml', 59.99, 80, 25, 5, 0, 'images/products/Men/5-1.png', 'images/products/Men/5-2.png', N'Toy Boy là dòng nước hoa nam của thương hiệu Moschino mới 
	được ra mắt vào năm 2019 và được thiết kế bởi giám đốc sáng tạo Jeremy Scott. Toy Boy diễn giải về một người đàn ông tự tin, năng động, đầy hoài bão và đam mê, nhưng không ngại thể 
	hiện khía cạnh hóm hỉnh và hài hước của bản thân. Được chuyên gia nước hoa hàng đầu Yann Vasnier sáng tạo ra, Moschino Toy Boy thể hiện được đầy đủ sự tinh quái của ông cách tạo hương
	của ông, khi hương đầu là sự kết hợp mới lạ giữa sự tươi mát của Cam bergamot, trái lê và vị ấm nồng của hồng tiêu. Và mặc dù là nước hoa nam, trái tim của Toy Boy lại phủ đầy các note
	hương hoa đầy quyến rũ. Toy Boy thể hiện được sự trầm ngâm và nam tính nhất khi yên vị trên da ở tầng hương cuối, nơi có sự giao thoa mạnh mẽ giữa cỏ Vetiver và hương gỗ Cashmeran. Được
	đánh giá là một chai nước hoa khó phán đoán và xác định được các tầng hương cụ thể, Toy Boy còn gây ấn tượng mạnh với thiết kế đậm chất lạ của Moschino.', '2023-05-02',0.7),
   
   ('JAGUAR CLASSIC BLACK EDT', 6, 1, '100ml', 69.99, 60, 12, 5, 0, 'images/products/Men/6-1.png', 'images/products/Men/6-2.png', N'Sau khi sử dụng, xịt nước hoa lên cơ thể, tránh dùng tay chà xát hoặc làm khô da bằng những vật dụng khác, điều này 
   phá vỡ các tầng hương trong nước hoa, khiến nó có thể thay đổi mùi hương hoặc bay mùi nhanh hơn.', '2009-07-02',0.3),


    ('CAROLINA HERRERA BAD BOY LE PARFUM', 7, 1, '100ml', 79.99, 90, 18, 4, 0,'images/products/Men/7-1.png', 'images/products/Men/7-2.png', N'Carolina Herrera Bad Boy thể hiện rõ nét qua sự quyết đoán, 
	không quá cầu kỳ. Hương thơm nam tính, ngọt ngào vương vấn khó quên đi cùng thiết kế mới lạ độc đáo chắc chắn sẽ khiến các cánh mày râu thích thú.' , '2023-02-02',0.45),

    ('BURBERRY HERO EDP', 8, 1, '100ml', 89.99, 110, 22, 4, 0 ,'images/products/Men/8-1.png', 'images/products/Men/8-2.png', N'Tầng hương cuối được chế ngự bởi Gỗ là gỗ, Tuyết tùng với nét 
	khô đanh đặc trưng, chầm chậm lan toả lên trên làn da, đượm lại một chút tĩnh lặng nơi khứu giác.' , '2022-02-02',0.5),

    ('CALVIN KLEIN CK EVERYONE EDT', 9, 1, '100ml', 99.99, 150, 35, 3, 0,'images/products/Men/9-1.png', 'images/products/Men/9-2.png', N'Như một lựa chọn không thể thiếu với nam giới vào 
	những ngày oi bức, Versace Pour Homme là mùi hương được rất được ưa chuộng cho các anh đang bắt đầu tìm cho mình một mùi hương dễ chịu, dễ gần và đa dụng.' , '2023-09-01',0.7),

    ('JEAN PAUL LE BEAU LE PARFUM', 10, 1, '125ml', 109.99, 70, 14, 5, 0,'images/products/Men/10-1.png', 'images/products/Men/10-2.png', N'Nhiều người tìm đến Creed Aventus không chỉ vì tiếng 
	tăm, mùi hương xuất chúng, mà cũng vì độ đa dụng nữa. Creed Aventus có độ tươi ngọt của trái cây để tỏa sáng vào những ngày hè và cũng nhờ vào hương khói đặc trưng để có thêm độ ấm ấp và
	trấm lắng cho những ngày tiết trời se se lạnh.' , '2021-07-12',0.3),

	-- 10 products for women (https://missi.com.vn/danh-muc/nuoc-hoa-nu/)
	('KILIAN GOOD GIRL GONE BAD', 1, 2, '50ml', 19.99, 100, 20, 4, 0, 'images/products/Women/1-1.png', 'images/products/Women/1-2.png', N'Kilian Good Girl Gone Bad mở đầu bằng hương Hoa Mộc tê
	, một loài hoa đáng yêu đến từ Châu Á, với mùi đặc trưng giống với quả mơ thơm. Tinh tế và ngây thơ, Hoa Mộc tê đem tới Good Girl Gone Bad chút âm hưởng mềm mại của Trái cây, hòa cùng Hoa
	Nhài e ấp dè dặt. Dần dần, sự hiền lành e ấp đó được kéo xuống, bởi bông Huệ gợi cảm, một nét gợi cảm da thịt đặc trưng của loài hoa ngả ngớn này. Nếu như Hoa Mộc và Nhài xuất sắc dệt lên
	một tấm lụa tinh khôi, thì khi này đây, Huệ như mô phỏng lại làn da của một nàng thơ đẹp đẽ.', '2023-05-01',0.7),

    ('KILIAN LOVE DON’T BE SHY EDP', 2, 2, '50ml', 29.99, 50, 10, 5, 0,'images/products/Women/2-1.png', 'images/products/Women/2-2.png', N'Nước hoa có thể bám tốt hay không tốt tùy thuộc vào thời gian, không gian, cơ địa, chế độ sinh hoạt, ăn uốn
	g của bạn, việc sử dụng một loại nước hoa trong thời gian dài có thể khiến bạn bị quen mùi, dẫn đến hiện tượng không nhận biết được mùi hương. Mang theo nước hoa bên mình hoặc tran
	g bị những mẫu mini tiện dụng để giúp bản thân luôn tự tin mọi lúc mọi nơi.' , '2023-05-15',0.5),

    ('LANCOME IDOLE L’INTENSE EDP', 3, 2, '75ml', 39.99, 75, 15, 4, 0,'images/products/Women/3-1.png', 'images/products/Women/3-2.png', N'Viên kim cương mang hương thơm của Xạ hương đến từ 
	Lancome không lộng lẫy, choáng ngợp, mà mềm mại, quyến rũ và hiền hòa trên làn da phái đẹp.', '2019-09-08', 0.45),

    ('GUCCI FLORA GORGEOUS MAGNOLIA', 4, 2, '70ml', 49.99, 120, 30, 4, 0,'images/products/Women/4-1.png', 'images/products/Women/4-2.png', N'Dưới bàn tay ma thuật của nhà Gucci, Hoa mộc lan 
	trong Gucci Flora Gorgeous Magnolia vẫn giữ được nét độc đáo như vậy, nhưng lần này lại nhu mì và "hiền" hơn đôi chút dưới cách tác hợp của Dừa ngọt béo và Hoa nhài quyến rũ. Chút Mâm xôi
	được thêm vào như một nét chấm phá, khiến tổng thể Gorgeous Magnolia có phần mọng nước và "ranh mãnh" hơn.', '2023-08-09',0.7),

    ('GIORGIO ARMANI PRIVE ROSE DARABIE EDP INTENSE', 5, 2, '100ml', 59.99, 80, 25, 4, 0,'images/products/Women/5-1.png', 'images/products/Women/5-2.png', N'Cuối cùng, Ocean di Gioia của Giorgio Armani thu mình lại, gói ghém những giá trị mùi hương vào vỏn
	vẹn 2 nốt hương xạ hương và gỗ đàn hương nhưng để lại trong lòng người mộ điệu những dư âm kéo dài miên man, lưu luyến.', '2020-08-11',0.3),

    ('GUCCI A SONG FOR THE ROSE EDP', 6, 2, '100ml', 69.99, 60, 12, 5, 0,'images/products/Women/6-1.png', 'images/products/Women/6-2.png', N'Là một mùi hương unisex, A Song For The Rose đem 
	tới cho chúng ta một thức thơm trung tính. Nói đơn giản, nếu bạn yêu thích hương Hoa hồng gợi cảm, quyến rũ nhưng phi giới tính, muốn bản thân tỏa ra hương thơm như một bông hồng, thì 
	Gucci A Song For The Rose là lựa chọn dành cho bạn.', '2023-01-11',0.45),

    ('DIOR JOY EAU DE PARFUM INTENSE', 7, 2, '90ml', 79.99, 90, 18, 3, 0, 'images/products/Women/7-1.png', 'images/products/Women/7-2.png', N'JOY by Dior, Eau de Parfum Intense là một hương 
	thơm mới với sự bùng nổ của những bông hoa rạng rỡ, một vệt hương hoa vui tươi mang vẻ đẹp đa chiều. Ánh sáng chói lọi của nhà Cam Chanh (Cam Bergamot và Hoa Cam) ngon ngọt hòa quyện 
	với ánh sáng rực rỡ đầy màu sắc của Hoa Hồng Grasse và hoa Nhài, được nâng cao bởi một âm hưởng gỗ bao bọc của Gỗ Đàn Hương và Xạ Hương đang nhuốm màu Vanilla.', '2019-02-11',0.5),

    ('CAROLINA HERRERA VERY GOOD GIRL GLAM', 8, 2, '80ml', 89.99, 110, 22, 4, 0, 'images/products/Women/8-1.png', 'images/products/Women/8-2.png', N'Tầng hương giữa lại đem đến một cảm giác ngọt ngào nhưng kiêu kỳ, toả sáng bởi sự kết hợp của những loài 
	hoa khác nhau. Hương kem beo béo của Huệ hoà quyện với Hoa nhài Sambac tươi tắn, tất thảy làm nên hương thơm nữ tính nhưng không hề ủy mị, dịu dàng mà vẫn toát lên vẻ thanh lịch của
	Good Girl. Và rồi tầng hương cuối nào là Đậu Tonka, Vanilla hay kẹo Praline làm cho hương thơm béo ngậy, trầm ấm, có chút thoảng Hương Gỗ đầy lắng đọng, vấn vương.', '2023-02-12',0.7),

    ('JO MALONE ORANGE BLOSSOM EAU DE COLOGNE', 9, 2, '30ml', 99.99, 150, 35, 4, 0, 'images/products/Women/9-1.png', 'images/products/Women/9-2.png', N'Dù có phần nhẹ nhàng và quyến rũ, nhưng dường như Calvin Klein Euphoria vẫn không thể phớt lờ cái tôi đầy 
	kiêu kỳ, mãnh liệt. Bằng hơi thở đậm nét phương Đông; Hổ phách, xạ hương và gỗ gụ đã cuộn trào một luồng hương thơm cuồng nhiệt, tìm đến và chinh phục những tâm hồn vô tình chạm phải. 
	Chính sự lan toả của note hương này đã tạo nên chiếc đòn bẫy khiến Calvin Klein Euphoria trở thành niềm kiêu hãnh của những bóng hồng.', '2010-12-17', 0.45),

    ('CALVIN KLEIN CK EVERYONE EDT', 10, 2, '100ml', 109.99, 70, 14, 5, 0, 'images/products/Women/10-1.png', 'images/products/Women/10-2.png', N'Dù có phần nhẹ nhàng và quyến rũ, nhưng dường như Calvin Klein Euphoria vẫn không thể phớt lờ cái tôi đầy 
	kiêu kỳ, mãnh liệt. Bằng hơi thở đậm nét phương Đông; Hổ phách, xạ hương và gỗ gụ đã cuộn trào một luồng hương thơm cuồng nhiệt, tìm đến và chinh phục những tâm hồn vô tình chạm phải. 
	Chính sự lan toả của note hương này đã tạo nên chiếc đòn bẫy khiến Calvin Klein Euphoria trở thành niềm kiêu hãnh của những bóng hồng.', '2005-07-12', 0.3),

	-- 5 products for unisex (https://missi.com.vn/danh-muc/nuoc-hoa-phap/)

	('KILIAN CAN’T STOP LOVING YOU', 1, 4, '50ml', 19.99, 100, 20, 4, 0, 'images/products/Unisex/1-1.png', 'images/products/Unisex/1-2.png', N'Sự ấm áp và nồng nàn từ những môi hôn trao nhau, Xạ Hương Trắng xuất hiện như một đốm lửa loe lói nhưng vô cùng
	mãnh liệt minh chứng cho tình yêu sâu thẳm cùng những cảm xúc khiến cả hai trở nên hòa hợp mãi mãi.','2023-02-11', 0.7),
		
    ('NAUTICA VOYAGE N-83 EDT', 2, 4, '100ml', 29.99, 50, 10, 3, 0, 'images/products/Unisex/2-1.png', 'images/products/Unisex/2-2.png', N'Bỏ lại sau lưng là những thử thách anh đã vượt qua, một chút mùi hương từ Cây Cúc Đại Đóa như một bản tuyên ngôn khẳng định
	những mong muốn cũng như mục tiêu mà anh ta sẽ đánh đổi cả bản thân mình để đạt được.','1992-01-12', 0.45),

    ('JEAN PAUL GAULTIER LE MALE ELIXIR', 3, 4, '75ml', 39.99, 75, 15, 5, 0,'images/products/Unisex/3-1.png', 'images/products/Unisex/3-2.png', N'Cũng như các dòng nước hoa khác của thương hiệu Jean Paul Gaultier
	, Le Beau cũng là một ứng cử viên sáng giá cho những dịp lên đồ đi vào những nơi đông người như Bar/ Pub. Hương thơm ngọt ngào và đầy cuốn hút cùng với độ tỏa mùi tốt của Le Beau chắc chắn mang lại cho anh 
	chàng không những ánh nhìn đầy tò mò mà còn những lời khen ngợi.','2023-01-14', 0),

    ('KILIAN LOVE DON’T BE SHY EDP', 4, 4, '50ml', 49.99, 120, 30, 5, 0,'images/products/Unisex/4-1.png', 'images/products/Unisex/4-2.png', N'Absinthe không trầm tĩnh, mà ngược lại vô cùng sinh động với tông
	vị ngọt ngào dễ chịu, thế nhưng ấn tượng nó gây ra không “dễ thương” một xíu nào. Còn vì sao thì bạn hãy cứ thử một lần để phần nào có cho mình trải nghiệm. Ẩn sau đó là chút hương thảo mộc, hơi khô nhưng
	không hề thô của Cam thảo, quyện cùng chút ngai ngái, tươi mới của Lá hoa tím.','2020-11-14', 0.3),

    ('LANCOME IDOLE L’INTENSE EDP', 5, 4, '75ml', 59.99, 80, 25, 5, 0, 'images/products/Unisex/5-1.png', 'images/products/Unisex/5-2.png', N'Cuối cùng, sự nồng nàn từ tầng hương cuối cùng khiến cô 
	nổi bật nhất giữa chốn đông người, mùi hương từ cây Hoắc Hương và Đậu Tonka khiến người ta phải chủ động hướng về cô như một cách hút hồn ma mị của một loại bùa ngải mang tên Lancome La Vie Est Belle.
	','2023-12-14', 0.7),

	('LANCOME HYPNOSE', 5, 4, '75ml', 59.99, 80, 25, 5, 0, 'images/products/Unisex/6-1.png', 'images/products/Unisex/6-2.png', N'Hypnose của Lancome là một mùi hương theo hướng phương Đông đầy nắng, 
	rừng với sắc thái sành điệu. Hương thơm nổi bật với hoa lạc tiên, tạo nên sự dịu dàng và nồng nàn của nữ giới. Sản phẩm kỳ diệu của hương hoa - vani có mùi thơm và ấm áp trên da và cỏ vetiver được
	bao quanh bởi hoa trắng và hoa nhài Sambac mang đến cảm giác gợi cảm và sâu lắng.','2023-03-14', 0.5),	

	-- 5 products kids (https://missi.com.vn/danh-muc/nuoc-hoa-niche/)
	('LOUIS VUITTON ROSE DES VENTS', 1, 3, '50ml', 19.99, 100, 20, 5, 0,'images/products/Kids/1-1.png', 'images/products/Kids/1-2.png', N'Lôi cuốn và thu hút mọi người bằng sự tinh tế nhưng cũng không kém phần đơn giản, những nốt hương sang trọng từ Da thuộc và
	Trầm hương hiện lên như một điểm đánh đấu sự đặc trưng của toàn bộ tầng hương bên trong. Bay bổng hơn một chút cùng với hương Nhang, những nốt Nhũ hương và Xạ hương xuất hiện như đôi cánh giúp hương 
	thơm của Louis Vuitton Nuit de Feu lan tỏa đi khắp mọi nơi xung quanh mà nó đi tới.', '2009-03-14', 0.7),

    ('LE LABO BERGAMOTE 22 EDP', 2, 3, '50ml', 29.99, 50, 10, 5, 0,'images/products/Kids/2-1.png', 'images/products/Kids/2-2.png', N'Tuy nói là mạnh mẽ, thế nhưng vẫn phải đính chính lại rằng The Matcha 26 vẫn giữ nguyên vẹn sự thanh thoát, pha chút ngon ngót đặc trưng 
	của Matcha. Chỉ khác rằng xung quanh mùi hương ấy được bao bọc bởi Quả sung, Cam đắng, Cỏ hương bài và Tuyết tùng. Tất cả vừa cho thêm vào chút chua ngọt của quả mọng, vừa cho thêm chút khô ráp của Gỗ đê 
	hoà quyện với hương thơm của Matcha.',  '2023-04-14', 0.3),

    ('CREED SILVER MOUNTAIN WATER', 3, 3, '20ml', 39.99, 75, 15, 4, 0, 'images/products/Kids/3-1.png', 'images/products/Kids/3-2.png', N'Đây có lẽ là một mùi hương tốt của Creed, dù cho có bị những cái tên nổi danh khác như Green Irish Tweed hay Aventus che mờ bớt chút, 
	nhưng Silver Mountain Water vẫn sẽ mãi thỏa long được người dùng bất kể khi nào, một hương thơm vượt thời gian.', '2023-12-05', 0.45),

    ('CALVIN KLEIN CK ONE TRAVEL SIZE', 4, 3, '15ml', 49.99, 120, 30, 4, 0, 'images/products/Kids/4-1.png', 'images/products/Kids/4-2.png', N' CK khiến khứu giác trở nên thư giãn và sạch tới bất ngờ. Midnote của CK one là một chợ hoa đêm, với Hoa tím, Hoa nhài hay Hoa 
	linh lan thung lũng, một sự cuốn hút và táo bạo của nhà CK khi đặt trái cây và hương hoa vào cùng với nhau. Tạo nên cảm giác giải nhiệt nhưng đủ gây sự chú ý. Kết thúc bằng hương Gỗ tuyết tùng và Gỗ đàn 
	hương, CK trọn vẹn mùi hương trên da, trên quần áo bạn và sẵn sàng giúp bạn tự tin cho một ngày mới, hãy là số 1, đừng là số 2 với CK one.' ,  '2023-11-15', 0.3),

    ('MARC JACOBS DAISY DREAM MINI SIZE', 5, 3, '15ml', 59.99, 80, 25, 4, 0, 'images/products/Kids/5-1.png', 'images/products/Kids/5-2.png',N'Marc Jacobs Daisy Dream là vậy, tuy vẫn là cô nàng trẻ trung
	và mộng mơ nhưng lại có thừa bản lĩnh của tuổi trưởng thành.', '2023-09-15', 0),
	-- 7 gift set products (https://missi.com.vn/danh-muc/gift-set/)
    ('GIFTSET MISSI LOVE SHOT', 1, 5, '100ml', 9.99, 50, 20, 5, 0, 'images/products/Gift/1-1.png', 'images/products/Gift/1-2.png',
	'Giftset Missi Love Shot gồm 3 mùi đỉnh nhất hiện nay là Delina Parfum De Marly EDP, Le Labo Another 13, Narciso Pure Musc, chai 2ml có vòi xịt.', '2023-04-12',0),
	('SET YSL Y EDP', 2, 5, '100ml', 19.99, 100, 20, 5, 0, 'images/products/Gift/2-1.png', 'images/products/Gift/2-1.png',
	'Set bao gồm: 1 nước hoa fullsize 100ml ,1 chai mini 10ml dạng xịt bỏ túi cực xịn sò', '2023-05-11',0),
	('GIFTSET MISSI ONE MORE', 3, 5, '100ml', 14.99, 90, 15, 5, 0, 'images/products/Gift/3-1.png', 'images/products/Gift/3-2.png',
	'Giftset Missi One More gồm 3 mùi hot nhất của nam hiện nay là: Tomford Ombre Leather, Dior Sauvage Elixir, Chanel Bleu EDP, có 3 chai xịt 2ml..', '2022-12-11',0),
	('SET DIOR NỮ 3 CHAI 5ML – JADORE, JOY, MISS DIOR', 4, 5, '3 chai 5ml', 9.99, 50, 22, 5, 0, 'images/products/Gift/4-1.png', 'images/products/Gift/4-2.png',
	'Set Dior 3 chai chắn cũng sẽ là sự lựa chọn vô cùng tuyệt vời để làm quà tặng cho bạn bè hay người ấy bởi thiết kế vô cùng sang trọng và nhiều mùi nước hoa để chọn lựa cho đi chơi, đi làm hay đi tiệc đều được.', '2023-06-13',0),
	('SET BVLGARI 3 CHAI 15ML', 5, 5, '5ml', 19.99, 80, 25, 5, 0, 'images/products/Gift/5-1.png', 'images/products/Gift/5-1.png',
	'Bộ quà tặng Bvlgari Omnia gồm 3 sản phẩm: Nước hoa Bvlgari Omnia Coral EDT 15ml, Nước hoa Bvlgari Omnia Crystalline EDT 15ml, Nước hoa Bvlgari Omnia Amethyste EDT 15ml', '2023-09-13',0),
	('SET SCANDAL POUR HOMME', 6, 5, '100ml 150ml', 17.99, 70, 30, 5, 0, 'images/products/Gift/6-1.png', 'images/products/Gift/6-2.png',
	'Jean Paul Gaultier Scandal Pour Homme EDT thuộc tông mùi hương ngọt đặc trưng của nước hoa dòng thương hiệu Jean Paul Gaultier. Ngay trong lần xịt đầu tiên, bạn sẽ cảm nhận được mùi hương chua nhẹ nhàng tươi mát của cam quýt. Kết hợp cùng mùi hương tựa thảo mộc, nốt hương xanh của xô thơm. Hương thơm hoà vào nhau đánh thức khứu giác của bạn bởi mùi hương vô cùng nịnh mũi. ', '2022-07-12',0),
	('SET 5 NƯỚC HOA LANCOME PARIS', 6, 5, '5ml 7.5ml 4ml 5ml 5ml', 17.99, 70, 30, 5, 0, 'images/products/Gift/7-1.png', 'images/products/Gift/7-2.png',
	'Bộ Set 5 nước hoa Lancome bao gồm: Nước hoa Lancome Hypnose Eau de Parfum 5ml, Nước hoa Lancome Tresor Eau de Parfum 7.5ml, Nước hoa Lancome La vie est belle Eau de Parfum 4ml, Nước hoa Lancome Miracle Eau de Parfum 5ml, Nước hoa Lancome Tresor in Love Eau de Parfum 5ml ', '2023-08-12',0);

	
