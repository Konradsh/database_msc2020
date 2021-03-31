SELECT CASE when customer.nip IS not null THEN customer.nip ELSE customer.pesel END as 
nipesel, Count(offer_customer.offer_id) as ofert FROM customer INNER JOIN 
offer_customer ON customer.id = offer_customer.customer_id GROUP BY nipesel 
HAVING Count(offer_customer.offer_id) >= (SELECT Count(offer_customer.offer_id) AS 
PoliczOfoffer_id FROM offer_customer GROUP BY offer_customer.customer_id ORDER BY 
Count(offer_customer.offer_id) limit 1 )+20 order by nipesel DESC;