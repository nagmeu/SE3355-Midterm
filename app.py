from flask import Flask, render_template, send_from_directory, request, session
import mysql.connector

app = Flask(__name__)
app.secret_key = "secretkey123"
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Nagme2122",
    database="urunler"
)
app.config['DB_CONNECTION'] = db_connection

get_campaigns_query = "SELECT resim FROM kampanyalar"

get_product_details_query = "SELECT ad, fiyat, aciklama, resim, satici, satici_puani, sehir FROM urunler WHERE id = %s"

get_sehir_query = "SELECT sehir FROM urunler WHERE ad LIKE %s OR kategoriler LIKE %s "
search_query = "SELECT * FROM urunler WHERE ad LIKE %s OR kategoriler LIKE %s"



@app.route('/')
def index():
    cursor = db_connection.cursor()
    cursor.execute(get_campaigns_query)
    campaigns = cursor.fetchall()
    cursor.close()

    return render_template('index.html', campaigns=campaigns)

@app.route('/search')
def search():
    query = request.args.get('query', '')
    session['query'] = query

    cursor = db_connection.cursor()
    cursor.execute("SELECT DISTINCT kategoriler FROM urunler")
    categories = [row[0] for row in cursor.fetchall()]
    cursor.close()

    cursor = db_connection.cursor()
    cursor.execute("SELECT ad, fiyat, resim, id FROM urunler WHERE ad LIKE %s OR kategoriler LIKE %s", ('%' + query + '%', '%' + query + '%'))
    search_results = cursor.fetchall()
    cursor.close()

    return render_template('searchpage.html', categories=categories, query=query, search_results=search_results)

@app.route('/apply_filters', methods=['GET', 'POST'])
def apply_filters():
    search_term = request.json.get('query', '')
    selected_city = request.json.get('selected_city')
    print("Seçilen şehir:", selected_city)


    # Hata kontrolü
    if not selected_city:
        return "Şehir seçimi yapılmadı.", 400

    cursor = db_connection.cursor()
    
    # Filtrelenmiş sonuçları tutmak için bir liste oluşturalım
    filtered_results = []
    cursor = db_connection.cursor()

    search_query = """
    SELECT ad, fiyat, resim, id FROM urunler WHERE sehir = 'İstanbul' AND (ad LIKE %s OR kategoriler LIKE %s)", ('%' + search_term + '%', '%' + search_term + '%'
    """

    cursor.execute(search_query, ('%' + search_term + '%', '%' + search_term + '%'))
    
    cursor.close()
    return render_template('searchpage.html', filtered_results=filtered_results)



@app.route('/product/<int:product_id>')
def product_details(product_id):
    cursor = db_connection.cursor()
    cursor.execute(get_product_details_query, (product_id,))
    product_details = cursor.fetchone()
    cursor.close()

    return render_template('product_details.html', product_name=product_details[0], product_price=product_details[1], product_description=product_details[2], product_image=product_details[3], seller_name=product_details[4], seller_rating=product_details[5])

@app.route('/images/<path:filename>')
def get_image(filename):
    return send_from_directory('images', filename)

if __name__ == '__main__':
    app.run(debug=True)