Create database smart_parking_system;
use smart_parking_system;

-- 1. Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    registered_at DATETIME DEFAULT GETDATE()
);

/*Insertion*/

-- Insert 60 unique users
INSERT INTO Users (name, phone, email)
VALUES
('Ali Khan', '358440000001', 'ali.khan@example.com'),
('Sara Ahmed', '358440000002', 'sara.ahmed@example.com'),
('Hassan Raza', '358440000003', 'hassan.raza@example.com'),
('Fatima Noor', '358440000004', 'fatima.noor@example.com'),
('Bilal Qureshi', '358440000005', 'bilal.qureshi@example.com'),
('Ayesha Malik', '358440000006', 'ayesha.malik@example.com'),
('Usman Tariq', '358440000007', 'usman.tariq@example.com'),
('Maria Sheikh', '358440000008', 'maria.sheikh@example.com'),
('Omer Farooq', '358440000009', 'omer.farooq@example.com'),
('Hina Iqbal', '358440000010', 'hina.iqbal@example.com'),

('Ahmed Butt', '358440000011', 'ahmed.butt@example.com'),
('Sadia Aslam', '358440000012', 'sadia.aslam@example.com'),
('Noman Javed', '358440000013', 'noman.javed@example.com'),
('Aqsa Rauf', '358440000014', 'aqsa.rauf@example.com'),
('Rizwan Ali', '358440000015', 'rizwan.ali@example.com'),
('Farah Bashir', '358440000016', 'farah.bashir@example.com'),
('Shahid Anwar', '358440000017', 'shahid.anwar@example.com'),
('Komal Nisar', '358440000018', 'komal.nisar@example.com'),
('Salman Zafar', '358440000019', 'salman.zafar@example.com'),
('Anila Waheed', '358440000020', 'anila.waheed@example.com'),

('Hassan Butt', '358440000021', 'hassan.butt@example.com'),
('Mahnoor Gill', '358440000022', 'mahnoor.gill@example.com'),
('Tahir Abbas', '358440000023', 'tahir.abbas@example.com'),
('Nimra Waheed', '358440000024', 'nimra.waheed@example.com'),
('Junaid Akram', '358440000025', 'junaid.akram@example.com'),
('Amna Saeed', '358440000026', 'amna.saeed@example.com'),
('Khalid Mehmood', '358440000027', 'khalid.mehmood@example.com'),
('Hira Rashid', '358440000028', 'hira.rashid@example.com'),
('Owais Zafar', '358440000029', 'owais.zafar@example.com'),
('Sumbal Ijaz', '358440000030', 'sumbal.ijaz@example.com'),

('Rehan Shafiq', '358440000031', 'rehan.shafiq@example.com'),
('Maryam Junaid', '358440000032', 'maryam.junaid@example.com'),
('Azhar Hayat', '358440000033', 'azhar.hayat@example.com'),
('Sania Yaqoob', '358440000034', 'sania.yaqoob@example.com'),
('Moiz Aftab', '358440000035', 'moiz.aftab@example.com'),
('Sehrish Anwar', '358440000036', 'sehrish.anwar@example.com'),
('Imtiaz Qadir', '358440000037', 'imtiaz.qadir@example.com'),
('Kiran Fatima', '358440000038', 'kiran.fatima@example.com'),
('Hussain Raza', '358440000039', 'hussain.raza@example.com'),
('Nashit Ali', '358440000040', 'nashit.ali@example.com'),

('Arslan Javed', '358440000041', 'arslan.javed@example.com'),
('Sadia Bukhari', '358440000042', 'sadia.bukhari@example.com'),
('Noman Tariq', '358440000043', 'noman.tariq@example.com'),
('Aqsa Nisar', '358440000044', 'aqsa.nisar@example.com'),
('Rizwan Saleem', '358440000045', 'rizwan.saleem@example.com'),
('Farah Sheikh', '358440000046', 'farah.sheikh@example.com'),
('Shahid Anwar2', '358440000047', 'shahid.anwar2@example.com'),
('Komal Aslam', '358440000048', 'komal.aslam@example.com'),
('Salman Rauf', '358440000049', 'salman.rauf@example.com'),
('Anila Khokhar', '358440000050', 'anila.khokhar@example.com'),

('Hassan Malik', '358440000051', 'hassan.malik@example.com'),
('Mahnoor Tariq', '358440000052', 'mahnoor.tariq@example.com'),
('Tahir Junaid', '358440000053', 'tahir.junaid@example.com'),
('Nimra Khalid', '358440000054', 'nimra.khalid@example.com'),
('Junaid Arif', '358440000055', 'junaid.arif@example.com'),
('Amna Farooq', '358440000056', 'amna.farooq@example.com'),
('Khalid Hussain', '358440000057', 'khalid.hussain@example.com'),
('Hira Zahid', '358440000058', 'hira.zahid@example.com'),
('Owais Iqbal', '358440000059', 'owais.iqbal@example.com'),
('Sumbal Tariq', '358440000060', 'sumbal.tariq@example.com');

/*Queries*/
-- Show all users
SELECT * FROM Users;

-- Show only names and emails
SELECT name, email FROM Users;

-- Count total users
SELECT COUNT(*) AS total_users FROM Users;

-- Show the latest registered user
SELECT TOP 1 * 
FROM Users 
ORDER BY registered_at DESC;


-- ==========================
-- 📌 FILTERING & SORTING
-- ==========================

-- Find user by phone
SELECT * FROM Users 
WHERE phone = '1234567890';

-- Find all users with Gmail emails
SELECT * FROM Users 
WHERE email LIKE '%@gmail.com';

-- Show all users ordered by registration date (oldest first)
SELECT * FROM Users 
ORDER BY registered_at ASC;


-- ==========================
-- 📌 AGGREGATE QUERIES
-- ==========================

-- Count users with email and without email
SELECT 
    COUNT(email) AS with_email, 
    COUNT(*) - COUNT(email) AS without_email
FROM Users;

-- Group users by email domain
SELECT RIGHT(email, CHARINDEX('@', REVERSE(email)) - 1) AS domain,
       COUNT(*) AS total_users
FROM Users
WHERE email IS NOT NULL
GROUP BY RIGHT(email, CHARINDEX('@', REVERSE(email)) - 1);


-- ==========================
-- 📌 UPDATE & DELETE
-- ==========================

-- Update phone number of a user
UPDATE Users
SET phone = '9876543210'
WHERE user_id = 5;

-- Delete a user by ID
DELETE FROM Users
WHERE user_id = 10;


-- ==========================
-- 📌 INTERMEDIATE QUERIES
-- ==========================

-- Find users registered in the last 7 days
SELECT * FROM Users
WHERE registered_at >= DATEADD(DAY, -7, GETDATE());

-- Show duplicate names (if any)
SELECT name, COUNT(*) AS total
FROM Users
GROUP BY name
HAVING COUNT(*) > 1;


-- ==========================
-- 📌 ADVANCED QUERIES
-- ==========================

-- Get the 5th latest registered user
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY registered_at DESC) AS rn
    FROM Users
) AS t
WHERE rn = 5;

-- Show top 3 most common email domains
SELECT TOP 3 
    RIGHT(email, CHARINDEX('@', REVERSE(email)) - 1) AS domain,
    COUNT(*) AS total
FROM Users
WHERE email IS NOT NULL
GROUP BY RIGHT(email, CHARINDEX('@', REVERSE(email)) - 1)
ORDER BY total DESC;





-- 2. Parking Lots
CREATE TABLE ParkingLots (
    lot_id INT PRIMARY KEY IDENTITY(1,1),
    lot_name VARCHAR(100) NOT NULL,
    location VARCHAR(200) NOT NULL,
    total_slots INT NOT NULL
);
/*Insertion*/

INSERT INTO ParkingLots (lot_name, location, total_slots) VALUES
('Harbor Parking', 'Turku Ferry Terminal', 350),
('Library Parking', 'Helsinki Central Library Oodi', 90),
('Zoo Parking Lot', 'Korkeasaari Zoo, Helsinki', 200),
('Museum Parking', 'Ateneum Art Museum, Helsinki', 130),
('Convention Center Parking', 'Messukeskus Expo, Helsinki', 600),
('Business District Parking', 'Tampere Business Center', 220),
('Cinema Parking', 'Espoo Cineplex, Iso Omena', 140),
('Hotel Parking', 'Radisson Blu, Oulu', 110),
('Park & Ride Lot A', 'Espoo Metro Station', 300),
('Park & Ride Lot B', 'Vantaa Railway Station', 250),
('Mountain View Parking', 'Rovaniemi Ski Resort', 180),
('Lakefront Parking', 'Jyväskylä Harbour Area', 160),
('Industrial Area Parking', 'Kotka Industrial Zone', 210),
('Sports Arena Parking', 'Lahti Sports Arena', 400),
('Market Square Parking', 'Turku Kauppatori', 120),
('Suburban Parking Lot', 'Espoo Residential District E', 90),
('University Hospital Parking', 'Helsinki University Hospital', 350),
('Science Center Parking', 'Heureka Science Center, Vantaa', 180),
('Botanical Garden Parking', 'University of Helsinki Botanical Gardens', 95),
('Casino Parking', 'Casino Helsinki, City Center', 150);

-------------------------------------------------------
-- BASIC QUERIES
-------------------------------------------------------

-- 1. Show all parking lots
SELECT * FROM ParkingLots;

-- 2. Show only lot name and total slots
SELECT lot_name, total_slots FROM ParkingLots;

-- 3. Count how many parking lots exist
SELECT COUNT(*) AS total_parking_lots FROM ParkingLots;

-- 4. Find all lots located in Helsinki
SELECT * FROM ParkingLots
WHERE location LIKE '%Helsinki%';

-- 5. Sort all lots by total slots (largest → smallest)
SELECT * FROM ParkingLots
ORDER BY total_slots DESC;

-------------------------------------------------------
-- FILTERING & CONDITIONS
-------------------------------------------------------

-- 6. Show parking lots with more than 200 slots
SELECT * FROM ParkingLots
WHERE total_slots > 200;

-- 7. Show lots with capacity between 100 and 300 slots
SELECT * FROM ParkingLots
WHERE total_slots BETWEEN 100 AND 300;

-- 8. Show lots NOT in Espoo
SELECT * FROM ParkingLots
WHERE location NOT LIKE '%Espoo%';

-- 9. Find the first 5 smallest parking lots
SELECT TOP 5 * FROM ParkingLots
ORDER BY total_slots ASC;

-- 10. Find parking lots whose name starts with 'P'
SELECT * FROM ParkingLots
WHERE lot_name LIKE 'P%';

-------------------------------------------------------
-- AGGREGATE FUNCTIONS
-------------------------------------------------------

-- 11. Find the largest parking lot
SELECT TOP 1 * FROM ParkingLots
ORDER BY total_slots DESC;

-- 12. Find the smallest parking lot
SELECT TOP 1 * FROM ParkingLots
ORDER BY total_slots ASC;

-- 13. Find average slots per parking lot
SELECT AVG(total_slots) AS avg_slots FROM ParkingLots;

-- 14. Find total slots across all lots
SELECT SUM(total_slots) AS total_all_slots FROM ParkingLots;

-- 15. Find maximum and minimum slots
SELECT MAX(total_slots) AS max_slots, MIN(total_slots) AS min_slots
FROM ParkingLots;

-------------------------------------------------------
-- GROUPING & ANALYSIS
-------------------------------------------------------

-- 16. Group by city and count lots
SELECT location, COUNT(*) AS num_lots
FROM ParkingLots
GROUP BY location;

-- 17. Group by city and sum total slots
SELECT location, SUM(total_slots) AS total_capacity
FROM ParkingLots
GROUP BY location;

-- 18. Show only cities having more than 2 parking lots
SELECT location, COUNT(*) AS num_lots
FROM ParkingLots
GROUP BY location
HAVING COUNT(*) > 2;

-- 19. Find average slots per city
SELECT location, AVG(total_slots) AS avg_slots
FROM ParkingLots
GROUP BY location;

-------------------------------------------------------
-- ADVANCED FILTERING & SUBQUERIES
-------------------------------------------------------

-- 20. Find lots that have more slots than the average
SELECT * FROM ParkingLots
WHERE total_slots > (SELECT AVG(total_slots) FROM ParkingLots);

-- 21. Find top 3 largest parking lots
SELECT TOP 3 * FROM ParkingLots
ORDER BY total_slots DESC;

-- 22. Find lots with the same number of slots as the maximum
SELECT * FROM ParkingLots
WHERE total_slots = (SELECT MAX(total_slots) FROM ParkingLots);

-- 23. Find lots with the same number of slots as the minimum
SELECT * FROM ParkingLots
WHERE total_slots = (SELECT MIN(total_slots) FROM ParkingLots);

-- 24. Show distinct cities (no duplicates)
SELECT DISTINCT location FROM ParkingLots;

-------------------------------------------------------
-- UPDATES & DELETE (BE CAREFUL 🚨)
-------------------------------------------------------

-- 25. Update slots for a specific lot
UPDATE ParkingLots
SET total_slots = 500
WHERE lot_name = 'Central Parking Lot';

-- 26. Delete a lot (example only, dangerous!)
DELETE FROM ParkingLots
WHERE lot_name = 'Old Town Parking';

-------------------------------------------------------
--  EXTRA: PAGINATION (SHOWING RESULTS IN PAGES)
-------------------------------------------------------

-- 27. Show first 10 lots
SELECT * FROM ParkingLots
ORDER BY lot_id
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- 28. Show next 10 lots (page 2)
SELECT * FROM ParkingLots
ORDER BY lot_id
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;



-- 3. Parking Slots
CREATE TABLE ParkingSlots (
    slot_id INT PRIMARY KEY IDENTITY(1,1),
    lot_id INT,
    slot_number VARCHAR(20),
    is_occupied TINYINT DEFAULT 0, -- TINYINT without (1)
    FOREIGN KEY (lot_id) REFERENCES ParkingLots(lot_id)
);

/*insertion*/
-- Insert data into ParkingSlots with mixed occupancy
INSERT INTO ParkingSlots (lot_id, slot_number, is_occupied) VALUES
(1, 'A1', 0),
(1, 'A2', 1),
(1, 'A3', 0),
(1, 'A4', 1),
(1, 'A5', 0),
(2, 'B1', 0),
(2, 'B2', 0),
(2, 'B3', 1),
(2, 'B4', 0),
(2, 'B5', 1),
(3, 'C1', 1),
(3, 'C2', 0),
(3, 'C3', 0),
(3, 'C4', 1),
(3, 'C5', 0),
(4, 'D1', 0),
(4, 'D2', 1),
(4, 'D3', 1),
(4, 'D4', 0),
(4, 'D5', 0),
(5, 'E1', 1),
(5, 'E2', 0),
(5, 'E3', 0),
(5, 'E4', 1),
(5, 'E5', 0),
(6, 'F1', 0),
(6, 'F2', 1),
(6, 'F3', 0),
(6, 'F4', 0),
(6, 'F5', 1),
(7, 'G1', 1),
(7, 'G2', 0),
(7, 'G3', 1),
(7, 'G4', 0),
(7, 'G5', 0),
(8, 'H1', 0),
(8, 'H2', 1),
(8, 'H3', 0),
(8, 'H4', 1),
(8, 'H5', 0);
/*All queries*/
-- 1. Show all parking slots
SELECT * FROM ParkingSlots;

-- 2. Show only slot number and occupancy status
SELECT slot_number, is_occupied FROM ParkingSlots;

-- 3. Count total parking slots
SELECT COUNT(*) AS total_slots FROM ParkingSlots;

-- 4. Show slots that are currently free
SELECT * FROM ParkingSlots
WHERE is_occupied = 0;

-- 5. Show slots that are currently occupied
SELECT * FROM ParkingSlots
WHERE is_occupied = 1;

-- 6. Show slots for a specific parking lot (lot_id = 1)
SELECT * FROM ParkingSlots
WHERE lot_id = 1;

-- 7. Count free and occupied slots
SELECT is_occupied, COUNT(*) AS num_slots
FROM ParkingSlots
GROUP BY is_occupied;

-- 8. Count free slots per parking lot
SELECT lot_id, COUNT(*) AS free_slots
FROM ParkingSlots
WHERE is_occupied = 0
GROUP BY lot_id;

-- 9. Count occupied slots per parking lot
SELECT lot_id, COUNT(*) AS occupied_slots
FROM ParkingSlots
WHERE is_occupied = 1
GROUP BY lot_id;

-- 10. Show slots with slot number starting with 'A'
SELECT * FROM ParkingSlots
WHERE slot_number LIKE 'A%';

-- 11. Find slots with the maximum slot number (highest A/B/C number)
SELECT TOP 1 * FROM ParkingSlots
ORDER BY slot_number DESC;

-- 12. Find slots with the minimum slot number
SELECT TOP 1 * FROM ParkingSlots
ORDER BY slot_number ASC;

-- 13. Show distinct lot_ids (parking lots that have slots)
SELECT DISTINCT lot_id FROM ParkingSlots;

-- 14. Find the total number of slots per lot
SELECT lot_id, COUNT(*) AS total_slots
FROM ParkingSlots
GROUP BY lot_id;

-- 15. Find lots where all slots are free (none occupied)
SELECT lot_id
FROM ParkingSlots
GROUP BY lot_id
HAVING SUM(is_occupied) = 0;

-- 16. Find lots where all slots are occupied
SELECT lot_id
FROM ParkingSlots
GROUP BY lot_id
HAVING SUM(is_occupied) = COUNT(*);

-- 17. Update a slot to mark it occupied (example slot_id = 3)
UPDATE ParkingSlots
SET is_occupied = 1
WHERE slot_id = 3;

-- 18. Update a slot to mark it free (example slot_id = 4)
UPDATE ParkingSlots
SET is_occupied = 0
WHERE slot_id = 4;

-- 19. Delete a parking slot (example slot_id = 5)
DELETE FROM ParkingSlots
WHERE slot_id = 5;

-- 20. Find slots that are free in a specific lot (lot_id = 2)
SELECT * FROM ParkingSlots
WHERE lot_id = 2 AND is_occupied = 0;

-- 21. Show the total number of free slots across all lots
SELECT SUM(CASE WHEN is_occupied = 0 THEN 1 ELSE 0 END) AS total_free_slots
FROM ParkingSlots;

-- 22. Show the total number of occupied slots across all lots
SELECT SUM(CASE WHEN is_occupied = 1 THEN 1 ELSE 0 END) AS total_occupied_slots
FROM ParkingSlots;

-- 23. Show top 5 lots with most occupied slots
SELECT lot_id, COUNT(*) AS occupied_count
FROM ParkingSlots
WHERE is_occupied = 1
GROUP BY lot_id
ORDER BY occupied_count DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 24. Show top 5 lots with most free slots
SELECT lot_id, COUNT(*) AS free_count
FROM ParkingSlots
WHERE is_occupied = 0
GROUP BY lot_id
ORDER BY free_count DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- 25. Pagination: Show first 10 slots
SELECT * FROM ParkingSlots
ORDER BY slot_id
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- 26. Pagination: Show next 10 slots (page 2)
SELECT * FROM ParkingSlots
ORDER BY slot_id
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- 27. Subquery: Find slots in lots that have more than 1 free slots
SELECT * FROM ParkingSlots
WHERE lot_id IN (
    SELECT lot_id
    FROM ParkingSlots
    WHERE is_occupied = 1
    GROUP BY lot_id
    HAVING COUNT(*) > 1
);




-- 4. Vehicles
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    license_plate VARCHAR(20) UNIQUE NOT NULL,
    vehicle_type VARCHAR(10) NOT NULL CHECK (vehicle_type IN ('Car','Bike','Truck')),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert 
INSERT INTO Vehicles (user_id, license_plate, vehicle_type) VALUES
(1, 'ABC-101', 'Car'),
(2, 'XYZ-202', 'Bike'),
(3, 'LMN-303', 'Truck'),
(4, 'DEF-404', 'Car'),
(5, 'GHI-505', 'Bike'),
(6, 'JKL-606', 'Car'),
(7, 'MNO-707', 'Truck'),
(8, 'PQR-808', 'Car'),
(9, 'STU-909', 'Bike'),
(10, 'VWX-010', 'Car'),
(11, 'YZA-111', 'Truck'),
(12, 'BCD-212', 'Car'),
(13, 'EFG-313', 'Bike'),
(14, 'HIJ-414', 'Car'),
(15, 'KLM-515', 'Truck'),
(16, 'NOP-616', 'Car'),
(17, 'QRS-717', 'Bike'),
(18, 'TUV-818', 'Car'),
(19, 'WXY-919', 'Truck'),
(20, 'ZAB-020', 'Car'),
(21, 'CDE-121', 'Bike'),
(22, 'FGH-222', 'Car'),
(23, 'IJK-323', 'Truck'),
(24, 'LMO-424', 'Car'),
(25, 'PQR-525', 'Bike'),
(26, 'STV-626', 'Car'),
(27, 'WXA-727', 'Truck'),
(28, 'BCD-828', 'Car'),
(29, 'EFH-929', 'Bike'),
(30, 'GHI-030', 'Car'),
(31, 'JKM-131', 'Truck'),
(32, 'NOP-232', 'Car'),
(33, 'QRT-333', 'Bike'),
(34, 'UVW-434', 'Car'),
(35, 'XYZ-535', 'Truck'),
(36, 'ABC-636', 'Car'),
(37, 'DEF-737', 'Bike'),
(38, 'GHI-838', 'Car'),
(39, 'JKL-939', 'Truck'),
(40, 'MNO-040', 'Car'),
(41, 'PQR-141', 'Bike'),
(42, 'STU-242', 'Car'),
(43, 'VWX-343', 'Truck'),
(44, 'YZA-444', 'Car'),
(45, 'BCD-545', 'Bike'),
(46, 'EFG-646', 'Car'),
(47, 'HIJ-747', 'Truck'),
(48, 'KLM-848', 'Car'),
(49, 'NOP-949', 'Bike'),
(50, 'QRS-050', 'Car'),
(51, 'TUV-151', 'Truck'),
(52, 'WXY-252', 'Car'),
(53, 'ZAB-353', 'Bike'),
(54, 'CDE-454', 'Car'),
(55, 'FGH-555', 'Truck'),
(56, 'IJK-656', 'Car'),
(57, 'LMO-757', 'Bike'),
(58, 'PQR-858', 'Car'),
(59, 'STV-959', 'Truck'),
(60, 'WXA-060', 'Car');
/*Queries*/
-- 1. Show all vehicles
SELECT * FROM Vehicles;

-- 2. Show only license plate and vehicle type
SELECT license_plate, vehicle_type FROM Vehicles;

-- 3. Count total vehicles
SELECT COUNT(*) AS total_vehicles FROM Vehicles;

-- 4. Count vehicles by type
SELECT vehicle_type, COUNT(*) AS num_vehicles
FROM Vehicles
GROUP BY vehicle_type;

-- 5. Show vehicles belonging to a specific user (user_id = 5)
SELECT * FROM Vehicles
WHERE user_id = 5;

-- 6. Show vehicles with license plate starting with 'A'
SELECT * FROM Vehicles
WHERE license_plate LIKE 'A%';

-- 7. Update vehicle type (example: vehicle_id = 3 to 'Car')
UPDATE Vehicles
SET vehicle_type = 'Car'
WHERE vehicle_id = 3;

-- 8. Delete a vehicle (example: vehicle_id = 10)
DELETE FROM Vehicles
WHERE vehicle_id = 10;

-- 9. Find distinct vehicle types
SELECT DISTINCT vehicle_type FROM Vehicles;

-- 10. Count vehicles per user
SELECT user_id, COUNT(*) AS vehicles_per_user
FROM Vehicles
GROUP BY user_id;

-- 11. Find users with more than 1 vehicle
SELECT user_id
FROM Vehicles
GROUP BY user_id
HAVING COUNT(*) > 1;

-- 12. Find the vehicle with the highest vehicle_id
SELECT TOP 1 * FROM Vehicles
ORDER BY vehicle_id DESC;

-- 13. Find the vehicle with the lowest vehicle_id
SELECT TOP 1 * FROM Vehicles
ORDER BY vehicle_id ASC;

-- 14. Pagination: Show first 10 vehicles
SELECT * FROM Vehicles
ORDER BY vehicle_id
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- 15. Pagination: Show next 10 vehicles (page 2)
SELECT * FROM Vehicles
ORDER BY vehicle_id
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


-- 5. Reservations
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    slot_id INT,
    reservation_time DATETIME NOT NULL,
    status VARCHAR(10) NOT NULL DEFAULT 'Booked' 
    CHECK (status IN ('Booked','Cancelled','Completed')),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (slot_id) REFERENCES ParkingSlots(slot_id)
);

/*Insertion*/
INSERT INTO Reservations (user_id, slot_id, reservation_time, status) VALUES
(1,  1,  '2025-08-31 08:15:00', 'Completed'),
(2,  2,  '2025-08-31 08:30:00', 'Booked'),
(3,  3,  '2025-08-31 08:45:00', 'Cancelled'),
(4,  4,  '2025-08-31 09:00:00', 'Completed'),
(5,  5,  '2025-08-31 09:15:00', 'Booked'),
(6,  6,  '2025-08-31 09:30:00', 'Completed'),
(7,  7,  '2025-08-31 09:45:00', 'Booked'),
(8,  8,  '2025-08-31 10:00:00', 'Completed'),
(9,  9,  '2025-08-31 10:15:00', 'Cancelled'),
(10, 10, '2025-08-31 10:30:00', 'Booked'),
(11, 11, '2025-08-31 10:45:00', 'Completed'),
(12, 12, '2025-08-31 11:00:00', 'Booked'),
(13, 13, '2025-08-31 11:15:00', 'Completed'),
(14, 14, '2025-08-31 11:30:00', 'Booked'),
(15, 15, '2025-08-31 11:45:00', 'Cancelled'),
(16, 16, '2025-08-31 12:00:00', 'Completed'),
(17, 17, '2025-08-31 12:15:00', 'Booked'),
(18, 18, '2025-08-31 12:30:00', 'Completed'),
(19, 19, '2025-08-31 12:45:00', 'Booked'),
(20, 20, '2025-08-31 13:00:00', 'Completed'),
(21, 21, '2025-09-01 08:00:00', 'Booked'),
(22, 22, '2025-09-01 08:15:00', 'Cancelled'),
(23, 23, '2025-09-01 08:30:00', 'Booked'),
(24, 24, '2025-09-01 08:45:00', 'Completed'),
(25, 25, '2025-09-01 09:00:00', 'Booked'),
(26, 26, '2025-09-01 09:15:00', 'Completed'),
(27, 27, '2025-09-01 09:30:00', 'Booked'),
(28, 28, '2025-09-01 09:45:00', 'Completed'),
(29, 29, '2025-09-01 10:00:00', 'Cancelled'),
(30, 30, '2025-09-01 10:15:00', 'Booked');

/*ALl queries*/

-- ========== BASIC SELECTS ==========

-- 1) All rows
SELECT * FROM Reservations;

-- 2) Specific columns
SELECT reservation_id, user_id, slot_id, reservation_time, status
FROM Reservations;

-- 3) Order by time (oldest → newest / newest → oldest)
SELECT * FROM Reservations ORDER BY reservation_time ASC;
SELECT * FROM Reservations ORDER BY reservation_time DESC;

-- 4) Filter by status
SELECT * FROM Reservations WHERE status = 'Booked';
SELECT * FROM Reservations WHERE status IN ('Cancelled','Completed');

-- 5) Filter by user / slot
SELECT * FROM Reservations WHERE user_id = 5;
SELECT * FROM Reservations WHERE slot_id = 10;

-- ========== DATE/TIME FILTERS ==========

-- 6) Today’s reservations
SELECT * FROM Reservations
WHERE CAST(reservation_time AS DATE) = CAST(GETDATE() AS DATE);

-- 7) Last 24 hours
SELECT * FROM Reservations
WHERE reservation_time >= DATEADD(HOUR, -24, GETDATE());

-- 8) Date range (inclusive start, exclusive end)
SELECT * FROM Reservations
WHERE reservation_time >= '2025-08-31'
  AND reservation_time <  '2025-09-01';

-- 9) Upcoming Booked (now → future)
SELECT reservation_id, user_id, slot_id, reservation_time
FROM Reservations
WHERE status = 'Booked' AND reservation_time >= GETDATE()
ORDER BY reservation_time;

-- ========== AGGREGATIONS ==========

-- 10) Count total reservations
SELECT COUNT(*) AS total_reservations FROM Reservations;

-- 11) Count by status
SELECT status, COUNT(*) AS total
FROM Reservations
GROUP BY status
ORDER BY total DESC;

-- 12) Count per user
SELECT user_id, COUNT(*) AS total_for_user
FROM Reservations
GROUP BY user_id
ORDER BY total_for_user DESC;

-- 13) Users with ≥ 2 COMPLETED reservations
SELECT user_id
FROM Reservations
WHERE status = 'Completed'
GROUP BY user_id
HAVING COUNT(*) >= 2;

-- 14) Hour-of-day distribution (how many per hour)
SELECT DATEPART(HOUR, reservation_time) AS hour_of_day,
       COUNT(*) AS total
FROM Reservations
GROUP BY DATEPART(HOUR, reservation_time)
ORDER BY hour_of_day;

-- ========== TOP-N / PAGINATION ==========

-- 15) Latest 5 reservations
SELECT TOP 5 * FROM Reservations ORDER BY reservation_time DESC;

-- 16) Pagination (page 1: first 10, page 2: next 10)
SELECT * FROM Reservations ORDER BY reservation_time DESC
OFFSET 0 ROWS  FETCH NEXT 10 ROWS ONLY;
SELECT * FROM Reservations ORDER BY reservation_time DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- ========== SUBQUERIES / CTEs ==========

-- 17) Users whose latest reservation is still 'Booked'
WITH Latest AS (
  SELECT user_id, MAX(reservation_time) AS latest_time
  FROM Reservations
  GROUP BY user_id
)
SELECT r.user_id, r.reservation_id, r.status, r.reservation_time
FROM Reservations r
JOIN Latest L
  ON r.user_id = L.user_id AND r.reservation_time = L.latest_time
WHERE r.status = 'Booked';

-- 18) Slots with more reservations than the overall average per slot
WITH SlotCounts AS (
  SELECT slot_id, COUNT(*) AS cnt
  FROM Reservations
  GROUP BY slot_id
)
SELECT slot_id, cnt
FROM SlotCounts
WHERE cnt > (SELECT AVG(1.0 * cnt) FROM SlotCounts);

-- 19) Users who have never had a cancellation
SELECT DISTINCT user_id
FROM Reservations r
WHERE NOT EXISTS (
  SELECT 1 FROM Reservations x
  WHERE x.user_id = r.user_id AND x.status = 'Cancelled'
);

-- ========== WINDOW FUNCTIONS ==========

-- 20) Rank each user's reservations by time (newest = rank 1)
SELECT reservation_id, user_id, slot_id, reservation_time, status,
       ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY reservation_time DESC) AS rn
FROM Reservations;

-- 21) Latest reservation per user (using window filter)
WITH Ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY reservation_time DESC) AS rn
  FROM Reservations
)
SELECT reservation_id, user_id, slot_id, reservation_time, status
FROM Ranked
WHERE rn = 1;

-- 22) Count per status + grand total (ROLLUP)
SELECT ISNULL(status, 'ALL') AS status_group,
       COUNT(*) AS total
FROM Reservations
GROUP BY ROLLUP(status);

-- ========== ANALYTICS / QUALITY CHECKS ==========

-- 23) Status mix per day
SELECT CAST(reservation_time AS DATE) AS res_date, status, COUNT(*) AS total
FROM Reservations
GROUP BY CAST(reservation_time AS DATE), status
ORDER BY res_date, status;

-- 24) Peak day (most reservations in a day)
SELECT TOP 1 CAST(reservation_time AS DATE) AS res_date, COUNT(*) AS total
FROM Reservations
GROUP BY CAST(reservation_time AS DATE)
ORDER BY total DESC;

-- 25) Duplicate logical check (same user, slot, exact timestamp)
SELECT user_id, slot_id, reservation_time, COUNT(*) AS dup_count
FROM Reservations
GROUP BY user_id, slot_id, reservation_time
HAVING COUNT(*) > 1;

-- ========== DML (UPDATE / DELETE) ==========

-- 26) Mark a specific reservation as Cancelled (example id)
UPDATE Reservations
SET status = 'Cancelled'
WHERE reservation_id = 10;

-- 27) Bulk: Convert all past 'Booked' (missed) to 'Cancelled'
UPDATE Reservations
SET status = 'Cancelled'
WHERE status = 'Booked'
  AND reservation_time < GETDATE();

-- 28) Delete old cancelled reservations (e.g., older than 30 days)
DELETE FROM Reservations
WHERE status = 'Cancelled'
  AND reservation_time < DATEADD(DAY, -30, GETDATE());

-- ========== SAFETY / INSIGHT ==========

-- 29) How many future reservations exist?
SELECT COUNT(*) AS upcoming_booked
FROM Reservations
WHERE status = 'Booked' AND reservation_time >= GETDATE();

-- 30) Next 10 reservations to serve (queue view)
SELECT TOP 10 reservation_id, user_id, slot_id, reservation_time
FROM Reservations
WHERE status = 'Booked'
ORDER BY reservation_time ASC;

-- 6. Parking Records
CREATE TABLE ParkingRecords (
    record_id INT PRIMARY KEY IDENTITY(1,1),
    vehicle_id INT,
    slot_id INT,
    entry_time DATETIME NOT NULL,
    exit_time DATETIME,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (slot_id) REFERENCES ParkingSlots(slot_id)
);

/*Insert data*/
INSERT INTO ParkingRecords (vehicle_id, slot_id, entry_time,           exit_time) VALUES
(1,  1,  '2025-08-31 08:20:00', '2025-08-31 09:40:00'),
(2,  2,  '2025-08-31 08:35:00', '2025-08-31 10:10:00'),
(3,  3,  '2025-08-31 08:50:00', '2025-08-31 10:05:00'),
(4,  4,  '2025-08-31 09:05:00', '2025-08-31 10:55:00'),
(5,  5,  '2025-08-31 09:20:00', '2025-08-31 10:00:00'),
(6,  6,  '2025-08-31 09:35:00', '2025-08-31 11:25:00'),
(7,  7,  '2025-08-31 09:50:00', '2025-08-31 11:35:00'),
(8,  8,  '2025-08-31 10:05:00', '2025-08-31 11:10:00'),
(9,  9,  '2025-08-31 10:20:00', '2025-08-31 12:00:00'),
(10, 10, '2025-08-31 10:35:00', '2025-08-31 12:40:00'),
(11, 11, '2025-08-31 10:50:00', '2025-08-31 12:05:00'),
(12, 12, '2025-08-31 11:05:00', '2025-08-31 12:10:00'),
(13, 13, '2025-08-31 11:20:00', '2025-08-31 12:25:00'),
(14, 14, '2025-08-31 11:35:00', '2025-08-31 12:50:00'),
(15, 15, '2025-08-31 11:50:00', '2025-08-31 13:20:00'),
(16, 16, '2025-08-31 12:05:00', '2025-08-31 13:10:00'),
(17, 17, '2025-08-31 12:20:00', '2025-08-31 13:45:00'),
(18, 18, '2025-08-31 12:35:00', '2025-08-31 14:20:00'),
(19, 19, '2025-08-31 12:50:00', '2025-08-31 14:00:00'),
(20, 20, '2025-08-31 13:05:00', '2025-08-31 14:55:00'),
(21, 21, '2025-09-01 08:05:00', '2025-09-01 09:20:00'),
(22, 22, '2025-09-01 08:20:00', '2025-09-01 10:05:00'),
(23, 23, '2025-09-01 08:35:00', '2025-09-01 09:35:00'),
(24, 24, '2025-09-01 08:50:00', '2025-09-01 10:30:00'),
(25, 25, '2025-09-01 09:05:00', '2025-09-01 10:50:00'),
(26, 26, '2025-09-01 09:20:00', '2025-09-01 10:25:00'),
(27, 27, '2025-09-01 09:35:00', '2025-09-01 11:55:00'),
(28, 28, '2025-09-01 09:50:00', '2025-09-01 11:10:00'),
(29, 29, '2025-09-01 10:05:00', '2025-09-01 12:25:00'),
(30, 30, '2025-09-01 10:20:00', '2025-09-01 11:50:00');

-- ============== BASIC SELECTS ==============

-- 1) All records
SELECT * FROM ParkingRecords;

-- 2) Specific columns
SELECT record_id, vehicle_id, slot_id, entry_time, exit_time
FROM ParkingRecords;

-- 3) Sort by entry time (oldest/newest)
SELECT * FROM ParkingRecords ORDER BY entry_time ASC;
SELECT * FROM ParkingRecords ORDER BY entry_time DESC;

-- 4) Active sessions (still parked)
SELECT record_id, vehicle_id, slot_id, entry_time
FROM ParkingRecords
WHERE exit_time IS NULL;

-- 5) Completed sessions (have exit_time)
SELECT record_id, vehicle_id, slot_id, entry_time, exit_time
FROM ParkingRecords
WHERE exit_time IS NOT NULL;

-- ============== DATE/TIME FILTERS ==============

-- 6) Today’s sessions (by entry date)
SELECT * FROM ParkingRecords
WHERE CAST(entry_time AS DATE) = CAST(GETDATE() AS DATE);

-- 7) Last 24 hours (by entry_time)
SELECT * FROM ParkingRecords
WHERE entry_time >= DATEADD(HOUR, -24, GETDATE());

-- 8) Date range (inclusive start, exclusive end)
SELECT * FROM ParkingRecords
WHERE entry_time >= '2025-08-31' AND entry_time < '2025-09-01';

-- 9) Sessions started in a specific hour (e.g., 10 AM)
SELECT * FROM ParkingRecords
WHERE DATEPART(HOUR, entry_time) = 10;

-- ============== DURATION / DERIVED METRICS ==============

-- 10) Duration in minutes for completed sessions
SELECT record_id,
       DATEDIFF(MINUTE, entry_time, exit_time) AS minutes_parked
FROM ParkingRecords
WHERE exit_time IS NOT NULL
ORDER BY minutes_parked DESC;

-- 11) Duration in hours (rounded up to next hour)
SELECT record_id,
       CEILING(DATEDIFF(MINUTE, entry_time, exit_time) / 60.0) AS hours_rounded
FROM ParkingRecords
WHERE exit_time IS NOT NULL;

-- 12) Average / Max / Min duration (minutes)
SELECT
  AVG(DATEDIFF(MINUTE, entry_time, exit_time)) AS avg_minutes,
  MAX(DATEDIFF(MINUTE, entry_time, exit_time)) AS max_minutes,
  MIN(DATEDIFF(MINUTE, entry_time, exit_time)) AS min_minutes
FROM ParkingRecords
WHERE exit_time IS NOT NULL;

-- 13) Estimated bill at 2.50 per hour (rounded up)
SELECT record_id,
       CEILING(DATEDIFF(MINUTE, entry_time, exit_time) / 60.0) AS hours,
       CAST(CEILING(DATEDIFF(MINUTE, entry_time, exit_time) / 60.0) * 2.50 AS DECIMAL(10,2)) AS est_amount
FROM ParkingRecords
WHERE exit_time IS NOT NULL;

-- ============== GROUPING / AGGREGATION ==============

-- 14) Sessions per slot (utilization)
SELECT slot_id, COUNT(*) AS total_sessions
FROM ParkingRecords
GROUP BY slot_id
ORDER BY total_sessions DESC;

-- 15) Sessions per vehicle
SELECT vehicle_id, COUNT(*) AS total_sessions
FROM ParkingRecords
GROUP BY vehicle_id
ORDER BY total_sessions DESC;

-- 16) Hour-of-day distribution (by entry time)
SELECT DATEPART(HOUR, entry_time) AS hour_of_day,
       COUNT(*) AS sessions
FROM ParkingRecords
GROUP BY DATEPART(HOUR, entry_time)
ORDER BY hour_of_day;

-- 17) Days with more than N sessions (e.g., > 5)
SELECT CAST(entry_time AS DATE) AS day_, COUNT(*) AS sessions
FROM ParkingRecords
GROUP BY CAST(entry_time AS DATE)
HAVING COUNT(*) > 5
ORDER BY day_ DESC;

-- ============== TOP-N / PAGINATION ==============

-- 18) Top 5 longest sessions
SELECT TOP 5 record_id,
       DATEDIFF(MINUTE, entry_time, exit_time) AS minutes_parked
FROM ParkingRecords
WHERE exit_time IS NOT NULL
ORDER BY minutes_parked DESC;

-- 19) Pagination (page 1 = first 10, page 2 = next 10)
SELECT * FROM ParkingRecords ORDER BY record_id
OFFSET 0 ROWS  FETCH NEXT 10 ROWS ONLY;
SELECT * FROM ParkingRecords ORDER BY record_id
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- ============== WINDOW FUNCTIONS ==============

-- 20) Rank sessions by duration (completed only)
SELECT record_id,
       DATEDIFF(MINUTE, entry_time, exit_time) AS minutes_parked,
       RANK() OVER (ORDER BY DATEDIFF(MINUTE, entry_time, exit_time) DESC) AS duration_rank
FROM ParkingRecords
WHERE exit_time IS NOT NULL;

-- 21) For each vehicle, latest session (by entry time)
WITH Ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY vehicle_id ORDER BY entry_time DESC) AS rn
  FROM ParkingRecords
)
SELECT record_id, vehicle_id, slot_id, entry_time, exit_time
FROM Ranked
WHERE rn = 1;

-- ============== SUBQUERIES / ANALYTICS ==============

-- 22) Sessions longer than overall average
SELECT record_id, vehicle_id, slot_id, entry_time, exit_time
FROM ParkingRecords
WHERE exit_time IS NOT NULL
  AND DATEDIFF(MINUTE, entry_time, exit_time) >
      (SELECT AVG(DATEDIFF(MINUTE, entry_time, exit_time))
       FROM ParkingRecords WHERE exit_time IS NOT NULL);

-- 23) Slots whose avg duration > global avg duration
WITH SlotAvg AS (
  SELECT slot_id,
         AVG(DATEDIFF(MINUTE, entry_time, exit_time)) AS avg_min
  FROM ParkingRecords
  WHERE exit_time IS NOT NULL
  GROUP BY slot_id
)
SELECT slot_id, avg_min
FROM SlotAvg
WHERE avg_min >
     (SELECT AVG(DATEDIFF(MINUTE, entry_time, exit_time))
      FROM ParkingRecords WHERE exit_time IS NOT NULL)
ORDER BY avg_min DESC;

-- 24) Vehicles that have at least 2 sessions
SELECT vehicle_id
FROM ParkingRecords
GROUP BY vehicle_id
HAVING COUNT(*) >= 2;

-- 25) Peak day (most sessions by entry date)
SELECT TOP 1 CAST(entry_time AS DATE) AS day_, COUNT(*) AS sessions
FROM ParkingRecords
GROUP BY CAST(entry_time AS DATE)
ORDER BY sessions DESC;

-- ============== DATA MAINTENANCE (EXAMPLES) ==============

-- 26) Close an active session now (example record_id)
UPDATE ParkingRecords
SET exit_time = GETDATE()
WHERE record_id = 3 AND exit_time IS NULL;

-- 27) Correct a wrong exit_time (example)
UPDATE ParkingRecords
SET exit_time = DATEADD(MINUTE, 15, exit_time)
WHERE record_id = 2;

-- 28) Delete a bad/duplicate record safely (example id unlikely)
DELETE FROM ParkingRecords
WHERE record_id = -1;  -- no-op safety

-- ============== QUALITY / INTEGRITY CHECKS ==============

-- 29) Detect negative or zero durations (data issues)
SELECT record_id, entry_time, exit_time
FROM ParkingRecords
WHERE exit_time IS NOT NULL
  AND DATEDIFF(MINUTE, entry_time, exit_time) <= 0;

-- 30) Detect overlapping sessions per vehicle (same vehicle parked twice at once)
-- (Simplified: overlaps if a later entry_time < earlier exit_time)
WITH Ordered AS (
  SELECT *,
         LAG(exit_time) OVER (PARTITION BY vehicle_id ORDER BY entry_time) AS prev_exit
  FROM ParkingRecords
)
SELECT record_id, vehicle_id, entry_time, exit_time, prev_exit
FROM Ordered
WHERE prev_exit IS NOT NULL AND entry_time < prev_exit;


-- 7. Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    record_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_time DATETIME DEFAULT GETDATE(),
    method VARCHAR(10) NOT NULL CHECK (method IN ('Cash','Card','Online')),
    FOREIGN KEY (record_id) REFERENCES ParkingRecords(record_id)
);

/*Insert data*/
INSERT INTO Payments (record_id, amount, payment_time, method) VALUES
(1,  3.00, '2025-08-31 09:45:00', 'Cash'),
(2,  5.00, '2025-08-31 10:15:00', 'Card'),
(3,  3.00, '2025-08-31 10:10:00', 'Online'),
(4,  5.00, '2025-08-31 11:00:00', 'Cash'),
(5,  2.50, '2025-08-31 10:05:00', 'Card'),
(6,  5.00, '2025-08-31 11:30:00', 'Online'),
(7,  5.00, '2025-08-31 11:40:00', 'Cash'),
(8,  3.00, '2025-08-31 11:15:00', 'Card'),
(9,  5.00, '2025-08-31 12:05:00', 'Online'),
(10, 6.00, '2025-08-31 12:45:00', 'Cash'),
(11, 3.00, '2025-08-31 12:10:00', 'Card'),
(12, 2.50, '2025-08-31 12:15:00', 'Online'),
(13, 3.00, '2025-08-31 12:30:00', 'Cash'),
(14, 3.00, '2025-08-31 12:55:00', 'Card'),
(15, 4.00, '2025-08-31 13:25:00', 'Online'),
(16, 3.00, '2025-08-31 13:15:00', 'Cash'),
(17, 4.00, '2025-08-31 13:50:00', 'Card'),
(18, 5.00, '2025-08-31 14:25:00', 'Online'),
(19, 3.00, '2025-08-31 14:05:00', 'Cash'),
(20, 5.00, '2025-08-31 15:00:00', 'Card'),
(21, 2.50, '2025-09-01 09:25:00', 'Online'),
(22, 5.00, '2025-09-01 10:10:00', 'Cash'),
(23, 2.50, '2025-09-01 09:40:00', 'Card'),
(24, 3.00, '2025-09-01 10:35:00', 'Online'),
(25, 3.00, '2025-09-01 10:55:00', 'Cash'),
(26, 2.50, '2025-09-01 10:30:00', 'Card'),
(27, 6.00, '2025-09-01 12:00:00', 'Online'),
(28, 3.00, '2025-09-01 11:15:00', 'Cash'),
(29, 5.00, '2025-09-01 12:30:00', 'Card'),
(30, 3.00, '2025-09-01 11:55:00', 'Online');

/*All queries*/
-- All rows
SELECT * FROM Payments;

-- Specific columns
SELECT payment_id, record_id, amount, payment_time, method
FROM Payments;

-- Distinct payment methods
SELECT DISTINCT method FROM Payments;

-- Ordered by time / amount
SELECT * FROM Payments ORDER BY payment_time DESC;
SELECT * FROM Payments ORDER BY amount DESC, payment_time DESC;

-- Top N rows (e.g., top 5 by amount)
SELECT TOP 5 * FROM Payments ORDER BY amount DESC;

-- Pagination (page 1: first 10, page 2: next 10)
SELECT * FROM Payments ORDER BY payment_time DESC
OFFSET 0 ROWS  FETCH NEXT 10 ROWS ONLY;
SELECT * FROM Payments ORDER BY payment_time DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

---------------------------------------------------------------
-- FILTERS (WHERE)
---------------------------------------------------------------

-- By method
SELECT * FROM Payments WHERE method = 'Card';

-- Amount ranges
SELECT * FROM Payments WHERE amount BETWEEN 3.00 AND 6.00;
SELECT * FROM Payments WHERE amount >= 5.00;

-- Date/time filters
SELECT * FROM Payments
WHERE CAST(payment_time AS DATE) = CAST(GETDATE() AS DATE); -- today

SELECT * FROM Payments
WHERE payment_time >= DATEADD(DAY,-7, GETDATE()); -- last 7 days

-- Specific date range (inclusive start, exclusive end)
SELECT * FROM Payments
WHERE payment_time >= '2025-08-31' AND payment_time < '2025-09-02';

---------------------------------------------------------------
-- AGGREGATES
---------------------------------------------------------------

-- Total count / revenue / basic stats
SELECT
  COUNT(*)                AS total_payments,
  SUM(amount)             AS total_revenue,
  AVG(amount)             AS avg_amount,
  MIN(amount)             AS min_amount,
  MAX(amount)             AS max_amount
FROM Payments;

-- Revenue by method
SELECT method, COUNT(*) AS num_payments, SUM(amount) AS revenue, AVG(amount) AS avg_amount
FROM Payments
GROUP BY method
ORDER BY revenue DESC;

-- Revenue by day
SELECT CAST(payment_time AS DATE) AS pay_date,
       COUNT(*) AS num_payments,
       SUM(amount) AS day_revenue
FROM Payments
GROUP BY CAST(payment_time AS DATE)
ORDER BY pay_date DESC;

-- HAVING examples (only methods with revenue > 20)
SELECT method, SUM(amount) AS revenue
FROM Payments
GROUP BY method
HAVING SUM(amount) > 20;

---------------------------------------------------------------
-- SUBQUERIES
---------------------------------------------------------------

-- Payments strictly above overall average amount
SELECT *
FROM Payments
WHERE amount > (SELECT AVG(amount) FROM Payments);

-- Payments above their method-specific average (correlated)
SELECT p.*
FROM Payments AS p
WHERE p.amount > (
  SELECT AVG(p2.amount) FROM Payments AS p2
  WHERE p2.method = p.method
);

-- Payments on the max-revenue day
SELECT *
FROM Payments
WHERE CAST(payment_time AS DATE) = (
  SELECT TOP 1 CAST(payment_time AS DATE)
  FROM Payments
  GROUP BY CAST(payment_time AS DATE)
  ORDER BY SUM(amount) DESC
);

---------------------------------------------------------------
-- WINDOW FUNCTIONS (ANALYTICS)
---------------------------------------------------------------

-- Rank payments by amount (global)
SELECT payment_id, record_id, amount, method, payment_time,
       RANK()       OVER (ORDER BY amount DESC)       AS amt_rank,
       DENSE_RANK() OVER (ORDER BY amount DESC)       AS amt_dense_rank,
       ROW_NUMBER() OVER (ORDER BY amount DESC)       AS amt_rownum
FROM Payments;

-- Rank payments by amount within each method
SELECT payment_id, record_id, amount, method, payment_time,
       ROW_NUMBER() OVER (PARTITION BY method ORDER BY amount DESC) AS rank_in_method
FROM Payments;

-- Running totals (overall, ordered by time)
SELECT payment_id, amount, payment_time,
       SUM(amount) OVER (ORDER BY payment_time
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM Payments
ORDER BY payment_time;

-- Running totals per method (partition)
SELECT method, payment_id, amount, payment_time,
       SUM(amount) OVER (PARTITION BY method ORDER BY payment_time
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_by_method
FROM Payments
ORDER BY method, payment_time;

-- Percentiles / quartiles with NTILE
SELECT payment_id, amount, method,
       NTILE(4) OVER (ORDER BY amount) AS amount_quartile
FROM Payments;

---------------------------------------------------------------
-- ROLLUP / CUBE (SUMMARY ROWS)
---------------------------------------------------------------

-- Revenue by method with grand total
SELECT ISNULL(method,'ALL') AS method_group,
       COUNT(*) AS num_payments,
       SUM(amount) AS revenue
FROM Payments
GROUP BY ROLLUP(method);

-- Revenue by day and method + subtotals + grand total
SELECT
  ISNULL(CONVERT(date, payment_time),'ALL-DATES') AS pay_date,
  ISNULL(method,'ALL-METHODS')                   AS method_group,
  SUM(amount)                                    AS revenue
FROM Payments
GROUP BY ROLLUP (CONVERT(date, payment_time), method)
ORDER BY pay_date DESC, method_group;

---------------------------------------------------------------
-- PIVOT (METHODS AS COLUMNS)
---------------------------------------------------------------

-- Revenue per day spread across columns: Cash/Card/Online
WITH Daily AS (
  SELECT CAST(payment_time AS DATE) AS pay_date, method, amount
  FROM Payments
)
SELECT pay_date, ISNULL([Cash],0) AS Cash, ISNULL([Card],0) AS Card, ISNULL([Online],0) AS Online,
       ISNULL([Cash],0)+ISNULL([Card],0)+ISNULL([Online],0) AS total
FROM Daily
PIVOT (SUM(amount) FOR method IN ([Cash],[Card],[Online])) AS p
ORDER BY pay_date DESC;

---------------------------------------------------------------
-- QA / DATA HEALTH CHECKS
---------------------------------------------------------------

-- Negative or zero amounts (should be none)
SELECT * FROM Payments WHERE amount <= 0;

-- Methods outside allowed list (should be none due to CHECK)
SELECT * FROM Payments WHERE method NOT IN ('Cash','Card','Online');

-- Orphan payments (record_id missing in ParkingRecords) — integrity check via NOT EXISTS
SELECT p.*
FROM Payments p
WHERE NOT EXISTS (SELECT 1 FROM ParkingRecords r WHERE r.record_id = p.record_id);

-- Duplicate payments for the same record_id (should be ≤ 1 ideally)
SELECT record_id, COUNT(*) AS cnt
FROM Payments
GROUP BY record_id
HAVING COUNT(*) > 1;

---------------------------------------------------------------
-- DML EXAMPLES (USE CAREFULLY)
---------------------------------------------------------------

-- Update method (example)
UPDATE Payments
SET method = 'Card'
WHERE payment_id = 7;

-- Increase all payments before a date by 5% (e.g., historical adjustment)
UPDATE Payments
SET amount = CAST(amount * 1.05 AS DECIMAL(10,2))
WHERE payment_time < '2025-09-01';

-- Delete a specific payment (example; use with caution)
DELETE FROM Payments
WHERE payment_id = -1;  -- safe no-op example

---------------------------------------------------------------
-- SEARCH / PATTERN EXAMPLES
---------------------------------------------------------------

-- Find payments done in a specific hour (e.g., 10 AM)
SELECT * FROM Payments
WHERE DATEPART(HOUR, payment_time) = 10;

-- Bucketize by amount bands (case expression)
SELECT
  CASE
    WHEN amount < 3.00 THEN 'Under 3'
    WHEN amount BETWEEN 3.00 AND 4.99 THEN '3 to <5'
    WHEN amount BETWEEN 5.00 AND 6.99 THEN '5 to <7'
    ELSE '7+'
  END AS amount_band,
  COUNT(*) AS cnt,
  SUM(amount) AS revenue
FROM Payments
GROUP BY CASE
    WHEN amount < 3.00 THEN 'Under 3'
    WHEN amount BETWEEN 3.00 AND 4.99 THEN '3 to <5'
    WHEN amount BETWEEN 5.00 AND 6.99 THEN '5 to <7'
    ELSE '7+'
  END
ORDER BY MIN(amount) ASC; -- forces logical band order