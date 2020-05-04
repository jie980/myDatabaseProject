--This procedure is used for finding the room that is available during 2 selected dates
CREATE OR REPLACE FUNCTION AVAIL_ROOM(IN startdate DATE, IN enddate DATE)  RETURNS TABLE(roomid INTEGER)
AS $$

DECLARE
	sdate DATE;
	edate DATE;
	room INT;
	cur_room CURSOR FOR SELECT start_date,end_date,room_number FROM reservation r, belongs b WHERE r.rid=b.rid;

BEGIN
	CREATE TEMP TABLE tmproom(roomid INTEGER);
	INSERT INTO tmproom (SELECT room_number FROM room); --insert all the rooms into tmproom
	
	OPEN cur_room;
	FETCH cur_room INTO sdate,edate,room;
	WHILE FOUND LOOP  
		IF(sdate<enddate AND edate>startdate) --ROOM IS NOT AVAILABLE delelte it from tmproom

			THEN DELETE FROM tmproom WHERE tmproom.roomid=room;
		END IF;
		FETCH cur_room INTO sdate,edate,room;
	END LOOP;
	CLOSE cur_room;

	RETURN QUERY SELECT * FROM tmproom;
	DROP TABLE tmproom; --drop the temp table since it is useless now
	RETURN;
END
$$ LANGUAGE plpgsql;

--SELECT AVAIL_ROOM('2020-03-01','2020-03-11');
