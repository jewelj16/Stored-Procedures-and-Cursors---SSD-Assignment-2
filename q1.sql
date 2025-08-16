DROP PROCEDURE IF EXISTS ListAllSubscribers;

DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subscriber_name VARCHAR(255);
    DECLARE subscribers_name_cursor CURSOR FOR
        SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN subscribers_name_cursor;
    
    read_loop: LOOP
        FETCH subscribers_name_cursor INTO subscriber_name;
        IF done THEN 
            LEAVE read_loop;
        END IF;
        SELECT subscriber_name AS current_subscriber_name;
    END LOOP;
    
    CLOSE subscribers_name_cursor;
END //
DELIMITER ;