SELECT customer.last_name, CASE when customer.nip IS not null THEN customer.nip ELSE customer.pesel END as 
nipesel FROM offer INNER JOIN (customer INNER JOIN offer_customer ON customer.id = offer_customer.customer_id) 
ON offer.id = offer_customer.offer_id WHERE offer.offer_price<0.8*regular_price order by nip, pesel;