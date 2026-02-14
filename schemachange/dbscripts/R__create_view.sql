-- Use the schema created in the versioned script
USE SCHEMA DEMO_SCHEMA;

-- R__ scripts must be idempotent (CREATE OR REPLACE)
CREATE OR REPLACE VIEW EMPLOYEE_SUMMARY_VIEW AS
SELECT 
    ID,
    FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,
    DEPARTMENT,
    HIRE_DATE,
    -- Example of adding logic that can be updated later
    CASE 
        WHEN HIRE_DATE < '2024-01-01' THEN 'Veteran'
        ELSE 'New Hire'
    END AS EMPLOYEE_STATUS
FROM EMPLOYEES;
