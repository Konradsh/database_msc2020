SELECT offer.product_id, offer.regular_price, sale.transaction_date FROM offer 
INNER JOIN offer_customer ON offer.id = offer_customer.offer_id INNER JOIN sale 
ON offer_customer.id = sale.offer_customer_id WHERE offer.regular_price=offer_Price AND 
sale.transaction_date=offer.start_date ORDER BY offer.offer_price DESC;