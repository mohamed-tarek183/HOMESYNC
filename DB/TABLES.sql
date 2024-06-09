CREATE DATABASE HOMESYNC_DB
CREATE TABLE Room
(
room_id int IDENTITY PRIMARY KEY,
room_type VARCHAR(20),
room_floor VARCHAR(20),
room_status VARCHAR(20)
);

CREATE TABLE USERS
(
id int IDENTITY PRIMARY KEY,
f_name VARCHAR(50),
l_name VARCHAR(50),
user_password VARCHAR(50),
email VARCHAR(50),
preference VARCHAR(50),
user_type VARCHAR (50),
birthdate datetime,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birthdate)),
room int,
FOREIGN KEY(room) REFERENCES Room(room_id)
ON UPDATE CASCADE 
ON DELETE SET NULL

);

SELECT * FROM USERS


CREATE TABLE Admin
(
admin_id int PRIMARY KEY ,
FOREIGN KEY (admin_id) REFERENCES USERS(id)
ON UPDATE CASCADE ON DELETE CASCADE,
no_of_guests_allowed int ,
salary int

);
CREATE TABLE Guest
(
guest_id int PRIMARY KEY,
FOREIGN KEY (guest_id) REFERENCES USERS(id)
ON UPDATE CASCADE ON DELETE CASCADE,
guest_of int,
FOREIGN KEY (guest_of) REFERENCES USERS(id)
ON UPDATE NO ACTION ON DELETE NO ACTION,
guest_address VARCHAR(255),
arrival_date DATE,
departure_date DATE,
residential VARCHAR(20),
);

CREATE TABLE Task
(
task_id int IDENTITY PRIMARY KEY,
task_name VARCHAR(20),
creation_date datetime,
due_date datetime,
category VARCHAR(20),
creator int,
FOREIGN KEY (creator) REFERENCES Admin(admin_id)
ON UPDATE CASCADE ON DELETE  CASCADE,
task_status VARCHAR(20),
reminder_date datetime,
task_priority VARCHAR(20)
);






CREATE TABLE Assigned_to
(
admin_id int ,
FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
task_id int ,
FOREIGN KEY (task_id) REFERENCES Task(task_id)
ON UPDATE NO ACTION
ON DELETE  NO ACTION,
user__id int ,
FOREIGN KEY (user__id) REFERENCES USERS(id)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
primary key (admin_id, task_id,user__id),


);
CREATE TABLE Calender
(
event_id int IDENTITY,
user_assigned_to int,
event_name VARCHAR(20),
event_description VARCHAR(20),
event_location VARCHAR(20),
reminder_date DATE,
primary key(event_id,user_assigned_to),
FOREIGN KEY (user_assigned_to) REFERENCES USERS(id)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE Notes 
(
id int IDENTITY PRIMARY KEY,
user__id int,
content VARCHAR(20),
creation_date datetime,
title VARCHAR(20),
FOREIGN KEY (user__id)  REFERENCES USERS(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);


CREATE TABLE Travel
(
trip_no int IDENTITY PRIMARY KEY,
hotel_name VARCHAR(50),
destination VARCHAR(50),
ingoing_flight_num int,
outgoing_flight_num int,
ingoing_flight_date datetime,
outgoing_flight_date datetime,
ingoing_flight_airport VARCHAR(50),
outgoing_flight_airport VARCHAR(50),
transport VARCHAR(50)
);


CREATE TABLE User_trip
(
trip_no int,
user__id int,
hotel_rooom_no int,
in_going_flight_seat_number int,
out_going_flight_seat_number int,
primary key(trip_no,user__id),
FOREIGN KEY (trip_no)  REFERENCES Travel(trip_no)
ON UPDATE CASCADE
ON DELETE CASCADE
,
FOREIGN KEY (user__id)  REFERENCES USERS(id)
ON UPDATE CASCADE
ON DELETE CASCADE


);
CREATE TABLE Finance
(
payment_id int IDENTITY PRIMARY KEY,
user__id int,
payment_type VARCHAR(20),
amount decimal(13,2),
currency VARCHAR(20),
method VARCHAR(20),
payment_status VARCHAR(20),
payment_date datetime,
receipt_no int,
deadline datetime,
penalty int,
FOREIGN KEY (user__id)  REFERENCES USERS(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);



CREATE TABLE Health
(
health_date DATE,
activity VARCHAR(20),
user__id int,
hours_slept int,
food VARCHAR(20),
primary key(health_date,activity),
FOREIGN KEY (user__id)  REFERENCES USERS(id)
ON UPDATE CASCADE
ON DELETE CASCADE

);

CREATE TABLE Communication
(
message_id int IDENTITY PRIMARY KEY,
sender_id int,
receiver_id int,
content VARCHAR(200),
time_sent TIME,
time_received TIME,
time_read TIME,
title VARCHAR(20),
FOREIGN KEY (sender_id)  REFERENCES USERS(id)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
FOREIGN KEY (receiver_id)  REFERENCES USERS(id)
ON UPDATE NO ACTION
ON DELETE NO ACTION
);


CREATE TABLE Device
(
device_id int IDENTITY PRIMARY KEY,
room int,
device_type VARCHAR(20),
device_status VARCHAR(20),
battery_status int,
FOREIGN KEY (room)  REFERENCES Room(room_id)
ON UPDATE CASCADE
ON DELETE  CASCADE,
);

CREATE TABLE RoomSchedule 
(
creator_id int,
RoomSchedule_action VARCHAR(20),
room int,
start_time datetime,
end_time datetime,
primary key(creator_id,start_time),
FOREIGN KEY (creator_id)  REFERENCES USERS(id)
ON UPDATE NO ACTION
ON DELETE  NO ACTION,
FOREIGN KEY (room)  REFERENCES Room(room_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION
);





CREATE TABLE [log]
(
room_id int,
device_id int,
user__id int,
activity VARCHAR(50),
log_date DATE,
duration TIME
primary key(room_id,device_id,user__id,log_date),
FOREIGN KEY (room_id)  REFERENCES Room(room_id)
ON UPDATE NO ACTION
ON DELETE  NO ACTION,
FOREIGN KEY (device_id)  REFERENCES Device(device_id)
ON UPDATE NO ACTION
ON DELETE  NO ACTION,
FOREIGN KEY (user__id)  REFERENCES USERS(id)
ON UPDATE NO ACTION
ON DELETE  NO ACTION


);


CREATE TABLE Consumption
(
device_id int ,
consumption int,
Consumption_date DATE,
primary key(device_id,Consumption_date),
FOREIGN KEY (device_id)  REFERENCES Device(device_id)
ON UPDATE CASCADE
ON DELETE  CASCADE,
);

CREATE TABLE Preferences
(
user__id int,
category VARCHAR(20),
preference_no int,
content VARCHAR(20),
primary key(user__id,preference_no), 
FOREIGN KEY (user__id)  REFERENCES USERS(id)
ON UPDATE CASCADE
ON DELETE  CASCADE


);


CREATE TABLE Recommendation
(
Recommendation_id int IDENTITY PRIMARY KEY,
user__id int,
category VARCHAR(20),
preference_no int,
Content VARCHAR(20),
FOREIGN KEY (user__id,preference_no)  REFERENCES Preferences(user__id,preference_no)
ON UPDATE CASCADE
ON DELETE  CASCADE
);

CREATE TABLE Inventory
(
supply_id int IDENTITY PRIMARY KEY,
Inventory_name VARCHAR(20),
quantity int,
Inventory_expiry_date DATETIME,
price decimal(10,2),
manufacturer VARCHAR(20),
category VARCHAR(20)
);


CREATE TABLE Camera
(
monitor_id int PRIMARY KEY,
camera_id int IDENTITY,
room_id int,
FOREIGN KEY (monitor_id)  REFERENCES USERS(id)
ON UPDATE NO ACTION
ON DELETE  NO ACTION,
FOREIGN KEY (room_id)  REFERENCES Room(room_id)
ON UPDATE NO ACTION
ON DELETE  NO ACTION


);