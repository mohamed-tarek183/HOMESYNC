--M3 Proc--
CREATE PROCEDURE ViewUserRoom
@user_id int
AS
BEGIN
SELECT r.room_id,r.room_type,r.room_status,r.room_floor
From Room r Inner Join Users u ON r.room_id=u.room
Where u.id=@user_id
END
GO

CREATE PROCEDURE IsRoominDB
    @room_id INT,
    @success INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT room_id FROM Room WHERE room_id = @room_id)
    BEGIN
        SET @success = 1
    END
    ELSE
    BEGIN
        SET @success = -1
    END
END
GO


CREATE PROC checkGuest
@guest_id int,
@admin_id int,
@success int output
AS
BEGIN
IF EXISTS (SELECT guest_id,guest_of FROM Guest WHERE guest_id=@guest_id AND guest_of=@admin_id)
BEGIN
SET @success =1
END
ELSE
BEGIN 
SET @success =-1
END
END
GO

CREATE PROC getUserType
@user_id int,
@user_type varchar(5) OUTPUT
AS
BEGIN
SELECT @user_type=user_type
FROM USERS
WHERE id=@user_id
END
GO






--PROC 1-1--
 /*Register on the website with a unique email along with the needed information. Choose which type
of user you will be using @usertype (Admin).*/
CREATE PROCEDURE UserRegister
    @usertype varchar(20), 
    @email varchar(50), 
    @first_name varchar(20),
    @last_name varchar(20), 
    @birth_date datetime, 
    @password varchar(10),
    @userid INT OUTPUT
AS
BEGIN
    
    SET @userid = -1;

    IF NOT EXISTS(SELECT email FROM USERS WHERE email = @email)
    BEGIN
        
            INSERT INTO USERS (f_name, l_name, birthdate, email, user_password, user_type)
            VALUES (@first_name, @last_name, @birth_date, @email, @password, @usertype);

			 SET @userid = SCOPE_IDENTITY()

            INSERT INTO Admin (admin_id, no_of_guests_allowed, salary)
            VALUES (@userid, 30, null);

            
            
        END
    END
go


 
			--PROC 2-1--
/*Login using my email and password. In the event that the user is not registered, the @user_id value
will be (-1).*/
 
  CREATE PROCEDURE UserLogin
    @email varchar(50),
    @password varchar(10),
    @success bit OUTPUT,
    @userid int OUTPUT
AS
BEGIN
    IF EXISTS (SELECT id FROM USERS WHERE email = @email AND user_password = @password)
    BEGIN
        SET @success = 1;
        SELECT @userid = id FROM USERS WHERE email = @email;
    END
    ELSE
    BEGIN
        SET @userid = -1;
        SET @success = 0;
    END
	
END
GO
	 
	 --PROC 2-2--
	 /*View all the details of my profile*/

	 CREATE PROCEDURE ViewProfile
		@user_id int
		AS
		BEGIN
		 DECLARE @user_type VARCHAR(5);
		SELECT @user_type = user_type
        FROM USERS
        WHERE id = @user_id;
		if(@user_type='Admin')
		BEGIN
		SELECT *
		FROM USERS INNER JOIN Admin on id=admin_id
		WHERE id = @user_id
		END
		ELSE
		BEGIN
		SELECT *
		FROM USERS INNER JOIN Guest on id=guest_id
		WHERE id = @user_id

		END
		END

		
		
	go

	
	

		 --PROC 2-4--
/*View their task. (You should check if the deadline has passed or not if it passed set the status to
done).*/
	Go
		CREATE PROCEDURE ViewMyTask
		@user_id int
		As
		BEGIN 
		select task_status from Task where task_id in (select t.task_id from task t inner join Assigned_to a on t.task_id=a.task_id where a.user__id=@user_id)
		END
		go

		
		go
		 --PROC 2-5--
/*Finish their task*/
		  CREATE PROCEDURE FinishMyTask
         @user_id int, 
         @title varchar(50)
         AS
         BEGIN
         IF @user_id IS NULL or @title IS NULL
            print 'One of the inputs is null'
         ELSE
            UPDATE Task
            SET task_status='Finished'
            WHERE creator=@user_id AND task_name=@title
         END
         Go

		
		  --PROC 2-6--
		  /*View task status given the @user_id and the @creator of the task. (The recently created reports
should be shown first).*/
		 CREATE PROCEDURE ViewTask
		 @user_id int, @creator int
		 AS
		 BEGIN
		 SELECT* 
		 FROM Task
		 WHERE task_id=(SELECT task_id FROM Assigned_to
		 WHERE user__id=@user_id AND admin_id=@creator)
		 END
		 GO

		

		 --PROC 2-7--
		 /*View device charge*/
	CREATE PROCEDURE ViewMyDeviceCharge
    @device_id int,
    @charge int OUTPUT,
    @location int OUTPUT
	AS
	BEGIN


    SELECT @charge =d.battery_status , @location = d.room
    FROM Device d
    WHERE device_id = @device_id;
	END
	go
	

	

		--PROC 2-8--
		/*Book a room with other users*/
go
	CREATE PROCEDURE AssignRoom
	@user_id int,
	@room_id int

	AS 
	BEGIN
	UPDATE USERS
	SET room =@room_id
	WHERE @user_id=id
	END
	go

	
	
	--PROC 2-9--
	/*Create events on the system*/
	CREATE PROCEDURE CreateEvent
	@event_id Int ,
	@user_id int,
	@name varchar(50),
	@description varchar(200),
	@location varchar(40),
	@reminder_date datetime ,
	@other_user_id int
	AS
	BEGIN
	INSERT INTO Calender(event_id,user_assigned_to,event_name,event_description,
	event_location,reminder_date)
	VALUES (@event_id,@user_id,@name,@description,@location,@reminder_date)
	IF @other_user_id is NOT NULL
		INSERT INTO Calender(event_id,user_assigned_to,event_name,event_description,
	event_location,reminder_date)
	VALUES (@event_id,@other_user_id,@name,@description,@location,@reminder_date)
	END
	GO
	
	
	
	
	--PROC 2-10--
	/*Assign user to attend event*/

	CREATE PROCEDURE AssignUser
	@user_id int ,
	@event_id int

	AS
	BEGIN
	UPDATE Calender
	SET user_assigned_to=@user_id 
	WHERE @event_id=event_id



	SELECT * 
	FROM Calender
	WHERE @event_id=event_id
	
	END
	
	go

	--PROC 2-11--
	/*Add a reminder to a task*/
CREATE PROCEDURE AddReminder
@task_id int, @reminder datetime
AS
BEGIN
UPDATE Task
SET reminder_date=@reminder
WHERE task_id=@task_id
END
GO

	--PROC 2-12--
	/*Uninvite a specific user to an event*/
CREATE PROCEDURE Uninvited
@event_id int, 
@user_id int
AS
BEGIN
DELETE FROM Calender
WHERE event_id=@event_id AND user_assigned_to=@user_id
END
GO
 
	
	--PROC 2-13--
	/*Update the deadline of a specific task*/
 CREATE PROCEDURE UpdateTaskDeadline
 @deadline datetime, @task_id int
 AS
 BEGIN
 UPDATE Task
 SET due_date =@deadline
 WHERE task_id=@task_id
 END
 GO

	
	--PROC 2-14--
	/*View their event given the @event_id and if the @event_id is empty then view all events that
belong to the user order by their date*/
CREATE PROCEDURE ViewEvent
@User_id int, @Event_id int
AS
BEGIN
IF @Event_id IS NOT NULL
SELECT *
FROM Calender
WHERE event_id=@Event_id AND user_assigned_to=@User_id
ELSE
SELECT *
FROM Calender
WHERE user_assigned_to=@User_id
ORDER BY reminder_date
END
GO


	--PROC 2-15--
	/*View users that have no recommendations*/
	CREATE PROCEDURE ViewRecommendation
	AS 
	Begin
	SELECT u.f_name,u.l_name
	FROM USERS u  LEFT JOIN Recommendation r
	ON u.id =r.user__id
	WHERE r.Recommendation_id IS NULL
	END
	GO


	--PROC 2-16--
	/*Create new note*/
	CREATE PROCEDURE CreateNote
	@User_id int,
	@note_id int,
	@title varchar(50), 
	@Content varchar(500), 
	@creation_date datetime
	AS
	BEGIN
	SET IDENTITY_INSERT Notes ON;
	Insert into Notes(id,user__id,content,creation_date,title) Values(@note_id,@User_id,@content,@creation_date,@title)
	SET IDENTITY_INSERT Notes OFF;
	END
	go
	--PROC 2-17--
	/*Receive a transaction*/
	CREATE PROCEDURE ReceiveMoney
	@reciever_id int,
	@type varchar(30),
	@amount decimal(13,2),
	@status varchar(10),
	@date datetime
	AS
	BEGIN
	INSERT INTO Finance(user__id,payment_type,amount,payment_status,payment_date) VALUES
	(@reciever_id,@type,@amount,@status,@date)
	END
	GO

	--PROC 2-18--
	/*Create a payment on a specific date from one user to the other, each with their separate records(
Based on the nature of the schema this can only be done by inserting the record twice, once
for each user)*/
	CREATE PROCEDURE PlanPayment
	@sender_id int,
	@reciever_id int ,
	@type varchar(30),
	@amount decimal(13,2),
	@status varchar(10),
	@deadline datetime
	AS
	BEGIN
	INSERT INTO Finance(user__id,payment_type,amount,payment_status,deadline,payment_date)
	VALUES(@sender_id,@type,@amount,@status,@deadline,GETDATE())

	INSERT INTO Finance(user__id,payment_type,amount,payment_status,deadline,payment_date)
	VALUES(@reciever_id,@type,@amount,@status,@deadline,GETDATE())
	
	END
	GO

	--PROC 2-19--
	/*Send message to user*/
	CREATE PROCEDURE SendMessage
	@sender_id int,
	@receiver_id int, 
	@title varchar(30),
	@content Varchar(200),
	@timesent time, 
	@timereceived time
	AS 
	BEGIN
	INSERT INTO Communication(sender_id,receiver_id,title,content,time_sent,time_received)VALUES
	(@sender_id,@receiver_id,@title,@content,@timesent,@timereceived)
	END
	go
	--PROC 2-20--
	/*Change note title for all notes user created.*/
	CREATE PROCEDURE NoteTitle
	@user_id int,
	@note_title varchar(50)
	AS 
	BEGIN
	UPDATE n
    SET n.title = @note_title
    FROM Notes n
    INNER JOIN Users u ON u.id = n.user__id
	END


	go
	--PROC 2-21--
	/*Show all messages received from a spacific user*/
	CREATE PROCEDURE ShowMessages
	@user_id int
	,@sender_id int
	AS
	BEGIN
	SELECT * 
	FROM Communication m
	WHERE m.receiver_id = @user_id
        AND m.sender_id = @sender_id;
	END
	go

	-- PROC 3-1--
	/*See details of all users and filter them by @user_type*/
	CREATE PROCEDURE ViewUsers
	@user_type varchar(20)
	AS 
	BEGIN
	SELECT *
    FROM USERS u
    WHERE u.user_type = @user_type;
	END
	go

	--PROC 3-2--
	/*Remove an event from the system*/
	CREATE PROCEDURE RemoveEvent
	@event_id int,
	@user_id int
	AS 
	BEGIN
	DELETE FROM Calender 
	WHERE user_assigned_to = @user_id AND event_id =@event_id
	END
	go

	--PROC 3-3--
	/*Create schedule for the rooms*/
	CREATE PROCEDURE CreateSchedule
	@creator_id int,
	@room_id int,
	@start_time datetime,
	@end_time datetime,
	@action varchar(20)
	AS 
	BEGIN
	INSERT INTO RoomSchedule (creator_id,room,start_time,end_time,RoomSchedule_action)
	VALUES(@creator_id,@room_id,@start_time,@end_time,@action)
	END
	GO
	--PROC 3-4--
	/*Remove a guest from the system*/
	CREATE PROCEDURE GuestRemove
	@guest_id int,
	@admin_id int,
	@number_of_allowed_guests int OUTPUT
	AS
	BEGIN
	DELETE FROM Guest WHERE guest_of=@admin_id AND guest_id=@guest_id
	DELETE FROM USERS WHERE id=@guest_id
	SELECT @number_of_allowed_guests=no_of_guests_allowed
	FROM Admin
	RETURN
	END
	GO
	
	--PROC 3-5--
	/*Recommend travel destinations for guests under certain age*/
	CREATE PROCEDURE RecommendTD
	@Guest_id int,
	@destination varchar(10),
	@age int ,
	@preference_no int
	AS
	IF EXISTS(SELECT age from USERS u INNER JOIN Guest g ON u.id= g.guest_id WHERE age <@age)
	BEGIN
	INSERT INTO Recommendation(user__id,preference_no,content,category)
	VALUES (@Guest_id,@preference_no,@destination,'Travel Destionation')
	END
	GO

	


	--PROC 3-6--
	/*Access cameras in the house.*/
	CREATE PROCEDURE Servailance
	@user_id int,
	@location int,
	@camera_id int
	AS
	BEGIN
	SELECT *
	FROM Camera
	WHERE monitor_id=@user_id AND room_id=@location AND 
	camera_id=@camera_id
	END
	GO
	

	--PROC 3-7--
	/*Change status of room*/
	CREATE PROCEDURE RoomAvailability
	@location int, 
	@status varchar(40)
	AS
	Begin
	UPDATE r
	SET r.room_status= @status
	FROM Room r
	WHERE r.room_id=@location
	END
	GO

	--PROC 3-8--
	/*Create an inventory for a specific item*/
	CREATE PROCEDURE Sp_Inventory
	@item_id int,
	@name varchar(30),
	@quantity int,
	@expirydate datetime,
	@price decimal(10,2),
	@manufacturer varchar(30),
	@category varchar(20)
	AS
	BEGIN
	SET IDENTITY_INSERT Inventory ON;
	INSERT INTO Inventory (supply_id,Inventory_name,quantity,Inventory_expiry_date,price,manufacturer,category)
	VALUES(@item_id,@name,@quantity,@expirydate,@price,@manufacturer,@category)
	SET IDENTITY_INSERT Inventory OFF;
	END
	GO

	--PROC 3-9--
	/*Calculate price of purchasing a certain item*/
	CREATE PROCEDURE Shopping
	@id int ,
	@quantity int ,
	@total_price decimal(10,2) OUTPUT
	AS
	BEGIN
	SET @total_price=@quantity*(SELECT price FROM Inventory WHERE supply_id=@id)
	END
	Go



	--PROC 3-10--
	/*If current user had an activity set its duration to 1 hour*/
	CREATE PROCEDURE LogActivityDuration
	 @room_id int 
	,@device_id int
	,@user_id int
	,@date datetime
	,@duration varchar(50)
	AS
	BEGIN
	IF EXISTS (SELECT activity FROM [log] WHERE room_id=@room_id
	AND device_id=@device_id AND user__id =@user_id AND log_date=@date)
	 UPDATE [log]
	SET duration = @duration
	WHERE room_id=@room_id
	AND device_id=@device_id 
	AND user__id =@user_id 
	AND log_date=@date
	END
	GO
	--PROC 3-11--
	/*Set device consumption for all tablets*/
	CREATE PROCEDURE TabletConsumption
	@consumption int
	AS
	BEGIN
	UPDATE c
	SET c.consumption=@consumption
	FROM Consumption c INNER JOIN Device d ON c.device_id=d.device_id
	WHERE d.device_type = 'Tablet' OR d.device_type = 'tablet'
	END
	GO

	--PROC 3-12--
	/*Make preferences for Room temperature to be 30 if a user is older then 40*/

	CREATE PROCEDURE MakePreferencesRoomTemp
	@user_id int ,
	@category varchar(20),
	@preferences_number int
	AS
	BEGIN
	IF EXISTS (SELECT age FROM USERS WHERE id=@user_id AND age > 40)
	UPDATE Preferences
	SET category=@category
	WHERE user__id=@user_id AND preference_no=@preferences_number
	END
	GO


	

	--PROC 3-13--
	/*View Log entries involving the user*/
	CREATE PROCEDURE ViewMyLogEntry
	@user_id int
	AS
	BEGIN
	SELECT *
	FROM [log]
	WHERE user__id=@user_id
	END
	GO

	--PROC 3-14--
	/*Update log entries involving the user*/
CREATE PROCEDURE UpdateLogEntry
@user_id int, @room_id int,
@device_id int,
@activity varchar(30)
AS
BEGIN
UPDATE [log]
SET activity = @activity
WHERE user__id=@user_id AND room_id=@room_id AND device_id=@device_id
END 
GO
	--PROC 3-15--
	/*View rooms that are not being used*/
CREATE PROCEDURE ViewRoom
AS
BEGIN 
SELECT * 
FROM Room
WHERE room_status='Vacant'
END


GO



	--PROC 3-16--
	/*View the details of the booked rooms given @user_id and @room_id . (If @room_id is not booked
then show all rooms that are booked by this user).*/
	CREATE PROCEDURE ViewMeeting
	@room_id int, @user_id int
	AS
	BEGIN
	SELECT *
	FROM Room r INNER JOIN RoomSchedule rs ON r.room_id=rs.room RIGHT OUTER JOIN
	USERS u ON r.room_id = u.room
	WHERE @user_id=u.id AND @room_id=r.room_id
	END
	GO
	


	--PROC 3-17--
	/*Add to the tasks.*/

CREATE PROCEDURE AdminAddTask
@user_id int ,
@creator int ,
@name varchar(30),
@category varchar(20),
@priority Int,
@status varchar(20),
@reminder datetime ,
@deadline datetime ,
@other_user int
AS
BEGIN
INSERT INTO Task (creator,task_name,creation_date,due_date,category,task_status,reminder_date,task_priority)
VALUES(@creator,@name,GETDATE(),@deadline,@category,@status,@reminder,@priority)
INSERT INTO  Assigned_to (admin_id,task_id,user__id)
VALUES (@creator,SCOPE_IDENTITY(),@other_user)
END
GO

	--PROC 3-18--
	/*Add Guests to the system , generate passwords for them and reserve rooms under their name */
	CREATE PROCEDURE AddGuest
	@email varchar(30),
	@first_name varchar(10) ,
	@address varchar (30),
	@password varchar(30),
	@guest_of int,
	@room_id int
	AS
	BEGIN
	INSERT INTO USERS(email,f_name,user_password,room,user_type) VALUES(@email,@first_name,@password,@room_id,'Guest')
	INSERT INTO Guest(guest_id,guest_of,guest_address,arrival_date) VALUES (SCOPE_IDENTITY(),@guest_of,@address,GETDATE())
	END
	GO



	--PROC 3-19--
	/*Assign task to a specific User. */
	CREATE PROCEDURE AssignTask
	@user_id int ,
	@task_id int , 
	@creator_id int
	AS
	BEGIN
	INSERT INTO Assigned_to(user__id,task_id,admin_id)
	VALUES(@user_id,@task_id,@creator_id)
	END
	GO


	
	--PROC 3-20--
	/*Delete last message sent */
	CREATE PROCEDURE DeleteMsg
	AS
	BEGIN
	DELETE FROM Communication
    WHERE message_id = (SELECT TOP 1 message_id FROM Communication ORDER BY time_sent DESC);
	END
	
	GO

	--PROC 3-21--
	/*Add outgoing flight itinerary for a specific flight*/
	CREATE PROCEDURE AddItinerary
	@trip_no int,
	@flight_num varchar(30),
	@flight_date datetime ,
	@destination varchar(40)
	AS
	BEGIN
	UPDATE t
	SET t.outgoing_flight_num = @flight_num,
	t.outgoing_flight_date =@flight_date,
	t.destination=@destination
	FROM Travel t
	WHERE t.trip_no=@trip_no
	END
	GO

	--PROC 3-22--
	/*Change flight date to next year for all flights in current year*/
	CREATE PROCEDURE ChangeFlight
	AS
	BEGIN
	UPDATE Travel
	SET outgoing_flight_date = DATEADD(YEAR,1,outgoing_flight_date)
	WHERE YEAR(outgoing_flight_date) = YEAR(GETDATE())

	UPDATE Travel
	SET ingoing_flight_date = DATEADD(YEAR,1,ingoing_flight_date)
	WHERE YEAR(ingoing_flight_date) = YEAR(GETDATE())

	END
	GO
	
	--PROC 3-23--
	/*Update incoming flights*/
	CREATE PROCEDURE UpdateFlight
	@date datetime,
	@trip_no int, 
	@destination varchar(15)
	AS
	BEGIN
	UPDATE Travel
	SET ingoing_flight_date=@date,
	@destination=@destination
	WHERE trip_no=@trip_no
	END
	GO

	--PROC 3-24--
	/*Add a new device*/
	CREATE PROCEDURE AddDevice
	@device_id int,
	@status varchar(20),
	@battery int,
	@location int,
	@type varchar(20)
	AS
	BEGIN
	SET IDENTITY_INSERT Device ON;
	INSERT INTO Device(device_id,device_status,battery_status,room,device_type)
	VALUES(@device_id,@status,@battery,@location,@type)
	SET IDENTITY_INSERT Device OFF;
	END
	GO
	--PROC 3-25--
	/*Find the location of all devices out of battery*/
	CREATE PROCEDURE OutOfBattery
	AS
	BEGIN
	SELECT d.room
	FROM Device d
	WHERE d.battery_status =0
	END
	GO
	--PROC 3-26--
	/*Set the status of all devices out of battery to charging*/
	CREATE PROCEDURE Charging
	AS
	BEGIN
	UPDATE Device
	SET device_status ='charging'
	WHERE battery_status =0
	END 
	GO

	--PROC 3-27--
	/*Set the number of allowed guests for an admin*/
	CREATE PROCEDURE GuestsAllowed
	@admin_id int,
	@number_of_guests int
	AS
	BEGIN
	UPDATE Admin
	SET no_of_guests_allowed=@number_of_guests
	WHERE admin_id=@admin_id
	END
	GO

	--PROC 3-28--
	/*Add a penalty for all unpaid transactions where the deadline has passed*/
	CREATE PROCEDURE Penalize
	@Penalty_amount int
	AS
	BEGIN
	UPDATE Finance
	SET penalty =@Penalty_amount
	WHERE CAST(deadline AS date)>CAST(GETDATE() AS date)
	END	
	GO

	--PROC 3-29--
	/*Get the number of all guests currently present for a certain admin*/
	CREATE PROCEDURE GuestNumber
	@admin_id int
	AS
	BEGIN
	SELECT no_of_guests_allowed
	FROM Admin
	WHERE admin_id=@admin_id
	END
	GO

	

	--PROC 3-30--
	/*Get the youngest user in the system*/
	CREATE PROCEDURE Youngest
	AS
	BEGIN
	SELECT TOP 1 age 
	FROM USERS 
	ORDER BY age ASC
	END
	GO

	--PROC 3-31--
	/*Get the users whose average income per month is greater then a specific amount*/
	CREATE PROCEDURE AveragePayment
    @amount DECIMAL(10, 2)
	AS
	BEGIN
    SELECT u.f_Name, u.l_Name
    FROM USERS u INNER JOIN ADMIN a ON u.id=a.admin_id
    WHERE a.salary>@amount
	END
	GO	

	
	
	--PROC 3-32--
	/*Get sum the sum of all purchases needed in the home inventory (assuming you need only 1 of each
missing item)*/
	CREATE PROCEDURE Purchase
	AS
	BEGIN
	SELECT SUM(Price) AS SUM_of_purchases
	FROM Inventory
	WHERE quantity=0
	END
	GO



	--PROC 3-33--
	/*Get the location where more then two devices have a dead battery*/
	CREATE PROCEDURE NeedCharge
	AS
	BEGIN
	SELECT d.room
	FROM Device d 
	WHERE d.battery_status=0
	GROUP BY d.room
	HAVING COUNT(d.device_id) > 2;
	END


	GO
	
	--PROC 3-34--
	/*Get the admin with more then 2 guests*/
	CREATE PROCEDURE Admins
	AS
	BEGIN
	SELECT f_name,l_name
	FROM USERS u INNER JOIN Admin a ON u.id=a.admin_id
	WHERE no_of_guests_allowed >2
	END
	GO
