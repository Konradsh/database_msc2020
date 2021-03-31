SELECT round(((SELECT count(id) FROM customer WHERE customer.pesel IS NOT null AND 
customer.nip IS null)/count(id))*100,1) as procent from customer;