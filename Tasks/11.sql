-- (11) Все компании
SELECT Client.Name FROM Client
UNION ALL
SELECT Supplier.Name FROM Supplier;