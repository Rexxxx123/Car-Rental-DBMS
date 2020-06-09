/*CREATE TABLES*/
CREATE DATABASE Project;
USE Project;

CREATE TABLE CUSTOMER (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    CustomerLastName VARCHAR(45),
    CustomerFirstName VARCHAR(45),
    CustomerDOB DATE,
    DrivingLicenseNumber VARCHAR(45) NOT NULL,
    CustomerPhoneNumber VARCHAR(11),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE OFFICE_LOCATION (
    OfficeID INT NOT NULL AUTO_INCREMENT,
    OfficeStreetAddress VARCHAR(45) NOT NULL,
    OfficeCity VARCHAR(45),
    OfficeState VARCHAR(2),
    OfficeCountry VARCHAR(45),
    OfficePostalCode INT,
    PRIMARY KEY (OfficeID)
);

CREATE TABLE RESERVATION (
    ReservationID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
	PickUpOfficeID INT NOT NULL,
    DropOffOfficeID INT NOT NULL,
    PRIMARY KEY (ReservationID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (PickUpOfficeID) REFERENCES OFFICE_LOCATION(OfficeID),
    FOREIGN KEY (DropOffOfficeID) REFERENCES OFFICE_LOCATION(OfficeID)
);

CREATE TABLE MANUFACTURER(
	ManufacturerID INT NOT NULL AUTO_INCREMENT,
    ManufacturerName VARCHAR(45),
    PRIMARY KEY (ManufacturerID)
);

CREATE TABLE MODEL(
	ModelID INT NOT NULL AUTO_INCREMENT,
    ModelName VARCHAR(45),
    ManufacturerID INT,
    PRIMARY KEY (ModelID),
    FOREIGN KEY (ManufacturerID) REFERENCES MANUFACTURER(ManufacturerID)
);

CREATE TABLE VEHICLE(
    VehicleID INT NOT NULL AUTO_INCREMENT,
    VehicleCategory VARCHAR(45) NOT NULL,
    VehicleColor VARCHAR(45),
    VehicleProductionYear YEAR,
    VehicleMileage INT,
    OfficeID INT,
    ModelID INT,
	PRIMARY KEY (VehicleID),
	FOREIGN KEY (ModelID) REFERENCES MODEL (ModelID),
	FOREIGN KEY (OfficeID) REFERENCES OFFICE_LOCATION (OfficeID)
);

CREATE TABLE RENTAL (
    RentalID INT NOT NULL AUTO_INCREMENT,
    VehicleID INT NOT NULL,
    StartDate DATE,
    EndDate DATE,
    CustomerID INT,
    PickUpOfficeID INT,
    DropOffOfficeID INT,
    PRIMARY KEY (RentalID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (PickUpOfficeID) REFERENCES OFFICE_LOCATION(OfficeID),
    FOREIGN KEY (DropOffOfficeID) REFERENCES OFFICE_LOCATION(OfficeID),
    FOREIGN KEY (VehicleID) REFERENCES VEHICLE(VehicleID)
);

CREATE TABLE RENTALINVOICE (
    RentalInvoiceID INT NOT NULL AUTO_INCREMENT,
    RentalInvoiceDate DATETIME,
	InsuranceCost INT,
    Tax INT,
    TotalRentalCost INT,
    Discount INT,
    NetAmount INT,
    RentalID INT NOT NULL,
    CustomerID INT NOT NULL,
    OfficeID INT NOT NULL,
    PRIMARY KEY (RentalInvoiceID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (OfficeID) REFERENCES OFFICE_LOCATION(OfficeID),
    FOREIGN KEY (RentalID) REFERENCES RENTAL(RentalID)
);

CREATE TABLE PAYMENT (
    PaymentID INT NOT NULL AUTO_INCREMENT,
    PaymentDate DATETIME NOT NULL,
	RentalInvoiceID INT NOT NULL,
    PRIMARY KEY (PaymentID),
    FOREIGN KEY (RentalInvoiceID) REFERENCES RENTALINVOICE(RentalInvoiceID)
);

CREATE TABLE INSURANCE (
    InsuranceID INT NOT NULL AUTO_INCREMENT,
    InsuranceName VARCHAR(45),
	InsurancePolicy VARCHAR(45),
    InsuranceCol VARCHAR(115),
    PRIMARY KEY (InsuranceID)
);

CREATE TABLE HASINSURANCE(
	HasInsuranceID INT NOT NULL AUTO_INCREMENT,
	RentalID INT NOT NULL,
    InsuranceID INT NOT NULL,
    PRIMARY KEY (HasInsuranceID),
    FOREIGN KEY (RentalID) REFERENCES RENTAL(RentalID),
    FOREIGN KEY (InsuranceID) REFERENCES INSURANCE(InsuranceID)
);

CREATE TABLE EMPLOYEE (
    EmployeeID int NOT NULL AUTO_INCREMENT,
    EmployeeLastName VARCHAR(45) NOT NULL,
    EmployeeFirstName VARCHAR(45) NOT NULL,
    EmployeeSkill VARCHAR(45),
    EmployeeAddress VARCHAR(45),
    EmployeePhoneNumber VARCHAR(11),
	EmployeeSalary VARCHAR(45) NOT NULL,
    OfficeID INT NOT NULL,
    SupervisorID INT,
	PRIMARY KEY (EmployeeID),
	FOREIGN KEY (OfficeID) REFERENCES OFFICE_LOCATION(OfficeID),
    FOREIGN KEY (SupervisorID) REFERENCES EMPLOYEE(EmployeeID)
);