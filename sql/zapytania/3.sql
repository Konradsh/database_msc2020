SELECT  customer.id, first_name, last_name, Count(sale.id) FROM (customer INNER JOIN 
offer_customer ON customer.id = offer_customer.customer_id) 
INNER JOIN sale ON offer_customer.id = sale.offer_customer_id 
GROUP BY customer.id, customer.first_name, customer.last_name 
ORDER BY Count(sale.id) desc, last_name desc limit 1;