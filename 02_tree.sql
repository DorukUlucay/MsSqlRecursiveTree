--thanks to https://dba.stackexchange.com/a/160930/137462

USE recursivetreedemo 

go 

CREATE PROC GetCategoryTree 
AS 
    WITH tree 
         AS (SELECT c1.Id, 
                    c1.NAME, 
                    [level] = 1, 
                    path = Cast('R' AS VARCHAR(100)) 
             FROM   dbo.Category c1 
             WHERE  ( c1.Parentid IS NULL 
                       OR c1.Parentid = 0 ) 
             UNION ALL 
             SELECT c2.Id, 
                    c2.NAME, 
                    [level] = Tree.[Level] + 1, 
                    Path = Cast(Tree.Path + '/' 
                                + RIGHT( Cast(c2.Id AS VARCHAR(10)), 10) AS 
                                VARCHAR( 
                                100)) 
             FROM   dbo.Category c2 
                    INNER JOIN tree 
                            ON Tree.Id = c2.Parentid) 
    SELECT Tree.Path,
           Tree.NAME AS description 
    FROM   tree 
    ORDER  BY Path 
    OPTION (maxrecursion 0); 

-- EXEC GetCategoryTree