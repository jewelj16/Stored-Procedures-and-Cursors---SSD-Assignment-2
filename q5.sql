DROP PROCEDURE IF EXISTS SendWatchTimeReport2;

DELIMITER //
CREATE PROCEDURE SendWatchTimeReport2()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;

	DECLARE watched_subscribers_cursor CURSOR FOR
		SELECT DISTINCT SubscriberID FROM Subscribers;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN watched_subscribers_cursor;
    read_loop: LOOP
		FETCH watched_subscribers_cursor INTO sub_id;
        IF done THEN 
			LEAVE read_loop; 
		END IF;
        CALL GetWatchHistoryBySubscriber(sub_id); 
    END LOOP;
    
END //
DELIMITER ;