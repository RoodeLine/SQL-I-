CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE (fibonacci_num INT) AS $$
DECLARE
    a INT := 0;
    b INT := 1;
    temp INT;
BEGIN
    fibonacci_num := a;
    RETURN NEXT;
    WHILE b < pstop LOOP
        fibonacci_num := b;
        RETURN NEXT;
        temp := a;
        a := b;
        b := temp + b;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();