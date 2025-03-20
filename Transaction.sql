use ProductSystem;
GO

BEGIN TRANSACTION;
BEGIN TRY
    INSERT INTO CustomerSupport (UserID, SupportDescription, SupportDate, CreatedDate)
    VALUES (4, 'Cihaz a� ba�lant� sorunu', GETDATE(), GETDATE());

    DECLARE @SupportID INT = SCOPE_IDENTITY();

    INSERT INTO CustomerSupportTechnician (TechnicianID, TechnicianName, Email, SupportID, Position, ExperienceYears, WorkingHours, SupportDescription, Salary, CreatedDate)
    VALUES (9, 'Ertan', 'ErtanB.eleman@example.com', @SupportID, 'Teknik Destek Uzman�', 5, GETDATE(), 'Cihaz a� sorunu incelenecek.', 5000, GETDATE());

    COMMIT;
    PRINT '��lem ba�ar�yla tamamland�.';
END TRY

BEGIN CATCH
    ROLLBACK;
    PRINT 'Hata olu�tu. ��lem geri al�nd�.';
    PRINT ERROR_MESSAGE();
END�CATCH;