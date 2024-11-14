-- Create Theatre Table
CREATE TABLE Theatre (
    Theatre_ID INT PRIMARY KEY,
    Theatre_Name VARCHAR(255),
    Theatre_Location VARCHAR(255)
);

-- Create Movie Table
CREATE TABLE Movie (
    Movie_ID INT PRIMARY KEY,
    Movie_Name VARCHAR(255),
    Genre VARCHAR(50),
    Duration INT
);

-- Create Show Table
CREATE TABLE Show (
    Show_ID INT PRIMARY KEY,
    Theatre_ID INT,
    Movie_ID INT,
    Show_Date DATE,
    Show_Time TIME,
    Available_Tickets INT,
    FOREIGN KEY (Theatre_ID) REFERENCES Theatre(Theatre_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

-- Create Customer Table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(255),
    Customer_Email VARCHAR(255),
    Customer_Phone VARCHAR(15)
);

-- Create Booking Table
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Show_ID INT,
    Customer_ID INT,
    Seats_Booked INT,
    Booking_Date DATE,
    FOREIGN KEY (Show_ID) REFERENCES Show(Show_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
