SELECT 
    FL.Leg_no,
    FL.Scheduled_dep_time,
    FL.Scheduled_arr_time,
    AT.Company AS AirplaneName
FROM 
    Flight_Leg FL
JOIN 
    Leg_Instance LI ON FL.Leg_no = LI.Leg_no
JOIN 
    Airplane A ON LI.Airplane_id = A.Airplane_id
JOIN 
    Airplane_Type AT ON A.Type_name = AT.Type_name;

	SELECT 
    FL.Number AS FlightNumber,
    AD.Name AS DepartureAirport,
    AA.Name AS ArrivalAirport
FROM 
    Flight_Leg FL
JOIN 
    Airport AD ON FL.Departure_airport = AD.Airport_code
JOIN 
    Airport AA ON FL.Arrival_airport = AA.Airport_code;


	CREATE TABLE Reservation (
    Seat_no VARCHAR(10),
    Leg_no INT,
    Date DATE,
    Customer_name VARCHAR(100),
    Cphone VARCHAR(20),
    ...
);

SELECT 
    Seat_no AS SeatNumber,
    Leg_no AS FlightLeg,
    Date,
    Customer_name AS FullName,
    Cphone AS Phone
FROM 
    Reservation;


SELECT 
    Seat_no AS SeatNumber,
    Leg_no AS FlightLeg,
    Date,
    Customer_name AS FullName,
    Cphone AS Phone
FROM 
    Reservation;


-- Insert valid seat numbers
INSERT INTO Seat (Seat_no)
VALUES ('A1'), ('B2');

-- Now insert into Reservation
INSERT INTO Reservation (Seat_no, Leg_no, Date, Customer_name, Cphone)
VALUES 
('A1', 1, '2025-06-01', 'Mohammed Yousuf', '99887766'),
('B2', 2, '2025-06-02', 'Fatma Zahra', '97775544');

--4.
SELECT 
    FL.Number AS FlightID,
    A.City AS DepartureCity,
    A.State AS DepartureState,
    A.Name AS DepartureAirport
FROM 
    Flight_Leg FL
JOIN 
    Airport A ON FL.Departure_airport = A.Airport_code
WHERE 
    FL.Departure_airport IN ('CAI', 'DXB');


	--5.
	SELECT *
FROM Flight
WHERE Airline LIKE 'A%';

--6.

