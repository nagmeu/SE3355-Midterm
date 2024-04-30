# SE3355-Midterm

https://drive.google.com/file/d/1U0DCPPTkjtuBl6W8XKJtytaKsJqdOat2/view

https://nagmeugurtan.pythonanywhere.com/

I've attached the link to my web design video. I thought it would be more appropriate to share the video since when deployed via Python Anywhere, it gives an Internal Server Error after a while and needs to be reloaded to function properly.

I used a MySQL database to store my data. I have two different tables for products and campaigns. My products table consists of attributes such as categories, name, description, price, image, colors, item_id, seller, seller_rating, city. My campaigns table only consists of id and image attributes. To avoid hardcoding images, I stored them in the records of the respective tables in the database. This way, I can access both my database and product images, campaigns, and similar images with Flask.

As shown in the video, I can access products belonging to categories both on my homepage and on the search page by clicking on categories. Also, when I click on the site name, I can easily return to the homepage. Additionally, when I type the name or category of my product into the search bar, the products can still be viewed. I can also access the details of the products by clicking on the product image or name.

When I reach the details page, I can see the name of the product, its price, and other details. I also stored the seller's information and seller rating in the database. When I hover over the seller's name or the "view campaigns" section, a cursor appears, but it doesn't lead anywhere as those pages aren't implemented yet.

I have three HTML pages in my templates; index, search page, and details.

The "tomorrow at my door" section specifies the city, and by checking the "tomorrow at my door" option, it works. I added a "tomorrow at my door city" attribute to the database for each product because I thought the product needed to be in that city for it to be delivered tomorrow at my door.

I used HTML, CSS, Javascript for frontend and Flask for backend part.
