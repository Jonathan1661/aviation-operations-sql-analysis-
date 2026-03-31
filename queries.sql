--Find dates where flights increased versus both the previous day and 2 days ago
SELECT df1.airport_code, df1.recorddate
FROM DailyFlights df1
JOIN DailyFlights df2 
	ON df1.airport_code = df2.airport_code
	AND df1.recordDate = DATE(df2.recordDate, '+1 day')
JOIN DailyFlights df3
	ON df1.airport_code = df3.airport_code
    AND df1.recordDate = DATE(df3.recordDate, '+2 day')
Where df1.flights > df2.flights
	AND df1.flights > df3.flights;

--Find dates where flights were lower than the previous day
SELECT df1.airport_code, df1.recordDate, df1.flights AS today_flights, df2.flights AS yesterday_flights
FROM DailyFlights df1
JOIN DailyFlights df2
    ON df1.airport_code = df2.airport_code
   AND df1.recordDate = DATE(df2.recordDate, '+1 day')
WHERE df1.flights < df2.flights;

--Show daily flight change compared to yesterday
SELECT 
    df1.airport_code,
    df1.recordDate,
    df1.flights AS today_flights,
    df2.flights AS yesterday_flights,
    df1.flights - df2.flights AS flight_change
FROM DailyFlights df1
JOIN DailyFlights df2
    ON df1.airport_code = df2.airport_code
   AND df1.recordDate = DATE(df2.recordDate, '+1 day');
   
--Find the single biggest day-over-day increase for each airport
SELECT airport_code, MAX(flight_change) AS max_increase
FROM (
    SELECT 
        df1.airport_code,
        df1.recordDate,
        df1.flights - df2.flights AS flight_change
    FROM DailyFlights df1
    JOIN DailyFlights df2
        ON df1.airport_code = df2.airport_code
       AND df1.recordDate = DATE(df2.recordDate, '+1 day')
)
GROUP BY airport_code;