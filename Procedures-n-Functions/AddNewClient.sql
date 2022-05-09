-----------------------------------------------------------------------------------------------------------------------------------------------------
--  Добавление нового клиента
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE AddNewClient
@var_name AS CHAR(15),
@var_address AS CHAR(100)
AS
BEGIN
  DECLARE @var_new_client_id INTEGER;
  SELECT @var_new_client_id = MAX(Client_ID) + 1 FROM Client;
  INSERT INTO Client(Client_ID, Name, Address)
        VALUES(@var_new_client_id, @var_name, @var_address);       
END;
-- Пример вызова процедуры:
-- EXECUTE AddNewClient @var_name='ИП Иванов', @var_address='Some street 98, Samara'

-- DROP PROCEDURE AddNewClient;
