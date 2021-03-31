SELECT Count(sale.id)  FROM offer INNER JOIN (offer_customer INNER JOIN sale ON 
offer_customer.id = sale.offer_customer_id) ON offer.id = offer_customer.offer_id WHERE 
transaction_date=offer.end_date;