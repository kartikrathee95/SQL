-- Query to list all shows at a given theatre and date with their respective timings
SELECT 
    M.Movie_Name, 
    S.Show_Time, 
    S.Available_Tickets
FROM 
    Show S
JOIN 
    Theatre T ON S.Theatre_ID = T.Theatre_ID
JOIN 
    Movie M ON S.Movie_ID = M.Movie_ID
WHERE 
    T.Theatre_ID = %s
    AND S.Show_Date = %s
ORDER BY 
    S.Show_Time;
