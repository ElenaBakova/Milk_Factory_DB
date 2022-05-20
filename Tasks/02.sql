-- (02) Клиенты, не сделавшие за прошлый год ни одного заказа
SELECT Client.Name FROM Client, Client_Order
	WHERE NOT EXISTS 
		(SELECT Client_Order.Client_ID, YEAR(Client_Order.Date_Order) 
		  FROM Client_Order WHERE YEAR(Client_Order.Date_Order) = '2021')
	GROUP BY Client.Name