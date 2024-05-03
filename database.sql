	drop database urunler;
	create database urunler;
	use urunler;

	-- urunler tablosunu oluştur
	CREATE TABLE urunler (
		id INT AUTO_INCREMENT PRIMARY KEY,
		kategoriler VARCHAR(255),
		ad VARCHAR(255),
		aciklama TEXT,
		fiyat VARCHAR(255),
		resim VARCHAR(255),
		renkler VARCHAR(255),
		item_id INT,
        satici VARCHAR(255),
        satici_puani float,
        sehir TEXT
	);

	-- kampanyalar tablosunu oluştur
	CREATE TABLE kampanyalar (
		id INT AUTO_INCREMENT PRIMARY KEY,
		resim VARCHAR(255)
	);


	-- urunler tablosuna veri ekle
	INSERT INTO urunler(kategoriler, ad, aciklama, fiyat, resim, renkler, item_id, satici, satici_puani, sehir) VALUES
	('Elektronik', 'Akıllı Telefon', 'Yüksek performanslı akıllı telefon', '1000.00 ₺', 'telefon.jpg', 'Siyah, Beyaz, Altın', 1, 'Teknoloji Dükkanı', 9.1, 'Ankara'),
	('Elektronik', 'Laptop Bilgisayar', 'Taşınabilir laptop bilgisayar', '1500.00 ₺', 'laptop.jpg', 'Siyah, Gri', 2, 'Akıllı Teknoloji', 5.2, 'İzmir'),
	('Elektronik', 'Kablosuz Kulaklık', 'Bluetooth bağlantılı kablosuz kulaklık', '50.00 ₺', 'kulaklik.jpg', 'Siyah, Beyaz, Kırmızı', 3, 'İnovatif Elektronik', 3.7, 'İstanbul'),
	('Elektronik', 'Akıllı Saat', 'Sağlık ve spor takibi için akıllı saat', '200.00 ₺', 'saat.jpg', 'Siyah, Gri', 4, 'Trendy Mağaza', 7.4,'İzmir'),
	('Moda', 'Kadın Elbise', 'Yazlık kadın elbisesi', '50.00 ₺', 'elbise.jpg', 'Mavi, Sarı, Pembe', 5, 'Moda Trendleri', 5.6, 'Ankara'),
	('Moda', 'Erkek Gömlek', 'Keten erkek gömlek', '30.00 ₺', 'gomlek.jpg', 'Beyaz, Mavi, Gri', 6, 'Stil Mağazası', 7.8, 'Ankara'),
	('Moda', 'Kadın Ayakkabı', 'Topuklu kadın ayakkabısı', '80.00 ₺', 'ayakkabi.jpg', 'Siyah, Kırmızı', 7, 'Şık Gardrop', 7.9,'İzmir'),
	('Moda', 'Erkek Pantolon', 'Klasik erkek pantolon', '40.00 ₺', 'pantolon.jpg', 'Siyah, Gri', 8, 'Ev Dekorasyonu', 4.9,'İstanbul'),
	('Ev, Yaşam, Kırtasiye, Ofis', 'Çalışma Masası', 'Modern tasarımlı çalışma masası', '200.00 ₺', 'masa.jpg', 'Beyaz, Ahşap', 9, 'Ev Mobilyaları', 10,'İstanbul'),
	('Ev, Yaşam, Kırtasiye, Ofis', 'Defter Seti', 'Renkli defter seti', '10.00 ₺', 'defter.jpg', 'Mavi, Pembe, Sarı',10, 'Dekor ABC', 9.1,'İstanbul'),
	('Ev, Yaşam, Kırtasiye, Ofis', 'Ofis Koltuğu', 'Rahat ofis koltuğu', '150.00 ₺', 'koltuk.jpg', 'Siyah, Gri', 11, 'Dekor BCD', 8.7,'İzmir'),
	('Ev, Yaşam, Kırtasiye, Ofis', 'Kırtasiye Seti', 'Kalem, silgi ve cetvel içeren kırtasiye seti', '15.00 ₺', 'kirtasiye.jpg', 'Renkli', 12, 'Kırtasiye Dükkanım', 4.6,'İstanbul'),
	('Oto, Bahçe, Yapı Market', 'Bahçe Makası', 'Paslanmaz çelik bahçe makası', '20.00 ₺', 'makas.jpg', NULL, 13, 'Bahçeye Dair Her Şey 2', 8.8,'İstanbul'),
	('Oto, Bahçe, Yapı Market', 'Sulama Hortumu', 'Dayanıklı sulama hortumu', '15.00 ₺', 'hortum.jpg', 'Yeşil', 14, 'Bahçe Eşyaları',8.8,'Ankara'),
	('Oto, Bahçe, Yapı Market', 'Araba Şampuanı', 'Araba temizliği için özel şampuan', '8.00 ₺', 'sampuan.jpg', NULL, 15, 'Arabaya Dair',8.9,'İzmir'),
	('Oto, Bahçe, Yapı Market', 'Bahçe Tırmığı', 'Ahşap saplı bahçe tırmığı', '12.00 ₺', 'tirmik.jpg', 'Kahverengi',16, 'Bahçe Aletlerim',9.0,'Ankara'),
	('Anne, Bebek, Oyuncak', 'Bebek Beşiği', 'Ahşap bebek beşiği', '100.00 ₺', 'besik.jpg', 'Beyaz, Kahverengi',17, 'Bebek Mobilyam',9.7,'İstanbul'),
	('Anne, Bebek, Oyuncak', 'Oyuncak Araba Seti', 'Renkli oyuncak araba seti', '25.00 ₺', 'araba.jpg', 'Mavi, Kırmızı, Sarı',18, 'Oyuncakçım',8.5,'İzmir'),
	('Anne, Bebek, Oyuncak', 'Bebek Yeleği', 'Yumuşak ve rahat bebek yeleği', '15.00 ₺', 'yelek.jpg', 'Mavi, Pembe',19, 'Cici Bebe',9.6,'İstanbul'),
	('Anne, Bebek, Oyuncak', 'Oyuncak Peluş Ayı', 'Sevimli peluş ayı', '10.00 ₺', 'ayi.jpg', 'Kahverengi',20, 'Oyuncakçım',8.1,'İstanbul'),
	('Spor, Outdoor', 'Yoga Matı', 'Anti-kayma yoga matı', '20.00 ₺', 'yogamat.jpg', 'Mor, Mavi, Yeşil', 21, 'Yoga Mağazası',7.5,'Ankara'),
	('Spor, Outdoor', 'Kamp Çadırı', '2 kişilik su geçirmez kamp çadırı', '50.00 ₺', 'cadir.jpg', 'Yeşil, Mavi', 22, 'Kamp Dükkanı',6.5,'İzmir'),
	('Spor, Outdoor', 'Bisiklet', 'Şehir bisikleti', '300.00 ₺', 'bisiklet.jpg', 'Siyah, Beyaz', 23, 'Can Bisiklet',7.5,'Ankara'),
	('Spor, Outdoor', 'Koşu Ayakkabısı', 'Hafif ve esnek koşu ayakkabısı', '80.00 ₺', 'ayakkabi.jpg', 'Siyah, Gri',24, 'Ayşe Ayakkabı',6.9,'İstanbul'),
	('Kozmetik, Kişisel Bakım', 'Makyaj Fırça Seti', 'Profesyonel makyaj fırça seti', '30.00 ₺', 'fircaseti.jpg', 'Pembe, Siyah',25, 'Fulya Kozmetik',8.8,'İzmir'),
	('Kozmetik, Kişisel Bakım', 'Güneş Kremi', 'SPF 50 güneş kremi', '15.00 ₺', 'guneskremi.jpg', NULL,26, 'Fulya Kozmetik',8.8,'İstanbul'),
	('Kozmetik, Kişisel Bakım', 'Nemlendirici Losyon', 'Cilt için nemlendirici losyon', '10.00 ₺', 'losyon.jpg', NULL,27, 'Fulya Kozmetik',8.8,'Ankara'),
	('Kozmetik, Kişisel Bakım', 'Saç Bakım Yağı', 'Doğal saç bakım yağı', '12.00 ₺', 'sacbakim.jpg', NULL,28,'Fulya Kozmetik',8.9,'İstanbul'),
	('Süpermarket, Pet Shop', 'Kedi Maması', 'Balıklı kedi maması', '5.00 ₺', 'mama.jpg', NULL,29, 'Mocha Pet Shop',8.4,'İstanbul'),
	('Süpermarket, Pet Shop', 'Köpek Oyuncağı', 'Dayanıklı ve çiğneme dayanıklı köpek oyuncağı', '8.00 ₺', 'oyuncak.jpg', 'Mavi, Sarı',30, 'Mocha Pet Shop', 8.4,'İstanbul'),
	('Süpermarket, Pet Shop', 'Kuş Kafesi', 'Metal kuş kafesi', '20.00 ₺', 'kafes.jpg', 'Siyah',31, 'Mocha Pet Shop',8.6,'Ankara'),
	('Süpermarket, Pet Shop', 'Balık Tankı', 'Plastik balık tankı', '15.00 ₺', 'tank.jpg', 'Beyaz, Mavi',32, 'Mocha Pet Shop',8.6,'İstanbul'),
	('Kitap, Müzik, Hobi, Film', 'Jojo Moyes - Senden Önce Ben', 'En çok satan roman kitabı', '10.00 ₺', 'kitap.jpg', NULL,33, 'AB Kitapçılık', 8.6,'İzmir'),
	('Kitap, Müzik, Hobi, Film', 'Müzik CD', 'Yeni çıkan albüm', '15.00 ₺', 'cd.jpg', NULL,34, 'AB Kitapçılık',8.1,'İstanbul'),
	('Kitap, Müzik, Hobi, Film', 'Boya Seti', 'Profesyonel boya seti', '25.00 ₺', 'boya.jpg', 'Farklı renkler',35, 'AB Kırtasiye', 8.1,'İstanbul'),
	('Kitap, Müzik, Hobi, Film', 'Film DVD', 'Popüler film', '12.00 ₺', 'film.jpg', NULL,36, 'AB Kitapçılık', 8.1,'İzmir');

	-- kampanyalar tablosuna veri ekle
	INSERT INTO kampanyalar (resim) VALUES
	('kampanya1.png'),
	('kampanya2.png'),
	('kampanya3.png'),
	('kampanya4.png'),
	('kampanya5.png');


