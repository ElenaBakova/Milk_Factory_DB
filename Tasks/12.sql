-- (12) Компании, заказывающие продукты в стеклянной упаковке
SELECT Client.Name FROM Client
  WHERE Client.Client_ID IN (
    SELECT Client_Order.Client_ID FROM Client_Order, Product
      WHERE Product.Product_ID = Client_Order.Product_ID
      AND Client_Order.Product_ID IN (SELECT ID FROM V_Glass_Package));