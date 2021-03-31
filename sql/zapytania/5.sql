SELECT customer.id, city, value, customer.invoice_address_id FROM product_category INNER JOIN 
(product INNER JOIN (offer INNER JOIN ((address INNER JOIN customer ON 
(address.id = customer.shipment_address_id) AND (address.id = customer.invoice_address_id)) 
INNER JOIN offer_customer ON customer.id = offer_customer.customer_id) ON 
offer.id = offer_customer.offer_id) ON product.id = offer.product_id) ON 
product_category.id = product.category_id WHERE 
address.city Like "Kraków" AND product_category.value Like "hardware";