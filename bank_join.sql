SELECT 
    B.BranchID,
    B.Name AS BranchName,
    E.Name AS ManagerName
FROM 
    Branch B
JOIN 
    Employee E ON B.ManagerID = E.EmployeeID;


	--2
	SELECT 
    B.Name AS BranchName,
    A.AccountNumber,
    A.Type AS AccountType,
    A.Balance
FROM 
    Branch B
JOIN 
    Account A ON B.BranchID = A.BranchID;


	--3.
	SELECT 
    C.CustomerID,
    C.Name AS CustomerName,
    C.Address,
    C.Phone,
    L.LoanID,
    L.Amount AS LoanAmount,
    L.Type AS LoanType,
    L.IssueDate
FROM 
    Customer C
JOIN 
    Loan L ON C.CustomerID = L.CustomerID;

	--4.
	SELECT 
    L.LoanID,
    L.Amount,
    L.Type,
    L.IssueDate,
    B.Name AS BranchName,
    B.Location
FROM 
    Loan L
JOIN 
    Loan_Assigned LA ON L.LoanID = LA.LoanID
JOIN 
    Employee E ON LA.EmployeeID = E.EmployeeID
JOIN 
    Branch B ON E.BranchID = B.BranchID
WHERE 
    B.Location IN ('Alexandria', 'Giza');

	--5.
	SELECT 
    A.AccountNumber,
    A.Type AS AccountType,
    A.Balance,
    C.Name AS CustomerName,
    B.Name AS BranchName
FROM 
    Account A
JOIN 
    Customer C ON A.CustomerID = C.CustomerID
JOIN 
    Branch B ON A.BranchID = B.BranchID
WHERE 
    A.Type LIKE 'S%';
	--6.
	SELECT 
    C.Name AS CustomerName,
    A.AccountNumber,
    A.Type AS AccountType,
    A.Balance,
    B.Name AS BranchName
FROM 
    Customer C
JOIN 
    Account A ON C.CustomerID = A.CustomerID
JOIN 
    Branch B ON A.BranchID = B.BranchID
WHERE 
    A.Balance BETWEEN 20000 AND 50000;

	--7.
SELECT 
    C.Name AS CustomerName,
    L.Amount,
    L.Type AS LoanType,
    B.Name AS BranchName
FROM 
    Loan L
JOIN 
    Customer C ON L.CustomerID = C.CustomerID
JOIN 
    Loan_Assigned LA ON L.LoanID = LA.LoanID
JOIN 
    Employee E ON LA.EmployeeID = E.EmployeeID
JOIN 
    Branch B ON E.BranchID = B.BranchID
WHERE 
    B.Name = 'Cairo Main Branch';




	SELECT Name FROM Branch;
	SELECT * FROM Loan WHERE Amount > 100000;
	SELECT * FROM Loan_Assigned WHERE LoanID = 2001;
	SELECT 
    E.EmployeeID, E.Name, B.Name AS BranchName
FROM 
    Employee E
JOIN 
    Branch B ON E.BranchID = B.BranchID;

	--8.
	SELECT 
    C.CustomerID,
    C.Name AS CustomerName,
    E.Name AS EmployeeName,
    A.ActionType,
    A.ActionDate
FROM 
    Assist A
JOIN 
    Customer C ON A.CustomerID = C.CustomerID
JOIN 
    Employee E ON A.EmployeeID = E.EmployeeID
WHERE 
    E.Name = 'Amira Khaled';

	--9.
	SELECT 
    C.CustomerID,
    C.Name AS CustomerName,
    A.AccountNumber,
    A.Type AS AccountType,
    A.Balance
FROM 
    Account A
JOIN 
    Customer C ON A.CustomerID = C.CustomerID
ORDER BY 
    A.Type;


	--10.
	SELECT 
    L.LoanID,
    C.Name AS CustomerName,
    E.Name AS EmployeeName,
    B.Name AS BranchName
FROM 
    Loan L
JOIN 
    Customer C ON L.CustomerID = C.CustomerID
JOIN 
    Loan_Assigned LA ON L.LoanID = LA.LoanID
JOIN 
    Employee E ON LA.EmployeeID = E.EmployeeID
JOIN 
    Branch B ON E.BranchID = B.BranchID
WHERE 
    B.Location = 'Cairo';

	--11.
	SELECT 
    E.EmployeeID,
    E.Name AS EmployeeName,
    B.Name AS BranchName
FROM 
    Employee E
inner JOIN 
    Branch B ON B.ManagerID = E.EmployeeID;

	--12.
	SELECT 
    C.CustomerID,
    C.Name AS CustomerName,
    T.TransactionID,
    T.Amount,
    T.Type,
    T.Date
FROM 
    Customer C
LEFT JOIN 
    Account A ON C.CustomerID = A.CustomerID
LEFT JOIN 
    [Transaction] T ON A.AccountNumber = T.AccountNumber;

	--All customers (even those who never transacted)
--Their transactions (if any): TransactionID, Amount, Type, Date

