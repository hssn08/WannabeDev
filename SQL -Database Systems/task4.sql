CREATE TABLE LogTable
(
    Activity VARCHAR(40),
    Date DATETIME
);

CREATE TRIGGER tr_InsertLog
ON dbo.YourTableName
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO LogTable (Activity, Date)
    VALUES ('New data inserted', GETDATE());
END;
