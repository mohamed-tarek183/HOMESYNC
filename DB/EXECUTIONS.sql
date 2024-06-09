-- 1_1
DECLARE @userid INT 
EXEC UserRegister  'Admin','iso2@gmail.com','iso','zidan','2023-06-16','sc',@userid OUTPUT
PRINT @userid
SELECT * FROM USERS
SELECT * FROM Guest


--2-1
DECLARE @s BIT
DECLARE @userid int
EXEC UserLogin 'mj2@gmail.com','sc',@s OUTPUT,@userid OUTPUT
PRINT @s
PRINT @userid
-- 2_2
EXEC ViewProfile 1
-- 2_4
EXEC ViewMyTask 1
-- 2_5
DECLARE @userid INT, @title VARCHAR(50)
SET @userid = 3
SET @title = 'Correct Errors'
EXEC FinishMyTask @userid, @title

SELECT* FROM Task

-- 2_6
EXEC ViewTask 6, 1



-- 2_7
DECLARE @device_id INT, @charge INT , @location INT 
EXEC ViewMyDeviceCharge 2, @charge OUTPUT, @location OUTPUT
PRINT @charge
PRINT @location

SELECT * FROM Device

-- 2_8
EXEC AssignRoom 1, 7

-- 2_10
EXEC AssignUser 1, 4

-- 2_11
DECLARE @task_id INT, @reminder DATETIME
SET @task_id = 3
SET @reminder = '2023-12-01 08:00:00'
EXEC AddReminder @task_id, @reminder

SELECT * FROM Task

-- 2_12
DECLARE @event_id INT, @user_id INT
SET @event_id = 3
SET @user_id = 1
EXEC Uninvited @event_id, @user_id

SELECT * FROM Calender

-- 2_13
DECLARE @deadline DATETIME, @task_id INT
SET @deadline = '2023-12-15'
SET @task_id = 3
EXEC UpdateTaskDeadline @deadline, @task_id


-- 2_14
DECLARE @user_id INT, @event_id INT
SET @user_id = 1
SET @event_id = 4
EXEC ViewEvent @user_id, @event_id

-- 2_15

EXEC ViewRecommendation

-- 2_16
DECLARE @user_id INT, @note_id INT, @title VARCHAR(50), @content VARCHAR(500), @creation_date DATETIME
SET @user_id = 1
SET @note_id = 1
SET @title = 'n1'
SET @content = 'This is a test note.'
SET @creation_date = '2023-12-01'
EXEC CreateNote @user_id, @note_id, @title, @content, @creation_date

SELECT * FROM Notes

-- 2-17
DECLARE @receiver_id INT, @type VARCHAR(30), @amount DECIMAL(13,2), @status VARCHAR(10), @date DATETIME
SET @receiver_id = 1
SET @type = 'Payment'
SET @amount = 100.00
SET @status = 'Received'
SET @date = '2023-12-01'
EXEC ReceiveMoney @receiver_id, @type, @amount, @status, @date


-- 2_18
DECLARE @sender_id INT, @receiver_id INT, @type VARCHAR(30), @amount DECIMAL(13,2), @status VARCHAR(10), @deadline DATETIME
SET @sender_id = 1
SET @receiver_id = 2
SET @type = 'Payment'
SET @amount = 50.00
SET @status = 'Planned'
SET @deadline = '2023-12-15'
EXEC PlanPayment @sender_id, @receiver_id, @type, @amount, @status, @deadline


-- 2_19
DECLARE @sender_id INT, @receiver_id INT, @title VARCHAR(30), @content VARCHAR(200), @timesent TIME, @timereceived TIME
SET @sender_id = 1
SET @receiver_id = 2
SET @title = 'Greetings'
SET @content = 'Hello, how are you?'
SET @timesent = '08:30:00'
SET @timereceived = '08:35:00'
EXEC SendMessage @sender_id, @receiver_id, @title, @content, @timesent, @timereceived


-- 2_20
DECLARE @user_id INT, @note_title VARCHAR(50)
SET @user_id = 1
SET @note_title = 'Updated Title'
EXEC NoteTitle @user_id, @note_title

-- 2_21

DECLARE @user_id INT, @sender_id INT
SET @user_id = 2
SET @sender_id = 1
EXEC ShowMessages @user_id, @sender_id

-- 3_1
EXEC ViewUsers 'Admin'

-- 3_2
DECLARE @event_id INT, @user_id INT
SET @event_id = 4
SET @user_id = 1
EXEC RemoveEvent @event_id, @user_id

SELECT * FROM Calender

-- 3_3
DECLARE @creator_id INT, @room_id INT, @start_time DATETIME, @end_time DATETIME, @action VARCHAR(20)
SET @creator_id = 2
SET @room_id = 5
SET @start_time = '2023-12-01 10:00:00'
SET @end_time = '2023-12-01 12:00:00'
SET @action = 'Meeting'
EXEC CreateSchedule @creator_id, @room_id, @start_time, @end_time, @action

SELECT * FROM RoomSchedule

-- 3_4 
DECLARE @guest_id INT, @admin_id INT, @number_of_allowed_guests INT 
SET @guest_id = 6
SET @admin_id = 1
EXEC GuestRemove @guest_id, @admin_id, @number_of_allowed_guests OUTPUT

SELECT * FROM Guest

-- 3_5
DECLARE @Guest_id INT, @destination VARCHAR(10), @age INT, @preference_no INT
SET @Guest_id = 6
SET @destination = 'LA'
SET @age = 30
SET @preference_no = 1
EXEC RecommendTD @Guest_id, @destination, @age, @preference_no



-- 3_6

DECLARE @user_id INT, @location INT, @camera_id INT
SET @user_id = 1
SET @location = 1
SET @camera_id = 1
EXEC Servailance @user_id, @location, @camera_id

-- 3_7
DECLARE @location INT, @status VARCHAR(40)
SET @location = 2
SET @status = 'Occupied'
EXEC RoomAvailability @location, @status

SELECT * FROM Room

-- 3_8
DECLARE @item_id INT, @name VARCHAR(30), @quantity INT, @expirydate DATETIME, @price DECIMAL(10,2), @manufacturer VARCHAR(30), @category VARCHAR(20)
SET @item_id = 2
SET @name = 'test_product'
SET @quantity = 10
SET @expirydate = '2024-01-01'
SET @price = 50.00
SET @manufacturer = 'COMPANY'
SET @category ='ELECTRONICS'
EXEC Sp_Inventory @item_id, @name, @quantity, @expirydate, @price, @manufacturer, @category


-- 3_9
DECLARE @id INT, @quantity INT, @total_price DECIMAL(10,2) 
SET @id = 1
SET @quantity = 5
EXEC Shopping @id, @quantity, @total_price OUTPUT
PRINT @total_price

-- 3_10
DECLARE @room_id INT, @device_id INT, @user_id INT, @date DATETIME, @duration VARCHAR(50)
SET @room_id = 101
SET @device_id = 1
SET @user_id = 1
SET @date = '2023-12-01'
SET @duration = '2 hours'
EXEC LogActivityDuration @room_id, @device_id, @user_id, @date, @duration
--3-11
DECLARE @consumption INT 
SET @consumption = 10
EXEC TabletConsumption @consumption

--3-12
DECLARE @user_id INT,@category VARCHAR(50),@preferences_number int
SET @user_id = 1
SET @category = 'Management'
SET @preferences_number = 1
EXEC MakePreferencesRoomTemp @user_id,@category,@preferences_number

--3-13
DECLARE @user_id INT
SET @user_id = 1
EXEC ViewMyLogEntry @user_id

--3-14
DECLARE 
@user_id int, @room_id int,@device_id int,@activity varchar(30)
SET @user_id = 1
SET @room_id = 1
SET @device_id = 1
SET @activity = 'On'
EXEC UpdateLogEntry @user_id,@room_id,@device_id,@activity

--3-15
EXEC ViewRoom



--3-16

EXEC ViewMeeting 7,1

--3-17
DECLARE @user_id int ,@creator int ,@name varchar(30),
@category varchar(20),@priority Int,@status varchar(20),
@reminder datetime ,@deadline datetime ,@other_user int
SET @user_id = 1
SET @creator = 1
SET @name = 'Review Reports'
SET @category = 'Management'
SET @priority = 1
SET @status = 'Pending'
SET @reminder = '2023-03-10'
SET @deadline = '2023-03-15'
SET @other_user = 2
EXEC AdminAddTask @user_id,@creator,@name,@category,@priority,@status,@reminder,@deadline,@other_user

--3-18
DECLARE @email varchar(30),@first_name varchar(10) ,@address varchar (30),@password varchar(30),@guest_of int,@room_id int
SET @email = 'g@hotmail.com'
SET @first_name = 'g1'
SET @address = 'g land'
SET @password = 'gg'
SET @guest_of = 1
SET @room_id = 1
EXEC AddGuest  @email,@first_name,@address,@password,@guest_of,@room_id

--3-19
DECLARE @user_id int ,@task_id int , @creator_id int
SET @user_id = 6
SET @task_id = 4
SET @creator_id = 1
EXEC AssignTask @user_id,@task_id,@creator_id

--3-20
EXEC DeleteMsg

--3-21
DECLARE @trip_no int,@flight_num varchar(30),@flight_date datetime ,@destination varchar(40)
SET @trip_no = 1
SET @flight_num = '123'
SET @flight_date = '2023-03-01'
SET @destination = 'Cairo'
EXEC AddItinerary @trip_no,@flight_num,@flight_date,@destination

--3-22
EXEC ChangeFlight



--3-23
DECLARE @date datetime,@trip_no int, @destination varchar(15)
SET @date = '2023-03-01'
SET @trip_no = 1
SET @destination = 'Cairo'
EXEC UpdateFlight @date,@trip_no,@destination

--3-24
DECLARE @device_id int,@status varchar(20),@battery int,@location int,@type varchar(20)
SET @device_id = 100
SET @status = 'On'
SET @battery = 100
SET @location = 1
SET @type = 'Lamp'
EXEC AddDevice @device_id,@status,@battery,@location,@type


-- 3_25
EXEC OutOfBattery

-- 3_26

EXEC Charging

-- 3_27
DECLARE @admin_id INT, @number_of_guests INT
SET @admin_id = 2
SET @number_of_guests = 5
EXEC GuestsAllowed @admin_id, @number_of_guests

-- 3_28

DECLARE @Penalty_amount INT
SET @Penalty_amount = 50
EXEC Penalize @Penalty_amount

-- 3_29
DECLARE @admin_id INT
SET @admin_id = 2
EXEC GuestNumber @admin_id

-- 3_30
EXEC Youngest



-- 3_31
EXEC AveragePayment 14.2

-- 3_32

EXEC Purchase

-- 3_33
EXEC NeedCharge



-- 3_33
EXEC Admins