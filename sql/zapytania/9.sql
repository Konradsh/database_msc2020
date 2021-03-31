SELECT Avg(offer.offer_price) FROM offer INNER JOIN 
((address INNER JOIN (customer INNER JOIN offer_customer ON customer.id = offer_customer.customer_id) ON 
(address.id = customer.invoice_address_id) AND (address.id = customer.shipment_address_id)) INNER JOIN 
sale ON offer_customer.id = sale.offer_customer_id) ON offer.id = offer_customer.offer_id WHERE 
offer_customer.offer_id=offer.id AND city Like "Kraków";