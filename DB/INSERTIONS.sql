INSERT INTO USERS (f_name, l_name, user_password, email, preference, user_type, birthdate, room)
VALUES 
('Ahmed', 'Khalil', 'password1', 'ahmed.khalil@example.com', 'Non-smoking', 'Admin', '1990-01-15', 1),
('Sara', 'Ali', 'password2', 'sara.ali@example.com', 'Ocean View', 'Admin', '1985-05-22', 2),
('Layla', 'Mustafa', 'password3', 'layla.mustafa@example.com', 'City View', 'Admin', '1992-08-30', 3),
('Mohamed', 'Abdullah', 'password4', 'mohamed.abdullah@example.com', 'Non-smoking', 'Admin', '1988-04-12', 4),
('Fatima', 'Ali', 'password5', 'fatima.ali@example.com', 'Ocean View', 'Admin', '1995-11-05', 5),
('Mahmoud', 'Ali', 'password6', 'mahmoud.ali@example.com', 'City View', 'Guest', '1983-07-18', 6),
('Nour', 'Ahmed', 'password7', 'nour.ahmed@example.com', 'Non-smoking', 'Guest', '1990-03-25', 7),
('Lama', 'Hussein', 'password8', 'lama.hussein@example.com', 'Garden View', 'Guest', '1994-09-14', 2),
('Yousef', 'Mahmoud', 'password9', 'yousef.mahmoud@example.com', 'Ocean View', 'Guest', '1987-12-01', 4),
('Hala', 'Adel', 'password10', 'hala.adel@example.com', 'City View', 'Guest', '1991-06-08', 3);


INSERT INTO Admin (admin_id, no_of_guests_allowed, salary)
VALUES (1, 5, 60000),
       (2, 3, 70000),
       (3, 4, 55000),
       (4, 6, 75000),
       (5, 4, 60000);


     select * from USERS
     SELECT * FROM Room
     
     Update USERS
     SET Room=1
     WHERE id=1
     SELECT * from Room

INSERT INTO Guest (guest_id, guest_of, guest_address, arrival_date, departure_date, residential)
VALUES (6, 1, 'Marjan Street', '2023-01-10', '2023-01-20', 'Work'),
       (7, 2, 'Zahoor Street', '2023-02-05', '2023-02-15', 'Vacation'),
       (8, 3, 'Amal Street', '2023-03-15', '2023-03-25', 'Work'),
       (9, 4, 'Saada Street', '2023-04-02', '2023-04-10', 'Vacation'),
       (10,5, 'Sakeena Street', '2023-05-10', '2023-05-20', 'Work');


INSERT INTO Device (room, device_type, device_status, battery_status)
VALUES (1, 'Lamp', 'On', 80),
       (2, 'Air Conditioner', 'On', 95),
       (3, 'TV', 'On', 70),
       (4, 'Refrigerator', 'On', 90),
       (5, 'Audio Device', 'On', 75),
       (1, 'Lamp2', 'On', 0),
       (1, 'Lamp3', 'On', 0);


INSERT INTO Room (room_type, room_floor, room_status)
VALUES ('Bedroom', '1st Floor', 'Vacant'),
       ('Bedroom', '2nd Floor', 'Vacant'),
       ('Bedroom', '3rd Floor', 'Vacant'),
       ('Bedroom', '4th Floor', 'Vacant'),
       ('Bedroom', '5th Floor', 'Vacant'),
       ('Living Room', '6th Floor', 'Vacant'),
       ('garden', '7th Floor', 'Vacant');


INSERT INTO Calender (user_assigned_to, event_name, event_description, event_location, reminder_date)
VALUES (1, 'Meeting', 'Project Discussion', 'Conference Room', '2023-04-01'),
       (2, 'Conference', 'Team Building', 'Event Hall', '2023-03-20');


INSERT INTO Task (task_name, creation_date, due_date, category, creator, task_status, reminder_date, task_priority)
VALUES ('Review Reports', '2023-03-01', '2023-03-15', 'Management', 1, 'Pending', '2023-03-10', 'High'),
       ('Prepare Presentation', '2023-02-15', '2023-02-28', 'Presentation', 4, 'In Progress', '2023-02-25', 'Medium'),
       ('Correct Errors', '2023-02-20', '2023-03-05', 'Development', 3, 'Pending', '2023-02-28', 'High');

       Select * From Task
       Select * From Assigned_to


INSERT INTO Assigned_to (user__id,task_id,admin_id) VALUES(6,2,1)

INSERT INTO Preferences (preference_no, user__id,content,category) VALUES(1,6,'c','c')

INSERT INTO Travel
    (hotel_name, destination, ingoing_flight_num, outgoing_flight_num, ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport, outgoing_flight_airport, transport)
VALUES
    ('Hotel A', 'City X', 123, 456, '2023-01-15', '2023-01-20', 'Airport X', 'Airport Y', 'Car');
INSERT INTO Travel
    (hotel_name, destination, ingoing_flight_num, outgoing_flight_num, ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport, outgoing_flight_airport, transport)
VALUES
    ('Hotel B', 'City Y', 789, 987, '2023-02-10', '2023-02-15', 'Airport P', 'Airport Q', 'Train');

INSERT INTO Travel
    (hotel_name, destination, ingoing_flight_num, outgoing_flight_num, ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport, outgoing_flight_airport, transport)
VALUES
    ('Hotel C', 'City Z', 555, 444, '2023-03-05', '2023-03-10', 'Airport M', 'Airport N', 'Bus');

INSERT INTO Travel
    (hotel_name, destination, ingoing_flight_num, outgoing_flight_num, ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport, outgoing_flight_airport, transport)
VALUES
    ('Hotel D', 'City P', 111, 222, '2023-04-20', '2023-04-25', 'Airport T', 'Airport U', 'Car');
INSERT INTO Travel
    (hotel_name, destination, ingoing_flight_num, outgoing_flight_num, ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport, outgoing_flight_airport, transport)
VALUES
    ('Hotel E', 'City Q', 333, 999, '2023-05-15', '2023-05-20', 'Airport K', 'Airport L', 'Train');


SELECT * FROM Task
