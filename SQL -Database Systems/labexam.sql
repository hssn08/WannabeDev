CREATE DATABASE Airport_database;

CREATE TABLE AIRPORT(
Airport_code VARCHAR(5) NOT NULL,
Airport_Name VARCHAR(40),
City VARCHAR(20),
State CHAR(20),
PRIMARY KEY (Airport_code)
);

--drop Table AIRPORT;

CREATE TABLE FLIGHT(
Flight_number VARCHAR(8) NOT NULL,
Airline VARCHAR(20),
Weekdays VARCHAR(3) CHECK (Weekdays='Yes' OR Weekdays ='No'),
PRIMARY KEY (Flight_number));

--drop table FLIGHT;

CREATE TABLE FLIGHT_LEG(
Flight_number VARCHAR(8) NOT NULL,
Leg_number INT NOT NULL CHECK (Leg_number >=1 AND Leg_number <=4),
Departure_airport_code VARCHAR(5) NOT NULL,
Scheduled_departure_time TIME,
Arrival_airport_code VARCHAR(5) NOT NULL,
Scheduled_arrival_time TIME,
PRIMARY KEY(Flight_number,Leg_number),
FOREIGN KEY (Flight_number) REFERENCES FLIGHT(Flight_number),
FOREIGN KEY (Departure_airport_code) REFERENCES AIRPORT(Airport_code),
FOREIGN KEY (Arrival_airport_code) REFERENCES AIRPORT(Airport_code));

--DROP TABLE FLIGHT_LEG;






CREATE TABLE AIRPLANE_TYPE(
Airplane_type_name VARCHAR(10) NOT NULL,
Max_Seats INT CHECK(Max_Seats <=600),
Company VARCHAR(20),
PRIMARY KEY(Airplane_type_name)
);

--drop table AIRPLANE_TYPE;

CREATE TABLE AIRPLANE(
Airplane_id INT NOT NULL,
Total_number_of_seats INT,
Airplane_type VARCHAR(10) NOT NULL
PRIMARY KEY (Airplane_id),
FOREIGN KEY(Airplane_type) REFERENCES AIRPLANE_TYPE(Airplane_type_name)
);


--drop table AIRPLANE;




CREATE TABLE LEG_INSTANCE(
Flight_number VARCHAR(8) NOT NULL,
Leg_number INT NOT NULL CHECK (Leg_number >=1 AND Leg_number <=4),
Date DATE NOT NULL,
Number_of_available_seats INT,
Airplane_id INT,
Departure_airport_code VARCHAR(5) NOT NULL,
Departure_time TIME,
Arrival_airport_code VARCHAR(5) NOT NULL,
Arrival_time TIME,
PRIMARY KEY(Flight_number,Leg_number,Date),
FOREIGN KEY (Flight_number,Leg_number) REFERENCES FLIGHT_LEG(Flight_number,Leg_number),
FOREIGN KEY(Airplane_id) REFERENCES AIRPLANE(Airplane_id),
FOREIGN KEY (Departure_airport_code) REFERENCES AIRPORT(Airport_code),
FOREIGN KEY (Arrival_airport_code) REFERENCES AIRPORT(Airport_code));

--drop TABLE LEG_INSTANCE;


CREATE TABLE CAN_LAND(
Airplane_type_name VARCHAR(10) NOT NULL,
Airport_code VARCHAR(5) NOT NULL,
PRIMARY KEY (Airplane_type_name,Airport_code),
FOREIGN KEY (Airplane_type_name) REFERENCES AIRPLANE_TYPE(Airplane_type_name),
FOREIGN KEY (Airport_code) REFERENCES AIRPORT(Airport_code));


--drop TABLE CAN_LAND;


CREATE TABLE FARE(
Flight_number VARCHAR(8) NOT NULL,
Fare_Code CHAR(1),
Amount INT CHECK (Amount>=0 and Amount<=1000),
Restrictions VARCHAR(3) CHECK (Restrictions ='Yes' OR Restrictions = 'No'),
FOREIGN KEY (Flight_number) REFERENCES FLIGHT(Flight_number),
PRIMARY KEY (Flight_number,Fare_Code)
);

--drop table FARE;


CREATE TABLE SEAT_RESERVATION(
Flight_number VARCHAR(8) NOT NULL,
Leg_number INT NOT NULL CHECK (Leg_number >=1 AND Leg_number <=4),
Date DATE NOT NULL,
Seat_number VARCHAR(4) NOT NULL,
Customer_name VARCHAR(20),
Customer_phone VARCHAR(15),
PRIMARY KEY (Flight_number,Leg_number,Date,Seat_number),
FOREIGN KEY (Flight_number,Leg_number,Date) REFERENCES LEG_INSTANCE(Flight_number,Leg_number,Date));


--drop Table SEAT_RESERVATION;


INSERT INTO AIRPORT (Airport_code, Airport_Name, City, State)
VALUES 
(10000, 'ALLAMAIQBAL INTL','LAHORE', 'PUNJAB'),
(10001, 'JINNAH INTL','KARACHI', 'SINDH'),
(10002, 'SIRSYED INTL','SKARDU', 'BLOCHISTAN'),
(10003, 'REHMATALI INTL','ISLAMABAD', 'PUNJAB'),
(10004, 'IMRANKHAN INTL','QUETTA', 'KPK');

INSERT INTO FLIGHT(Flight_number, Airline, Weekdays)
VALUES
(101,'PIA','Yes'),
(102,'AIRBLUE','No'),
(103,'QATAR','Yes'),
(104,'EMIRATES','Yes'),
(105,'SINGAPORE','No');


INSERT INTO AIRPLANE_TYPE(Airplane_type_name, Max_Seats, Company)
VALUES 
('Boeing 747', 550, 'Boeing'),
 ('Airbus A38', 560, 'Airbus'),
 ('Boeing 737', 215, 'Boeing'),
 ('Airbus A32', 180, 'Airbus'),
 ('F16', 114, 'America');

INSERT INTO AIRPLANE(Airplane_id, Total_number_of_seats, Airplane_type)
VALUES 
 (1, 550, 'Boeing 747'),
 (2, 560, 'Airbus A38'),
 (3, 215, 'Boeing 737'),
 (4, 180, 'Airbus A32'),
 (5, 114, 'F16');

INSERT INTO FLIGHT_LEG(Flight_number, Leg_number, Departure_airport_code, Scheduled_departure_time, Arrival_airport_code, Scheduled_arrival_time) 
 VALUES 
 ('101', 1, '10000', '12:00:00', '10001', '14:00:00'),
 ('102', 2, '10001', '15:00:00', '10002', '18:00:00'),
 ('103', 3, '10002', '19:00:00', '10003', '21:00:00'),
 ('104', 1, '10001', '08:00:00', '10003', '10:00:00'),
 ('105', 2, '10003', '11:00:00', '10001', '13:00:00');

 
INSERT INTO LEG_INSTANCE (Flight_number, Leg_number, Date, Number_of_available_seats,Airplane_id,Departure_airport_code,Departure_time,Arrival_airport_code,Arrival_time)
VALUES 
('101', 1 , '2023-04-08' , 200 , 1 , '10000', '12:00:00', '10001', '14:00:00'),
('102', 2 , '2023-05-08' , 300 , 2 , '10001', '15:00:00', '10002', '18:00:00'),
('103', 3 , '2023-06-08' , 400 , 3 , '10002', '19:00:00', '10003', '21:00:00'),
('104', 1,  '2023-07-08' , 400 , 1 , '10001', '08:00:00', '10003', '10:00:00'),
('105', 2,  '2023-08-08' , 400 , 2 ,'10003', '11:00:00', '10001', '13:00:00');


INSERT INTO CAN_LAND(Airplane_type_name, Airport_code)
VALUES
('Boeing 747', '10000'),
('Airbus A38', '10002'),
('Boeing 737', '10001'),
('Airbus A32', '10003'),
('F16', '10004');

INSERT INTO FARE(Flight_number, Fare_Code, Amount, Restrictions)
VALUES
('101', 'A', 500, 'Yes'),
('101', 'B', 400, 'No'),
('101', 'C', 300, 'No'),
('102', 'A', 700, 'Yes'),
('102', 'B', 600, 'No');



INSERT INTO SEAT_RESERVATION(Flight_number, Leg_number, Date, Seat_number, Customer_name, Customer_phone)
VALUES
('101', 1, '2023-04-08', 'A1', 'HASSAN', '0323123'),
('101', 1, '2023-04-08', 'B2', 'ABBAS', '0323124'),
('102', 1, '2023-04-10', 'C3', 'ALI', '0323125'),
('103', 2, '2023-04-11', 'D4', 'SHAHBAZ', '0323126'),
('105', 1, '2023-04-12', 'E5', 'AHMED', '0323127');




SELECT AVG(AMOUNT) AS AVGTICKETCOST, SEAT_RESERVATION.Flight_number AS FLIGHT, SEAT_RESERVATION.Date AS SCHEDULEDDATE
FROM FARE
JOIN SEAT_RESERVATION ON FARE.Flight_number=SEAT_RESERVATION.Flight_number
GROUP BY SEAT_RESERVATION.Flight_number,SEAT_RESERVATION.Date




SELECT FLIGHT.Flight_number, AIRPORT.City AS 'From Location', AIRPORT_1.City AS 'To Location', FARE.Amount
FROM FLIGHT
JOIN FLIGHT_LEG ON FLIGHT.Flight_number = FLIGHT_LEG.Flight_number
JOIN LEG_INSTANCE ON FLIGHT_LEG.Flight_number = LEG_INSTANCE.Flight_number AND FLIGHT_LEG.Leg_number = LEG_INSTANCE.Leg_number
JOIN AIRPORT ON FLIGHT_LEG.Departure_airport_code = AIRPORT.Airport_code
JOIN AIRPORT AIRPORT_1 ON FLIGHT_LEG.Arrival_airport_code = AIRPORT_1.Airport_code
JOIN FARE ON FLIGHT.Flight_number = FARE.Flight_number
WHERE MONTH(LEG_INSTANCE.Departure_time) = 1








