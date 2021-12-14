''' ******************************************************************************************************
NAME : Type of Triangle
TYPE : Advanced Select
TOOL : CASE()
QUESTION : 
SAMPLE OUTPUT :
Equilateral: Its a triangle with  sides of equal length.
Isosceles: Its a triangle with  sides of equal length.
Scalene: Its a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C dont form a triangle.
'''

SELECT CASE
    WHEN A+B>C AND B+C>A AND A+C>B THEN
        CASE
            WHEN  A=B AND B=C AND A=C THEN 'Equilateral'
            WHEN A=B OR B=C OR A=C THEN 'Isosceles'
            ELSE 'Scalene'
        END
    ELSE 'Not A Triangle'
    END
FROM
    TRIANGLES 

''' ******************************************************************************************************
NAME : The PADS
TYPE : Advanced Select
TOOL : CONCAT(), SUBSTR(), COUNT()
QUESTION : 
SAMPLE OUTPUT :
Samantha(D)
There are a total of 2 doctors.
'''

SELECT
    CONCAT(NAME, '(', SUBSTR(OCCUPATION,1,1), ')')
FROM
    OCCUPATIONS 
ORDER BY
    NAME;

SELECT
    CONCAT('There are a total of ', COUNT(OCCUPATION), ' ', LOWER(OCCUPATION), 's.') 
FROM
    OCCUPATIONS 
GROUP BY
    OCCUPATION
ORDER BY
    COUNT(OCCUPATION);


''' ******************************************************************************************************
NAME : Binary Tree Nodes
TYPE : Advanced Select
QUESTION : 
SAMPLE OUTPUT :
1 Leaf
2 Inner
3 Leaf
'''

SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root') ''' NOTE THAT WHEN DOOES NOT REQUIRE ',' AT THE END'''
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
    ELSE CONCAT(N, ' Leaf')
    END
FROM BST
ORDER BY N ASC

''' ******************************************************************************************************
NAME : Occupations
TYPE : Advanced Select
TOOL : SET(), CASE(), MIN()
QUESTION :
SAMPLE OUTPUT :
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
'''

SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT min(Doctor), min(Professor), min(Singer), min(Actor) 
'''it will return The "LOWEST" element from each column (which happened to be the first element)'''
'''This calls individual column created by row number set'''
FROM(
  SELECT case 
    when Occupation='Doctor' then (@r1:=@r1+1)
    when Occupation='Professor' then (@r2:=@r2+1)
    when Occupation='Singer' then (@r3:=@r3+1)
    when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber, '''Creating ROW NUM based on occupation '''
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor '''2 Columns [PARK, DOCTOR] -> Put name into 4 new columns [D, P, S, A]'''
  FROM OCCUPATIONS
  ORDER BY Name
    ) temp
GROUP BY RowNumber;
