SELECT round(Avg(offer.offer_price),2) FROM offer INNER JOIN 
((address INNER JOIN customer ON (address.id = customer.shipment_address_id) AND 
(address.id = customer.invoice_address_id)) INNER JOIN offer_customer ON 
customer.id = offer_customer.customer_id) ON offer.id = offer_customer.offer_id WHERE 
offer_price<0.9*offer.regular_price AND city Like "Kraków";