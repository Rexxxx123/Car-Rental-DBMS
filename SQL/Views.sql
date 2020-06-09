/*VIEWS*/
CREATE VIEW Illinois_Office AS
SELECT OfficeID, OfficeStreetAddress, OfficeCity, OfficeState
FROM OFFICE_LOCATION
WHERE OfficeState = "IL";

CREATE VIEW Rental_NetAmount_Above_400 AS
SELECT c.CustomerFirstName, c.CustomerLastName, r.NetAmount
FROM RENTALINVOICE r
INNER JOIN CUSTOMER c
ON r.CustomerID = c.CustomerID
WHERE r.NetAmount > 400;