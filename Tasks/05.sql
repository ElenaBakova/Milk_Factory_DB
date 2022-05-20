-- (05) Продукты, которые ни разу не были заказаны
	SELECT Product.Product_ID, Name FROM Product
	WHERE Product.Product_ID NOT IN (SELECT Product_ID FROM Client_Order)