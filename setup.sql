CREATE TABLE DailyFlights (
    airport_code TEXT,
    recordDate DATE,
    flights INTEGER
);

INSERT INTO DailyFlights (airport_code, recordDate, flights) VALUES
('DFW', '2025-06-01', 120),
('DFW', '2025-06-02', 130),
('DFW', '2025-06-03', 125),
('DFW', '2025-06-04', 140),
('DFW', '2025-06-05', 145),

('ATL', '2025-06-01', 200),
('ATL', '2025-06-02', 195),
('ATL', '2025-06-03', 210),
('ATL', '2025-06-04', 220),
('ATL', '2025-06-05', 215);