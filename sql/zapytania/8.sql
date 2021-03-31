SELECT round(Avg(offer.offer_price),3) AS Średnia FROM (offer INNER JOIN offer_customer ON 
offer.id = offer_customer.offer_id) INNER JOIN sale ON 
offer_customer.id = sale.offer_customer_id WHERE offer.id=offer_customer.offer_id;