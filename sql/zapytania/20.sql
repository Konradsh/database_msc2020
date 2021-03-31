/*WITH SELECT offer_customer.customer_id, Sum(offer.offer_price) AS Suma.offer_price FROM 
offer INNER JOIN offer_customer ON offer.id = offer_customer.offer_id GROUP BY 
offer_customer.customer_id HAVING Sum(offer.offer_price)> (SELECT Sum(offer.offer_price) AS 
SumaOfoffer_price FROM offer INNER JOIN (customer INNER JOIN offer_customer ON 
customer.id = offer_customer.customer_id) ON offer.id = offer_customer.offer_id 
GROUP BY customer.nip HAVING customer.nip Like "1000000000"*/


WITH sumaKlient AS (SELECT SUM(offer.offer_price) AS klient from sale INNER JOIN offer_customer ON 
sale.offer_customer_id = offer_customer.id INNER JOIN offer ON 
offer_customer.offer_id = offer.id INNER JOIN customer ON 
offer_customer.customer_id = customer.id WHERE customer.nip=1000000000)

WITH sumaKlienci AS (SELECT SUM(offer.offer_price) from sale INNER JOIN offer_customer ON 
sale.offer_customer_id = offer_customer.id INNER JOIN offer ON 
offer_customer.offer_id = offer.id INNER JOIN customer ON 
offer_customer.customer_id = customer.id WHERE EXISTS(SELECT * FROM sale))


SELECT SUM(offer.offer_price) from sale INNER JOIN offer_customer ON 
sale.offer_customer_id = offer_customer.id INNER JOIN offer ON 
offer_customer.offer_id = offer.id INNER JOIN customer ON 
offer_customer.customer_id = customer.id WHERE EXISTS(SELECT * FROM sale))

SELECT SUM(klienci.wiecej) AS WydaliWięcej, SUM(klienci.mniej) AS WydaliMniej FROM (
	SELECT CASE WHEN (SELECT klient FROM sumaKlient LIMIT 1) < sumaKlienci THEN 1 ELSE 0 END AS wiecej, CASE WHEN (SELECT klient FROM sumaKlient LIMIT 1) > sumaKlienci THEN 1 ELSE 0 END AS mniej
	from sumaKlienci INNER JOIN sale ON sumaKlient.customer_id = sale.customer_id
    INNER JOIN offer_customer ON 
    sale.offer_customer_id = offer_customer.id INNER JOIN offer ON 
    offer_customer.offer_id = offer.id INNER JOIN customer ON 
    offer_customer.customer_id = customer.id GROUP BY customer.nip
) AS klienci

WHERE EXISTS 


WITH tenNip AS ( SELECT SUM(offer.offer_price) AS tenJedyny FROM customer INNER JOIN offer_customer ON offer_customer.customer_id = customer.id INNER JOIN offer ON 
offer_customer.offer_id = offer.id WHERE customer.nip = 1000000000 )

WITH tenNip AS ( SELECT SUM(offer.offer_price) AS tenJedyny FROM customer INNER JOIN offer_customer ON offer_customer.customer_id = customer.id INNER JOIN offer ON 
offer_customer.offer_id = offer.id INNER JOIN sale ON offer_customer.id = sale.offer_customer_id WHERE EXISTS(SELECT * FROM sale))

SELECT SUM(moreLess.wiecej) AS wiecej, SUM(moreLess.mniej) AS 
mniej FROM ( SELECT CASE WHEN (SELECT tenJedyny FROM tenNip LIMIT 1) < SUM(offer.offer_price) THEN 1 ELSE 0 END AS wiecej, 
CASE WHEN (SELECT tenJedyny FROM tenNip LIMIT 1) > SUM(offer.offer_price) THEN 1 ELSE 0 END AS mniej FROM customer INNER JOIN offer_customer ON 
offer_customer.customer_id = customer.id INNER JOIN offer ON offer_customer.offer_id = offer.id GROUP BY customer.nip ) AS moreLess







14123p412p54234525


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