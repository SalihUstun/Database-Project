CREATE DATABASE ProductSystem;

USE ProductSystem; 


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    CategoryDescription NVARCHAR(MAX),
 );
 CREATE TABLE DeviceSeries (
    SeriesID INT PRIMARY KEY IDENTITY(1,1),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    SeriesName NVARCHAR(100) NOT NULL,
    SeriesDescription NVARCHAR(MAX),
 );
 CREATE TABLE Devices (
    DeviceCode nvarchar(100) PRIMARY KEY,
    SeriesID INT NOT NULL,
    DeviceName VARCHAR(255) NOT NULL,
    DeviceDescription VARCHAR(500),
    ProductionDate DATE,
    Stock INT,
    FOREIGN KEY (SeriesID) REFERENCES DeviceSeries(SeriesID)
 );
 CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    CreatedDate DATE,
    LastLogin DATE,
    PasswordHash VARCHAR(255) NOT NULL
 );
 CREATE TABLE DeviceFeatures (
    DeviceCode nvarchar(100) PRIMARY KEY, 
    IEC_61131_3_StandardInstructions NVARCHAR(3) CHECK 
(IEC_61131_3_StandardInstructions IN ('Yes', 'No')),
    RealTimeControl NVARCHAR(3) CHECK (RealTimeControl IN ('Yes', 
'No')),
    WebServerRealTimeData NVARCHAR(3) CHECK (WebServerRealTimeData 
IN ('Yes', 'No')),
    OfflineSimulation NVARCHAR(3) CHECK (OfflineSimulation IN 
('Yes', 'No')),
    USBProgramming NVARCHAR(3) CHECK (USBProgramming IN ('Yes', 
'No')),
    TCP_IP_ProgramUpload NVARCHAR(3) CHECK (TCP_IP_ProgramUpload IN 
('Yes', 'No')),
    EncryptedSoftwareProtection NVARCHAR(3) CHECK 
(EncryptedSoftwareProtection IN ('Yes', 'No')),
    IPFiltering NVARCHAR(3) CHECK (IPFiltering IN ('Yes', 'No')),
    IoT_Feature NVARCHAR(3) CHECK (IoT_Feature IN ('Yes', 'No')),
    MODBUS_Gateway NVARCHAR(3) CHECK (MODBUS_Gateway IN ('Yes', 
'No')),
    AxialControlBlockLibrary NVARCHAR(3) CHECK 
(AxialControlBlockLibrary IN ('Yes', 'No')),
    PID_ON_OFFBlockLibrary NVARCHAR(3) CHECK (PID_ON_OFFBlockLibrary 
IN ('Yes', 'No')),
    MathematicalFloatBlockLibrary NVARCHAR(3) CHECK 
(MathematicalFloatBlockLibrary IN ('Yes', 'No')),
    AstronomicalTimeBlockLibrary NVARCHAR(3) CHECK 
(AstronomicalTimeBlockLibrary IN ('Yes', 'No')),
    CustomMacroBlockLibrary NVARCHAR(3) CHECK 
(CustomMacroBlockLibrary IN ('Yes', 'No')),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode) 
);
 CREATE TABLE MotionControlFunctions (
    DeviceCode nvarchar(100) PRIMARY KEY,
    HighSpeedCounterInput VARCHAR(50),
    PulseWidthModulationOutput_PWM VARCHAR(50),
    PulseTrainOutput_PTO VARCHAR(50),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE Programming (
    DeviceCode nvarchar(100) NOT NULL,
    ProgrammingLanguage VARCHAR(255),
    ProgrammingEditor VARCHAR(255),
    USBPortType VARCHAR(255),
    PRIMARY KEY (DeviceCode),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE LEDSignals (
    DeviceCode nvarchar(100) PRIMARY KEY ,
    PowerSupplyLED VARCHAR(50),
    OperatingStatusLED VARCHAR(50),
    CommunicationTxLED VARCHAR(50),
    CommunicationRxLED VARCHAR(50),
    DigitalInputLEDs VARCHAR(50),
    DigitalOutputLEDs VARCHAR(50),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE ElectricalWiring (
    DeviceCode nvarchar(100) PRIMARY KEY,
    IOConnections VARCHAR(255),
    PowerSupplyConnections VARCHAR(255),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE Warranty_Certification (
    DeviceCode nvarchar(100) PRIMARY KEY (DeviceCode),
    WarrantyPeriod VARCHAR(50),
    Certification VARCHAR(255),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
);
 CREATE TABLE RealTimeClock (
    DeviceCode nvarchar(100) PRIMARY KEY ,
    RealTimeClock VARCHAR(3),
    NTPClientSupport VARCHAR(3),
    ModbusTimeSync VARCHAR(3),
    BatteryStatusFunctionality VARCHAR(3),
    RTCBatteryType VARCHAR(50),
    TimeRetentionPeriod VARCHAR(50),
    TimeDrift VARCHAR(50),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE CommunicationProtocols (
    DeviceCode nvarchar(100) PRIMARY KEY ,
    MasterCommunicationProtocols VARCHAR(255),
    SlaveCommunicationProtocols VARCHAR(255),
    IoTProtocol VARCHAR(255),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE CommunicationPorts (
    DeviceCode nvarchar(100) PRIMARY KEY,
    EthernetPorts VARCHAR(50),
    IntegratedGSM VARCHAR(50),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE GSMFunctions (
    DeviceCode nvarchar(100) PRIMARY KEY,
    SMSReceptionFiltering VARCHAR(255),
    SMSCreationSending VARCHAR(255),
    DTMFCallReceptionFiltering VARCHAR(255),
    DTMFCallInitiation VARCHAR(255),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE CardType (
    DeviceCode nvarchar(100) PRIMARY KEY,
    DigitalInputs VARCHAR(255),
    DigitalOutputs VARCHAR(255),
    AnalogInputs VARCHAR(255),
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );
 CREATE TABLE CustomerSupport (
    SupportID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    SupportDescription TEXT,
    SupportDate DATE,
    CreatedDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
 );
CREATE TABLE CustomerSupportTechnician (
    TechnicianID INT PRIMARY KEY,
    TechnicianName VARCHAR(255),
    Email VARCHAR(255),
    SupportID INT,
    Position VARCHAR(255),
    ExperienceYears INT,
    WorkingHours DATE,
    SupportDescription TEXT,
    Salary INT,
    CreatedDate DATE,
    FOREIGN KEY (SupportID) REFERENCES CustomerSupport(SupportID)
 );
 CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    TotalAmount INT,
    OrderStatus VARCHAR(255),
    CreatedDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
 );
 CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    DeviceCode nvarchar(100),
    Quantity INT,
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
 );
 CREATE TABLE Solutions (
    SolutionID INT PRIMARY KEY,
    AutomationName VARCHAR(100) NOT NULL,
    DeviceCode nvarchar(100) NOT NULL,
    CreatedDate DATE NOT NULL,
    FOREIGN KEY (DeviceCode) REFERENCES Devices(DeviceCode)
 );