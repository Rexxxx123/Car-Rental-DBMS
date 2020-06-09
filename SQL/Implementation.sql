use project;
/*TRIGGER2*/
DELIMITER //
CREATE TRIGGER Age_Trigger
    BEFORE insert on Customer
    FOR EACH ROW 
    BEGIN
IF (FLOOR(DATEDIFF(CURRENT_DATE(), NEW.CustomerDOB)/365) < 18) 
THEN 
signal sqlstate '80001'
SET message_text = 'Age of 18 is required for Customer to rent a car';
END IF;
END //

INSERT INTO CUSTOMER (CustomerID, CustomerFirstName, CustomerLastName, CustomerDOB, DrivingLicenseNumber, CustomerPhoneNumber)
VALUES ('16', 'Noah', 'Miller', '2018-12-15', 'S24987766', '7887484848');


/*FUNCTION*/
SELECT CustomerFirstName, CustomerLastName, FLOOR(DATEDIFF(CURRENT_DATE(), CustomerDOB)/365) 
AS Age 
FROM CUSTOMER;

SELECT * FROM VEHICLE
WHERE VehicleMileage > (SELECT (AVG(VehicleMileage)+10000) FROM VEHICLE);

/*ENCRUPTION*/
INSERT INTO CUSTOMER (CustomerID,CustomerLastName, CustomerFirstName,CustomerDOB, DrivingLicenseNumber,CustomerPhoneNumber)
VALUES 
('16','Six','Five', '1998-04-09',
ENCODE('S24987734','1234'), '12345678'
);

/*INDEX*/
CREATE UNIQUE INDEX idx_CustomerName
ON CUSTOMER (CustomerLastName ASC);

SHOW INDEXES FROM CUSTOMER;
