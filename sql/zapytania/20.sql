


WITH sumaKlient AS (SELECT SUM(offer.offer_price) AS klient from sale INNER JOIN offer_customer ON sale.offer_customer_id = offer_customer.id 
INNER JOIN offer ON offer_customer.offer_id = offer.id INNER JOIN customer ON offer_customer.customer_id = customer.id WHERE customer.nip=1000000000)


WITH sumaKlienci AS (SELECT SUM(offer.offer_price) from sale INNER JOIN offer_customer ON 
sale.offer_customer_id = offer_customer.id INNER JOIN offer ON offer_customer.offer_id = offer.id INNER JOIN 
customer ON offer_customer.customer_id = customer.id WHERE EXISTS(SELECT * FROM sale) GROUP BY customer.id)

SELECT SUM(klienci.wiecej) AS WydaliWięcej, SUM(klienci.mniej) AS WydaliMniej FROM (
	SELECT CASE WHEN (SELECT klient FROM sumaKlient LIMIT 1) < sumaKlienci THEN 1 ELSE 0 END AS wiecej, CASE WHEN (SELECT klient FROM sumaKlient LIMIT 1) > sumaKlienci THEN 1 ELSE 0 END AS mniej
	from sumaKlienci INNER JOIN sale ON sumaKlient.customer_id = sale.customer_id
    INNER JOIN offer_customer ON 
    sale.offer_customer_id = offer_customer.id INNER JOIN offer ON 
    offer_customer.offer_id = offer.id INNER JOIN customer ON 
    offer_customer.customer_id = customer.id GROUP BY customer.nip
) AS klienci