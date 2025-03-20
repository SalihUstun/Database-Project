SELECT t.name AS TriggerName,
       tbl.name AS TableName,
       t.is_instead_of_trigger AS IsInsteadOfTrigger,
       t.is_disabled AS IsDisabled
FROM sys.triggers t
INNER JOIN sys.tables tbl
ON t.parent_id = tbl.object_id;

--Delete Command---
DROP TRIGGER schema_adý.trigger_adý;
