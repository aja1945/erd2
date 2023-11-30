CREATE DATABASE CarDealership;

USE CarDealership;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
);

CREATE TABLE Car (
    CarID INT PRIMARY KEY,
    Model VARCHAR(50),
    Year INT,
);

CREATE TABLE Sale (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    CarID INT,
    SaleDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

DELIMITER //
CREATE FUNCTION AddSale(IN customerID INT, IN carID INT, IN saleDate DATE)
RETURNS INT
BEGIN
    DECLARE newSaleID INT;

    INSERT INTO Sale (CustomerID, CarID, SaleDate) VALUES (customerID, carID, saleDate);
    SET newSaleID = LAST_INSERT_ID();

    RETURN newSaleID;
END //
DELIMITER ;
