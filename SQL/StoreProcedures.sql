/*Stored Procedures1*/
DELIMITER //
CREATE PROCEDURE SelectAllOffice
(IN City VARCHAR(45))
BEGIN
	SELECT * FROM OFFICE_LOCATION 
    WHERE OfficeCity = City; 
END //
DELIMITER ;

CALL SelectAllOffice('Chicago');

/*Stored Procedures2*/
DELIMITER //
CREATE PROCEDURE SelectAllCustomerPickUp
(IN City VARCHAR(45)) 
BEGIN
	SELECT c.CustomerID, c.CustomerLastName, c.CustomerFirstName, c.CustomerPhoneNumber, c. DrivingLicenseNumber, 
    r.StartDate, r.EndDate, o.OfficeStreetAddress, o.OfficeCity, o.OfficeState, OfficePostalCode
    FROM CUSTOMER c, Rental r, OFFICE_LOCATION o
	WHERE c.CustomerID = r.CustomerID
	AND r.PickUpOfficeID = o.OfficeID
	AND o.OfficeCity = City; 
END //
DELIMITER ;

CALL SelectAllCustomerPickUp('Chicago');

/*Stored Procedures3*/
DELIMITER //
CREATE PROCEDURE RentalCar 
(IN Car VARCHAR(45))
BEGIN
	SELECT v.VehicleCategory, v.VehicleColor, v.VehicleProductionYear, v.VehicleMileage, m.ModelName, ma.ManufacturerName
    FROM VEHICLE v, MODEL m, MANUFACTURER ma
    WHERE v.ModelID = m.ModelID
    AND m.ManufacturerID = ma.ManufacturerID
    AND ma.ManufacturerName = car; 
END //
DELIMITER ;

CALL RentalCar('BMW');

/*Stored Procedures4*/
DELIMITER //
CREATE PROCEDURE CountOrderByOffice(
 IN Office VARCHAR(25),
 OUT total INT)
BEGIN
 SELECT count(OfficeState)
 INTO total
 FROM OFFICE_LOCATION
 WHERE OfficeState = Office;
END//
DELIMITER ;


CALL CountOrderByOffice('IL',@total);
SELECT @total;