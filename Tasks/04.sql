-- (04) Удалить поставщиков из Ленинградской области (Leningrad oblast)
DELETE Supplier FROM
(SELECT * FROM Supplier
    WHERE Supplier.State = 'Leningrad oblast') AS Selected
WHERE Supplier.Supplier_ID = Selected.Supplier_ID