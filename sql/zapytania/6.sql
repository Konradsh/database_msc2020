SELECT customer.id FROM (product_category INNER JOIN (product INNER JOIN 
(offer INNER JOIN ((address INNER JOIN customer ON (address.id = customer.shipment_address_id) AND 
(address.id = customer.invoice_address_id)) INNER JOIN offer_customer ON 
customer.id = offer_customer.customer_id) ON offer.id = offer_customer.offer_id) ON 
product.id = offer.product_id) ON product_category.id = product.category_id) INNER JOIN sale ON 
offer_customer.id = sale.offer_customer_id WHERE city in ( "Warszawa", "Wrocław") AND 
value in ( "hardware", "licencja_rok") and year(transaction_date)<2018;