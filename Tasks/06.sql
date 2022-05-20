-- (06) Продукты в бумажной упаковке, которые производят из цельного молока (Whole Milk)
SELECT Product.Name FROM Product
    WHERE Product.Product_ID IN (SELECT ID FROM V_Wrap_Package) AND Product.Material_ID =
      (SELECT Material.Material_ID FROM Material WHERE Material.Name = 'Whole Milk');