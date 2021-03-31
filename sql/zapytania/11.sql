SELECT Count(offer_customer.offer_id) AS transakcji FROM (customer INNER JOIN 
offer_customer ON customer.id = offer_customer.customer_id) INNER JOIN sale ON 
offer_customer.id = sale.offer_customer_id where year(sale.transaction_date)=2019 and 
customer.invoice_address_id<>customer.shipment_address_id 
GROUP BY customer.id having Count(sale.id)>=3;