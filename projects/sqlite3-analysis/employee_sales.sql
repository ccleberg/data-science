-- Data ETL business script in sqlite3

-- Create new field(s) for business-requested calculations
ALTER TABLE invoice_items
ADD COLUMN TotalPrice
GENERATED ALWAYS AS (UnitPrice * Quantity);

-- Extract and summarize data to show sales totals per employee
WITH cst AS (
	SELECT
		CustomerId
		,SupportRepId
		,State
		,Country
	FROM customers
),
emp AS (
	SELECT
		EmployeeId
		,LastName
		,FirstName
		,Title
	FROM employees
),
inv AS (
	SELECT
		InvoiceId
		,CustomerId
		,InvoiceDate
	FROM invoices
),
tot AS (
	SELECT
		InvoiceId
		,UnitPrice
		,Quantity
		,TotalPrice
	FROM invoice_items
)

SELECT DISTINCT * FROM emp
LEFT JOIN cst ON emp.EmployeeId = cst.SupportRepId
LEFT JOIN inv ON cst.CustomerId = inv.CustomerId
LEFT JOIN tot ON inv.InvoiceId = tot.InvoiceId
WHERE inv.InvoiceDate <= date()
GROUP BY EmployeeId;

-- Drop col used for calculations
ALTER TABLE invoice_items DROP TotalPrice;
