SELECT offer.product_id FROM product INNER JOIN offer ON product.id = offer.product_id INNER JOIN 
offer_customer ON offer.id = offer_customer.offer_id INNER JOIN sale ON 
offer_customer.id = sale.offer_customer_id GROUP BY offer.product_id
ORDER BY Count(sale.id) DESC limit 1;