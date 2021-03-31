SELECT distinct customer.id, first_name, last_name, value FROM (product_category INNER JOIN 
product ON product_category.id = product.category_id) INNER JOIN 
(offer INNER JOIN (customer INNER JOIN offer_customer ON 
customer.id = offer_customer.customer_id) ON offer.id = offer_customer.offer_id) ON
 product.id = offer.product_id WHERE value in( "hardware", "licencja_rok", "licencja_3");