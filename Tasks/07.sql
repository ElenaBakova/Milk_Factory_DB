-- Количество заказов каждого сырья с сортировкой по возрастанию
SELECT Product.Name, COUNT(Client_Order.Order_ID) AS Order_Amount FROM Product, Client_Order
  WHERE Product.Product_ID = Client_Order.Product_ID
    GROUP BY Product.Name
      ORDER BY Order_Amount ASC;