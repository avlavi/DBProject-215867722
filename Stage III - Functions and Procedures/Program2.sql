-- Function to count the number of active drivers
CREATE OR REPLACE FUNCTION Count_Active_Drivers RETURN INT IS
    active_drivers_count INT := 0;
    
BEGIN
    -- Counts the drivers with status 'Active'
    SELECT COUNT(*) INTO active_drivers_count FROM Driver 
    WHERE Status = 'Active';
    RETURN active_drivers_count;
    
EXCEPTION
    -- Returns 0 if no active drivers are found
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    -- Returns -1 for any other error
    WHEN OTHERS THEN
        RETURN -1;
END Count_Active_Drivers;
/


-- Procedure to promote soldiers of samal rank who were enlisted before a given date
CREATE OR REPLACE PROCEDURE Promote_Soldiers (promotion_date DATE) IS
    -- Selects soldiers enlisted before the given promotion date
    CURSOR soldier_cursor IS
        SELECT ID, Rank FROM Soldier WHERE Enlistment_Date_ < promotion_date;
        
BEGIN
    -- Promotes the relevant soldiers based on their current rank
    FOR soldier_record IN soldier_cursor LOOP        
        CASE soldier_record.Rank
            WHEN 'Rav Samal' THEN
                UPDATE Soldier SET Rank = 'Rav Samal Rishon' WHERE ID = soldier_record.ID;
            WHEN 'Rav Samal Rishon' THEN
                UPDATE Soldier SET Rank = 'Rav Samal Mitkadem' WHERE ID = soldier_record.ID;
            WHEN 'Rav Samal Mitkadem' THEN
                UPDATE Soldier SET Rank = 'Segen Mishneh' WHERE ID = soldier_record.ID;
            ELSE
                -- Rank left unchanged if no promotion is available for their rank
                UPDATE Soldier SET Rank = Soldier.Rank;
        END CASE;
    END LOOP;
    -- Updates database
    COMMIT;
    
EXCEPTION
    -- Undoes changes in case of error and outputs the error message
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END Promote_Soldiers;
/

-- Executing the function and procedure
DECLARE
    active_drivers_count INT;
    promotion_date DATE := TO_DATE('2020-01-01', 'YYYY-MM-DD');
    
BEGIN
    -- Calls the function to count active drivers
    active_drivers_count := Count_Active_Drivers;
    DBMS_OUTPUT.PUT_LINE('Number of Active Drivers: ' || active_drivers_count);

    -- Calls the procedure to promote soldiers based on the promotion date
    Promote_Soldiers(promotion_date);
    DBMS_OUTPUT.PUT_LINE('Soldiers enlisted before ' || promotion_date || ' have been promoted.');
END;
/
