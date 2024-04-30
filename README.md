# SE3355-Midterm

https://drive.google.com/file/d/1U0DCPPTkjtuBl6W8XKJtytaKsJqdOat2/view

https://nagmeugurtan.pythonanywhere.com/

Web tasarım video linkim ektedir. Python Anywhere üzerinden deploy ettiğimiz zaman bir süre sonra Internal Server Error verdiği ve düzgün çalışması için tekrar load edilmesi gerektiği için video atmamın daha uygun olacağını düşündüm. 

Verilerimi tutmak için MySQL database'i kullandım. Ürünler ve kampanyalar için iki farklı tablom var. Ürünler tablom kategoriler, ad, aciklama, fiyat, resim, renkler, item_id, satici, satici_puani, sehir attribute'larından oluşuyor. Kampanyalar tablom ise yalnızca id ve resim attributelarından oluşmakta. 

Resimlerin hard coded olmaması adına database'de ilgili tabloların kayıtlarında tuttum. Böylece flask ile veri tabanıma ve ürün fotoğrafları, kampanyalar gibi fotoğraflara ulaşabiliyorum. 

Videoda gösterdiğim üzere hem ana sayfam hem de search page üzerinden kategorilere basarak o kategorilere ait ürünlere erişim sağlayabiliyorum. Aynı zamanda, site adımıza bastığımızda ana sayfaya kolayca geri dönebiliyoruz. Ayrıca, search kısmına ürünümün adını veya kategorisini yazdığımda ürünler yine görülebilmekte. Ürünlerin detayına da ürün fotoğrafı ve ürün adı üzerine tıklayarak ulaşım sağlayabiliyorum. 

Detaylar sayfasına geldiğimde ürünün adı, fiyatı ve kalan detayları görüyoruz. Ürünün satıcısı ve satıcı puanını yine database üzerinde tuttum. Satıcının adının üzerine ya da kampanyaları gör kısmının üzerine geldiğimizde cursor çıkıyor ancak o sayfalar olmadığı için bir yere iletmiyor. 

Templates üzerinde 3 html sayfam var; index, search page ve details. 

Yarın kapımda kısmı şehir ve yarın kapımda kısımlarını işaretleyerek çalışmakta. Her ürün için bir yarın kapımda şehirini attribute olarak database'de belirttim çünkü yarın kapımda olabilmesi için ürünün o şehirde olması gerektiğini düşündüm. 

