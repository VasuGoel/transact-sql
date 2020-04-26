-- Challenge 1: Logging Errors

-- 1. Throw an error for non-existent orders
DECLARE @OrderID int = 0
DECLARE @error VARCHAR(30) = 'Order #' + cast(@OrderID as VARCHAR) + ' does not exist';
IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID)
BEGIN
    THROW 50001, @error, 0;
END
ELSE
BEGIN
  DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @OrderID;
  DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID;
END

-- 2. Handle errors
DECLARE @OrderID int = 71774
DECLARE @error VARCHAR(30) = 'Order #' + cast(@OrderID as VARCHAR) + ' does not exist';
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID)
    BEGIN
        THROW 50001, @error, 0
    END
    ELSE
    BEGIN
        DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @OrderID;
        DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID;
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH


-- Challenge 2: Ensuring Data Consistency

-- 1. Implement a transaction
DECLARE @OrderID int = 0
DECLARE @error VARCHAR(30) = 'Order #' + cast(@OrderID as VARCHAR) + ' does not exist';
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID)
    BEGIN
        THROW 50001, @error, 0
    END
    ELSE
    BEGIN
        BEGIN TRANSACTION
            DELETE FROM SalesLT.SalesOrderDetail
            WHERE SalesOrderID = @OrderID;
            DELETE FROM SalesLT.SalesOrderHeader
            WHERE SalesOrderID = @OrderID;
        COMMIT TRANSACTION
    END
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        PRINT ERROR_MESSAGE();
    END
END CATCH