SELECT count(customer.id) as licz_adresow FROM address INNER JOIN customer ON 
(address.id = customer.shipment_address_id) AND (address.id = customer.invoice_address_id) WHERE 
customer.shipment_address_id=invoice_address_id;