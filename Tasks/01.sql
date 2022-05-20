-- (01) Данные о клиентах, включая количество заказов
SELECT V_Client_Order_Amount.Name, V_Client_Order_Amount.Amount, Client.Address FROM V_Client_Order_Amount
JOIN Client ON V_Client_Order_Amount.ID = Client.Client_ID
    GROUP BY V_Client_Order_Amount.Name, V_Client_Order_Amount.Amount, Client.Address