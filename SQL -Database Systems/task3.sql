CREATE TRIGGER tr_TableCreated
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @TableName NVARCHAR(128);
    SET @TableName = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(128)');
    PRINT 'Table ' + @TableName + ' created successfully.';
END;
