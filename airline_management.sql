CREATE TABLE Airplane_type(
 A_ID INT,
 Capacity INT,
 A_weight INT,
 Company VARCHAR(15),
 PRIMARY KEY(A_ID)
);

INSERT INTO Airplane_type VALUES (738,853,394,"Indigo");
INSERT INTO Airplane_type VALUES (777,800,380,"Vistara");
INSERT INTO Airplane_type VALUES (750,790,364,"AirIndia");
INSERT INTO Airplane_type VALUES (790,850,390,"SpiceJet");
INSERT INTO Airplane_type VALUES (745,770,405,"GoAir");
INSERT INTO Airplane_type VALUES (768,867,387,"AirAsia");
INSERT INTO Airplane_type VALUES (821,790,355,"TruJet");
INSERT INTO Airplane_type VALUES (785,835,410,"Alliance Air");
SELECT * FROM Airplane_type;

CREATE TABLE Route(
 Route_ID INT,
 Take_Off_point VARCHAR(15),
 Destination VARCHAR(15),
 R_type VARCHAR(15),
 PRIMARY KEY(Route_ID)
);


INSERT INTO Route VALUES(168806,'London','Delhi','Direct');
INSERT INTO Route VALUES(157306,'NewJersey','Mumbai','2Hr Break');
INSERT INTO Route VALUES(178916,'Washington','Jodhpur','3Hr Break');
INSERT INTO Route VALUES(324567,'Chennai','Denmark','Direct');
INSERT INTO Route VALUES(452368,'Chandigard','NewYork','3Hr Break');
INSERT INTO Route VALUES(894521,'Daman','Delhi','Direct');
INSERT INTO Route VALUES(578425,'Beijing','Punjab','Direct');
INSERT INTO Route VALUES(421523,'Hyderabad','Jammu & Kashmir','Direct')
SELECT * FROM Route;

CREATE TABLE Flight(
 Flight_ID VARCHAR(15),
 Departure VARCHAR(30),
 Arrival VARCHAR(30),
 Flight_date DATE,
 A_ID INT,
 PRIMARY KEY(Flight_ID),
 FOREIGN KEY (A_ID) REFERENCES Airplane_type(A_ID)
);

INSERT INTO Flight VALUES('AI2014','2021-01-12 08:45am','2021-01-
12 10:25pm','2021-01-12',738);
INSERT INTO Flight VALUES('QR2305','2020-12-26 12:05pm','2020-12-
27 12:25pm','2020-12-26',777);
INSERT INTO Flight VALUES('EY1234','2021-02-10 05:00am','2021-02-
10 10;30pm','2021-02-10',750);
INSERT INTO Flight VALUES('LH9876','2021-02-25 10:15am','2021-02-
25 11:00pm','2021-02-25',790);
SELECT * FROM Flight;


CREATE TABLE AirFare(
 Fare_ID INT,
 Charge_Amount INT,
 Description VARCHAR(25),
 Flight_ID VARCHAR(15),
 PRIMARY KEY(Fare_ID),
 FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);
INSERT INTO AirFare VALUES(1,27341,'Standard Single','AI2014');
INSERT INTO AirFare VALUES(4,34837,'Standard Return','QR2305');
INSERT INTO AirFare VALUES(2,42176,'Key Fare Single','EY1234');
INSERT INTO AirFare VALUES(3,27373,'Business Return','LH9876');

SELECT * FROM AirFare;

CREATE TABLE Passengers(
 Ps_ID INT,
 Ps_Name VARCHAR(20),
 Address VARCHAR(50),
 Age INT,
 Sex VARCHAR(1),
 Contacts VARCHAR(10),
 Flight_ID VARCHAR(15),
 PRIMARY KEY(Ps_ID),
 FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);
INSERT INTO Passengers VALUES(1,'Steve Smith','2230 Northside,Apt 11,London'
,30,'M','8080367290','AI2014');
INSERT INTO Passengers VALUES(2,'Ankita Ahir','3456 Vikas Apts,Apt 102,New
Jersey',26,'F','8080367280','QR2305');
INSERT INTO Passengers VALUES(4,'Akhilesh Joshi','345 Chatam courts,Apt 678,
Chennai',29,'M','9080369290','EY1234');
INSERT INTO Passengers VALUES(3,'Khyati Mishra','7820 Mccallum courts,Apt 2
34,Washington',30,'F','8082267280','LH9876');


SELECT * FROM Passengers;


CREATE TABLE Countries(
 Country_code INT,
 Country_Name VARCHAR(20),
 PRIMARY KEY(Country_code)
);
INSERT INTO Countries VALUES (+44,'England');
INSERT INTO Countries VALUES (+1,'USA');
INSERT INTO Countries VALUES (+91,'India');
INSERT INTO Countries VALUES (+45,'Kingdom of Denmark');
INSERT INTO Countries VALUES (+64,'New Zealand');
INSERT INTO Countries VALUES (+971,'UAE');
INSERT INTO Countries VALUES (+213,'Algeria');
INSERT INTO Countries VALUES (+55,'Brazil');
SELECT * FROM Countries;

CREATE TABLE Airport(
 Air_code VARCHAR(10),
 Air_Name VARCHAR(50),
 City VARCHAR(20),
 State VARCHAR(20),
 Country_code INT,
 PRIMARY KEY(Air_code),
 FOREIGN KEY (Country_code) REFERENCES Countries(Country_code)
);
INSERT INTO Airport VALUES('DEL','Indira Gandhi International Airport','Delhi','
UP',+91);
INSERT INTO Airport VALUES('BOM','Chhatrapati Shivaji Maharaj International A
irport','Mumbai','Maharashtra',+91);
INSERT INTO Airport VALUES('LCY','London City Airport','Newham','London',+44);
INSERT INTO Airport VALUES('EWR','Newark Liberty International Airport','New
ark','New Jersey',+1);
INSERT INTO Airport VALUES('JFK','John F.Kennnedy International Airport','New
York City','New York',+1);

INSERT INTO Airport VALUES('CPH','Copenhagen Airport','Copenhagen','Denmar
k',+45);
INSERT INTO Airport VALUES('AIP','Adampur Airport','Jalandhar','Punjab',+91);
INSERT INTO Airport VALUES('IXJ','Satwari Airport','Jammu','Jammu & Kashmir',
+91);
SELECT * FROM Airport;

CREATE TABLE Employees(
 Emp_ID INT,
 E_Name VARCHAR(20),
 Address VARCHAR(50),
 Age INT,
 Email_ID VARCHAR(20),
 Contact VARCHAR(20),
 Air_code VARCHAR(10),
 PRIMARY KEY(Emp_ID),
 FOREIGN KEY (Air_code) REFERENCES Airport(Air_code)
);

INSERT INTO Employees VALUES(3246,'John Dsouza','302-Fountain Apt,ElizaBeth Street,Newham',26,'john2346@gmail.com','+447911123456','BOM');
INSERT INTO Employees VALUES(5123,'Lara Jen','28-Mark road,Victoria street,New York City',31,'jenlara4@gmail.com','+448000751234','CPH');
SELECT * FROM Employees;

UPDATE employees
SET E_Name='Lara Sen'
WHERE  Emp_ID=5123;

CREATE TABLE Can_Land(
 Air_code VARCHAR(10),
 Flight_ID VARCHAR(15),
 PRIMARY KEY(Air_code,Flight_ID),
 FOREIGN KEY(Air_code) REFERENCES Airport(Air_code),
 FOREIGN KEY(Flight_ID) REFERENCES Flight(Flight_ID)
);
INSERT INTO Can_Land VALUES('DEL','AI2014');
INSERT INTO Can_Land VALUES('BOM','QR2305');
INSERT INTO Can_Land VALUES('LCY','EY1234');
INSERT INTO Can_Land VALUES('EWR','LH9876');


SELECT * FROM Can_Land;

CREATE TABLE Transactions(
 TS_ID INT,
 Booking_Date DATE,
 Departure_Date DATE,
 TS_Type VARCHAR(20),
 Emp_ID INT,
 Ps_ID INT,
 Flight_ID VARCHAR(15),
 Charge_Amount INT,
 PRIMARY KEY(TS_ID),
 FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID) ,
 FOREIGN KEY (Ps_ID) REFERENCES Passengers(Ps_ID),
 FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
 FOREIGN KEY (Charge_Amount) REFERENCES AirFare(Fare_ID)
);

INSERT INTO Transactions VALUES(12345678,'2021-02-21','2021-02-
22','Google Pay',1234,1,'AI2014',27341);
INSERT INTO Transactions VALUES(45612789,'2021-01-12','2021-01-
14','Credit Card',3246,2,'QR2305',34837);
INSERT INTO Transactions VALUES(56987123,'2020-12-05','2020-12-
02','Paytm',9321,4,'EY1234',42176);

SELECT * FROM Transactions;

CREATE TABLE Travels_on(
 Route_ID INT,
 Flight_ID VARCHAR(15),
 PRIMARY KEY(Route_ID,Flight_ID),
 FOREIGN KEY(Route_ID) REFERENCES Route(Route_ID),
 FOREIGN KEY(Flight_ID) REFERENCES Flight(Flight_ID)
);
INSERT INTO Travels_on VALUES(168806,'AI2014');
INSERT INTO Travels_on VALUES(157306,'QR2305');
INSERT INTO Travels_on VALUES(178916,'EY1234');
INSERT INTO Travels_on VALUES(324567,'LH9876');

SELECT * FROM Travels_on;


--Display the route information for all flights:

SELECT A.Company, R.Take_Off_point, R.Destination
 FROM Airplane_type as A, Flight as F ,Travels_on as T, Route as R
 WHERE F.Flight_ID = T.Flight_ID
 AND A.A_ID = F.A_ID
 AND T.Route_ID = R.Route_ID;
 
--Find all country name with more than one airport:

SELECT Country_Name, count(*) as Airport_count 
 FROM Airport as A,Countries as C
 WHERE A.Country_code = C.Country_code 
 GROUP BY C.Country_name 
 HAVING count(*) > 1;
