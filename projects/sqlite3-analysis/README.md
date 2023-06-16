## Instructions

```bash
# Open the database:
sqlite3 ./chinook.db
```

```sql
-- Enable some features and export the CSV results of the script
.headers on
.mode csv
.output /home/cmc/git/data-science/projects/sql-dashboard/employee_sales.csv
.read employee_sales.sql
```

```bash
# Inspect the results
cat ./employee_sales.csv
```

```csv
EmployeeId,LastName,FirstName,Title,CustomerId,SupportRepId,State,Country,InvoiceId,CustomerId,InvoiceDate,InvoiceId,UnitPrice,Quantity,TotalPrice
3,Peacock,Jane,"Sales Support Agent",1,3,SP,Brazil,98,1,"2010-03-11 00:00:00",98,1.99,1,1.99
4,Park,Margaret,"Sales Support Agent",4,4,,Norway,2,4,"2009-01-02 00:00:00",2,0.99,1,0.99
5,Johnson,Steve,"Sales Support Agent",2,5,,Germany,1,2,"2009-01-01 00:00:00",1,0.99,1,0.99
```
