-------------------------------------------------------------------------------------------------
-- Общее количество заказов от клиентов (название клиента, количество)
-------------------------------------------------------------------------------------------------
CREATE VIEW V_Client_Order_Amount (ID, Name, Amount)
AS
SELECT Client.Client_ID, Client.Name, COUNT(*) FROM Client_Order
  JOIN Client ON Client.Client_ID = Client_Order.Client_ID
    GROUP BY Client.Name, Client.Client_ID;

-- DROP VIEW V_Client_Order_Amount