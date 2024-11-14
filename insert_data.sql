-- Insert Sample Data

INSERT INTO Theatre (Theatre_ID, Theatre_Name, Theatre_Location)
VALUES (1, 'PVR Cinemas', 'MG Road, Bangalore'),
       (2, 'INOX', 'Koramangala, Bangalore');

INSERT INTO Movie (Movie_ID, Movie_Name, Genre, Duration)
VALUES (1, 'Avengers: Endgame', 'Action', 180),
       (2, 'The Lion King', 'Animation', 120);

INSERT INTO Show (Show_ID, Theatre_ID, Movie_ID, Show_Date, Show_Time, Available_Tickets)
VALUES (1, 1, 1, '2024-11-15', '10:00:00', 50),
       (2, 1, 2, '2024-11-15', '13:00:00', 75),
       (3, 2, 1, '2024-11-16', '15:30:00', 100);

INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Email, Customer_Phone)
VALUES (1, 'John Doe', 'john.doe@example.com', '9876543210'),
       (2, 'Jane Smith', 'jane.smith@example.com', '9123456789');

INSERT INTO Booking (Booking_ID, Show_ID, Customer_ID, Seats_Booked, Booking_Date)
VALUES (1, 1, 1, 2, '2024-11-10'),
       (2, 2, 2, 4, '2024-11-12');
