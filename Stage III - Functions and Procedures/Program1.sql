-- Calculates total number of products in the system 
-- and finds the product with the greatest amount
CREATE OR REPLACE FUNCTION Calculate_Total_Products 
       (largest_product_name OUT VARCHAR2) RETURN INT IS
    total_products INT := 0;
    
BEGIN
    -- Sums the amounts of each product
    SELECT SUM(Amount) INTO total_products FROM Product;

    -- Finds the product with the largest amount
    SELECT Product_name
    INTO largest_product_name
    FROM Product
    WHERE Amount = (SELECT MAX(Amount) FROM Product);
    
    RETURN total_products;
    
EXCEPTION
    -- Handles case of no data
    WHEN NO_DATA_FOUND THEN
        largest_product_name := 'None';
        RETURN 0;
    -- Handles other exceptions
    WHEN OTHERS THEN
        largest_product_name := 'Error';
        RETURN -1;
END Calculate_Total_Products;
/


-- Procedure to update delivery statuses to 'Completed' if the delivery date has passed
CREATE OR REPLACE PROCEDURE Update_Delivery_Status IS
    -- Selects deliveries that are past due and not yet completed
    CURSOR delivery_cursor IS
        SELECT Delivery_num, Delivery_date, Status FROM Delivery WHERE Delivery_date < SYSDATE AND Status != 'Completed';

    delivery_record delivery_cursor%ROWTYPE;
    
BEGIN
    OPEN delivery_cursor;
    LOOP
        FETCH delivery_cursor INTO delivery_record;
        EXIT WHEN delivery_cursor%NOTFOUND;
        -- Checks if the status is not 'Completed'
        IF delivery_record.Status != 'Completed' THEN
            -- Updates the status to 'Completed'
            UPDATE Delivery
            SET Status = 'Completed'
            WHERE Delivery_num = delivery_record.Delivery_num;
        END IF;
    END LOOP;
    
    -- Closing cursor and updating database
    CLOSE delivery_cursor;
    COMMIT;
    
EXCEPTION
    -- Undoes changes in case of error and outputs the error message
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END Update_Delivery_Status;
/

-- Executing the functions and procedures
DECLARE
    total_products INT;
    largest_product_name VARCHAR2(100);
    
BEGIN
    -- Calls the function to calculate total products and find the largest product
    total_products := Calculate_Total_Products(largest_product_name);
    DBMS_OUTPUT.PUT_LINE('Total Products Available: ' || total_products);
    DBMS_OUTPUT.PUT_LINE('Product with the Largest Amount: ' || largest_product_name);

    -- Calls the procedure to update delivery statuses
    Update_Delivery_Status;
    DBMS_OUTPUT.PUT_LINE('Delivery statuses have been updated.');
END;
/
