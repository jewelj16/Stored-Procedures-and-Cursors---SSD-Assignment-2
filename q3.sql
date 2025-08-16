DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
	DECLARE count_of_subscribers_with_name INT;
    DECLARE last_subscriber_id INT;
	SELECT COUNT(*) INTO count_of_subscribers_with_name FROM Subscribers WHERE SubscriberName = subName;
    
    IF count_of_subscribers_with_name = 0 THEN
		SELECT MAX(SubscriberID) INTO last_subscriber_id FROM Subscribers;
        INSERT INTO Subscribers VALUES(last_subscriber_id+1, subName, DATE(NOW()));
    END IF;
END //
DELIMITER ;

-- CALL AddSubscriberIfNotExists("Jordan Smith");