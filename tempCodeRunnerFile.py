from flask import Flask, render_template, send_from_directory, request, redirect, url_for, session
import mysql.connector

app = Flask(__name__)

# Veritabanı bağlantısı kurulacak
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",  # Kullanıcı adınızı buraya girin
    password="Nagme2122",  # Şifrenizi buraya girin
    database="urunler"
)
app.config['DB_CONNECTION'] = db_connection

# Kampanya fotoğraflarını getiren SQL sorgusu
get_campaigns_query = "SELECT resim FROM kampanyalar"

# Ürün detayları için SQL sorgusu
get_product_details_query = "SELECT ad, fiyat, aciklama, resim, satici, satici_puani FROM urunler WHERE id = %s"

# Ürün araması için SQL sorgusu
search_query = "SELECT * FROM urunler WHERE ad LIKE %s OR kategoriler LIKE %s"
@app.route('/')
def index():
    # Kampanya fotoğraflarını veritabanından al
    cursor = db_connection.cursor()
    cursor.execute(get_campaigns_query)
    campaigns = cursor.fetchall()
    cursor.close()

    # Alınan fotoğrafları HTML şablonuna gönder
    return render_template('index.html', campaigns=campaigns)

# Şehirleri almak için SQL sorgusu
@app.route('/apply_filter', methods=['POST'])
def apply_filter():
    # Yapılan arama sorgusunu al
    query = request.form.get('query')

    # Yarın kapımda seçeneği kontrol ediliyor
    if 'nextDayDelivery' in request.form:
        session['nextDayDelivery'] = True
    else:
        session.pop('nextDayDelivery', None)

    # Seçilen şehir
    selected_city = request.form.get('selectedCity')
    if selected_city:
        session['selectedCity'] = selected_city
    else:
        session.pop('selectedCity', None)

    redirect(url_for('search', query=query))

@app.route('/search')
def search():
    query = request.args.get('query')

    # Kategorileri al
    cursor = db_connection.cursor()
    cursor.execute("SELECT DISTINCT kategoriler FROM urunler")
    categories = [row[0] for row in cursor.fetchall()]
    cursor.close()

    # Şehirleri al
    cursor = db_connection.cursor()
    get_cities_query = "SELECT DISTINCT sehir_ismi FROM hizli_teslimat"
    cursor.execute(get_cities_query)  
    cities = [row[0] for row in cursor.fetchall()]
    cursor.close()

    # Yarın kapımda seçeneği kontrol ediliyor
    next_day_delivery = session.get('nextDayDelivery')

    # Seçilen şehir
    selected_city = session.get('selectedCity')

    # Filtreleme SQL sorgusu oluşturuluyor
    if next_day_delivery and selected_city:
        filter_query = "SELECT urunler.ad, urunler.fiyat, urunler.resim, urunler.id FROM urunler JOIN hizli_teslimat ON urunler.id = hizli_teslimat.item_id WHERE hizli_teslimat.sehir_ismi = %s AND hizli_teslimat.hizli_teslimat_durumu = 1"
        cursor = db_connection.cursor()
        cursor.execute(filter_query, (selected_city,))
        search_results = cursor.fetchall()
        cursor.close()
    else:
        # Ürünleri ara
        cursor = db_connection.cursor()
        cursor.execute("SELECT ad, fiyat, resim, id FROM urunler WHERE ad LIKE %s OR kategoriler LIKE %s", ('%' + query + '%', '%' + query + '%'))
        search_results = cursor.fetchall()
        cursor.close()
    
    return render_template('searchpage.html', categories=categories, cities=cities, query=query, search_results=search_results)

@app.route('/product/<int:product_id>')
def product_details(product_id):
    # Ürün detaylarını al
    cursor = db_connection.cursor()
    cursor.execute(get_product_details_query, (product_id,))
    product_details = cursor.fetchone()
    cursor.close()

    # Alınan detayları HTML şablonuna gönder
    return render_template('product_details.html', product_name=product_details[0], product_price=product_details[1], product_description=product_details[2], product_image=product_details[3], seller_name=product_details[4], seller_rating=product_details[5])
    
@app.route('/images/<path:filename>')
def get_image(filename):
    return send_from_directory('images', filename)

if __name__ == '__main__':
    app.run(debug=True)