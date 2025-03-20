use ProductSystem;
go

CREATE PROCEDURE ManageDevices
    @Action NVARCHAR(10),             
    @DeviceCode NVARCHAR(100) = NULL, 
    @SeriesID INT = NULL,
    @DeviceName NVARCHAR(255) = NULL,
    @DeviceDescription NVARCHAR(500) = NULL,
    @ProductionDate DATE = NULL,
    @Stock INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO Devices (DeviceCode, SeriesID, DeviceName, DeviceDescription, ProductionDate, Stock)
        VALUES (@DeviceCode, @SeriesID, @DeviceName, @DeviceDescription, @ProductionDate, @Stock);
    END

    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE Devices
        SET SeriesID = @SeriesID,
            DeviceName = @DeviceName,
            DeviceDescription = @DeviceDescription,
            ProductionDate = @ProductionDate,
            Stock = @Stock
        WHERE DeviceCode = @DeviceCode;
    END

    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM Devices
        WHERE DeviceCode = @DeviceCode;
    END

    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @DeviceCode IS NOT NULL
        BEGIN
            SELECT * FROM Devices
            WHERE DeviceCode = @DeviceCode;
        END
        ELSE
        BEGIN
            SELECT * FROM Devices;
        END
    END
	
    ELSE
    BEGIN
        PRINT 'Invalid Action. Use INSERT, UPDATE, DELETE, or SELECT.';
    END
END;
GO

EXEC ManageDevices 
    @Action = 'INSERT', 
    @DeviceCode = 'D12345',
    @SeriesID = 1, 
    @DeviceName = 'Smart Device X', 
    @DeviceDescription = 'A smart IoT-enabled device', 
    @ProductionDate = '2025-01-04', 
    @Stock = 100;

EXEC ManageDevices 
    @Action = 'UPDATE', 
    @DeviceCode = 'D12345', 
    @SeriesID = 4, 
    @DeviceName = 'Updated DeviceE X', 
    @DeviceDescription = 'Updated description', 
    @ProductionDate = '2025-01-05', 
    @Stock = 120;

EXEC ManageDevices 
    @Action = 'DELETE', 
    @DeviceCode = 'D12345';