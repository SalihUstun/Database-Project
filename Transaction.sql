use ProductSystem;
GO

BEGIN TRANSACTION;
BEGIN TRY
    INSERT INTO CustomerSupport (UserID, SupportDescription, SupportDate, CreatedDate)
    VALUES (4, 'Cihaz að baðlantý sorunu', GETDATE(), GETDATE());

    DECLARE @SupportID INT = SCOPE_IDENTITY();

    INSERT INTO CustomerSupportTechnician (TechnicianID, TechnicianName, Email, SupportID, Position, ExperienceYears, WorkingHours, SupportDescription, Salary, CreatedDate)
    VALUES (9, 'Ertan', 'ErtanB.eleman@example.com', @SupportID, 'Teknik Destek Uzmaný', 5, GETDATE(), 'Cihaz að sorunu incelenecek.', 5000, GETDATE());

    COMMIT;
    PRINT 'Ýþlem baþarýyla tamamlandý.';
END TRY

BEGIN CATCH
    ROLLBACK;
    PRINT 'Hata oluþtu. Ýþlem geri alýndý.';
    PRINT ERROR_MESSAGE();
END CATCH;