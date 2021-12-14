''' ******************************************************************************************************
NAME : Top Earners
TYPE : AGGREGATION
TOOL : COUNT(), LIMIT 1
QUESTION :  
The maximum earnings value is 69952. 
The only employee with earnings 69952 is Kimberly, so we print the maximum earnings value () and 
a count of the number of employees who have earned  (which is 69952) as two space-separated values.
'''

SELECT 
    salary * months AS earnings, COUNT(salary * months)
FROM 
    Employee
GROUP BY 
    earnings
ORDER BY 
    earnings DESC
LIMIT 1;

''' ******************************************************************************************************
NAME : Average Population
TYPE : AGGREGATION
TOOL : FLOOR(AVG())
QUESTION :  
'''
SELECT FLOOR(AVG(POPULATION)) '''rounded down'''
FROM CITY;

''' ******************************************************************************************************
NAME : The Blunder
TYPE : AGGREGATION
TOOL : CEIL(), REPLACE()
QUESTION :  
 She did not realize her keyboard 0 key was broken until after completing the calculation. 
 She wants your help finding the difference between her miscalculation (using salares with any zeros removed), and the actual average salary.
'''
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;

''' ******************************************************************************************************
NAME : Japan Population
TYPE : AGGREGATION
TOOL : 
QUESTION :  
'''
SELECT SUM(Population)
FROM City
WHERE CountryCode = 'JPN'
