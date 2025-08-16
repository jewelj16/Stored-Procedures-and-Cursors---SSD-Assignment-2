Github Link: https://github.com/jewelj16/Stored-Procedures-and-Cursors---SSD-Assignment-2

----------------------
Question 1
----------------------
Query: CALL ListAllSubscribers();
Logic: 

1. Fetches all `SubscriberName` from the `Subscribers` table into a cursor.
2. Each `SubscriberName` in the cursor is iterated and displayed using `SELECT` query

----------------------
Question 2
----------------------
Query: CALL GetWatchHistoryBySubscriber(<SubscriberID>);
Example: CALL GetWatchHistoryBySubscriber(2);
Logic: 

1. Performs an inner join between `WatchHistory` table and `Shows` table and displays the rows.
2. All the required fields are displayed using the `SELECT` query.3

----------------------
Question 3
----------------------
Query: `CALL AddSubscriberIfNotExists(<SubscriberName>);`
Example: CALL AddSubscriberIfNotExists("New Name");
Logic:

1. Query the table to get the count of rows with the given name
2. If count is zero
    2.1: Take MAX(SubscriberID)+1 as the primary key for this record
    2.2: Insert this record with primary key field with this value and date with the current date,
         using DATE(NOW()).

----------------------
Question 4
----------------------

Query: CALL SendWatchTimeReport();
Logic:

1. Creates a cursor for all SubscriberID having WatchTime > 0
2. Iterates over this cursor and invokes the GetWatchHistoryBySubscriber(SubscriberID)


----------------------
Question 5
----------------------
Query: CALL SendWatchTimeReport2();
Logic:

1. Creates a cursor for all `SubscriberID` in the `Subscribers` table
2. Iterates over this cursor and invokes the GetWatchHistoryBySubscriber(SubscriberID)
