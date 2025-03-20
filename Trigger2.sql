use ProductSystem;
go 

CREATE TRIGGER trg_InsertDefaultDeviceFeatures
ON Devices
AFTER INSERT
AS
BEGIN
    INSERT INTO DeviceFeatures (
        DeviceCode,
        IEC_61131_3_StandardInstructions,
        RealTimeControl,
        WebServerRealTimeData,
        OfflineSimulation,
        USBProgramming,
        TCP_IP_ProgramUpload,
        EncryptedSoftwareProtection,
        IPFiltering,
        IoT_Feature,
        MODBUS_Gateway,
        AxialControlBlockLibrary,
        PID_ON_OFFBlockLibrary,
        MathematicalFloatBlockLibrary,
        AstronomicalTimeBlockLibrary,
        CustomMacroBlockLibrary
    )
    SELECT
        i.DeviceCode,        
        'No',                
        'No',                
        'No',                
        'No',                
        'No',                
        'No',                
        'No',                
        'No',               
        'No',                
        'No',                
        'No',                
        'No',                
        'No',                
        'No',               
        'No'                 
    FROM
        inserted AS i;     
END;
GO

INSERT INTO Devices (
    DeviceCode,
    SeriesID,
    DeviceName,
    DeviceDescription,
    ProductionDate,
    Stock
)
VALUES (
    'DEV001',                 
    1,                        -- SeriesID 
    'Example Device',         -- DeviceName
    'This is a test device.', -- DeviceDescription
    '2025-01-05',             -- ProductionDate
    100                       -- Stock
);