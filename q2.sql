DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
	SELECT s.ShowId AS show_id, s.title AS show_title, s.genre AS show_genre, s.ReleaseYear AS release_year, w.WatchTime AS watch_time
    FROM WatchHistory w
    INNER JOIN Shows s
    ON s.ShowId = w.ShowId
    WHERE SubscriberID = sub_id;
END //
DELIMITER ;

-- CALL GetWatchHistoryBySubscriber(3);