use ProductSystem;
GO

CREATE TRIGGER trg_StockUpdate
ON OrderDetails
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE NOT EXISTS (SELECT 1 FROM deleted WHERE inserted.OrderDetailID = deleted.OrderDetailID))
    BEGIN
        UPDATE Devices
        SET Stock = Stock - i.Quantity
        FROM Devices d
        INNER JOIN inserted i
        ON d.DeviceCode = i.DeviceCode;

        PRINT 'Stok azaltma iþlemi gerçekleþtirildi (INSERT).';
    END;

    IF EXISTS (SELECT 1 FROM deleted WHERE NOT EXISTS (SELECT 1 FROM inserted WHERE inserted.OrderDetailID = deleted.OrderDetailID))
    BEGIN
        UPDATE Devices
        SET Stock = Stock + del.Quantity
        FROM Devices d
        INNER JOIN deleted del
        ON d.DeviceCode = del.DeviceCode;

        PRINT 'Stok artýrma iþlemi gerçekleþtirildi (DELETE).';
    END;
 
    IF EXISTS (SELECT 1 FROM inserted INNER JOIN deleted ON inserted.OrderDetailID = deleted.OrderDetailID)
    BEGIN
        UPDATE Devices
        SET Stock = Stock + del.Quantity - i.Quantity
        FROM Devices d
        INNER JOIN inserted i
        ON d.DeviceCode = i.DeviceCode
        INNER JOIN deleted del
        ON d.DeviceCode = del.DeviceCode;

        PRINT 'Stok güncelleme iþlemi gerçekleþtirildi (UPDATE).';
    END;
END;



UPDATE OrderDetails
SET Quantity = 15
WHERE OrderDetailID = 1;


DELETE FROM OrderDetails
WHERE OrderDetailID = 14;


INSERT INTO OrderDetails (OrderDetailID, OrderID, DeviceCode, Quantity)
VALUES (1, 101, 'D001', 5);