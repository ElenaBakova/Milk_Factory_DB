-------------------------------------------------------------------------------------------------
-- Общее количество заказов от клиентов (название клиента, количество)
-------------------------------------------------------------------------------------------------
CREATE VIEW V_Client_Order_Amount (Name, Amount)
AS
SELECT Client.Name, COUNT(*) FROM Client_Order
  JOIN Client ON Client.Client_ID = Client_Order.Client_ID
    GROUP BY Client.Name;

-- DROP VIEW V_Client_Order_Amount