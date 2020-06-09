/*TRIGGER*/
DELIMITER //
CREATE TRIGGER salary_trigger
    BEFORE UPDATE ON EMPLOYEE
    FOR EACH ROW 
    BEGIN
IF (new.EmployeeSalary > 100000 AND new.SupervisorID IS NOT NULL) THEN
            signal sqlstate '80000'
            SET message_text = 'A promotion is required for staff to earn above 9k';
END IF;
END //
update EMPLOYEE set EmployeeSalary = 166000 where EmployeeID = 3;