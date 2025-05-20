

--1
SELECT 
    L.LibraryID, 
    L.Name AS LibraryName, 
    S.FullName AS ManagerName
FROM 
    Library L
JOIN 
    Staff S ON L.ManagerID = S.StaffID;
	--2. 
	SELECT 
    L.Name AS LibraryName,
    B.Title AS BookTitle
FROM 
    Library L
INNER JOIN 
    Book B ON L.LibraryID = B.LibraryID
WHERE 
    B.IsAvailable = 1; --IsAvailable is a BIT type, which can only store 0 or 1
	--3.
	SELECT 
    M.MemberID,
    M.FullName,
    M.Email,
    M.Phone,
    M.MembershipStartDate,
    L.LoanID,
    L.BookID,
    L.LoanDate,
    L.DueDate,
    L.ReturnDate,
    L.Status
FROM 
    Member M
LEFT JOIN 
    Loan L ON M.MemberID = L.MemberID;
	-- Why LEFT JOIN?
--So even members who never borrowed will appear
--Loan columns will be NULL if they have no loan

--4.
SELECT 
    B.BookID,
    B.Title,
    B.ISBN,
    B.Price,
    B.ShelfLocation,
    L.Name AS LibraryName,
    L.Address
FROM 
    Book B
JOIN 
    Library L ON B.LibraryID = L.LibraryID
WHERE 
    L.Address IN ('Zamalek', 'Downtown');

	--5.
	SELECT 
    BookID,
    Title,
    ISBN,
    Price,
    ShelfLocation
FROM 
    Book
WHERE 
    Title LIKE 'T%';
	--LIKE 'T%' means:
--Match any title that starts with T, followed by anything else

--6.
SELECT DISTINCT 
    M.FullName
FROM 
    Member M
JOIN 
    Loan L ON M.MemberID = L.MemberID
JOIN 
    Book B ON L.BookID = B.BookID
WHERE 
    B.Price BETWEEN 100 AND 300;


	--7.
	SELECT DISTINCT 
    M.FullName
FROM 
    Member M
JOIN 
    Loan L ON M.MemberID = L.MemberID
JOIN 
    Book B ON L.BookID = B.BookID
WHERE 
    B.Title = 'The Alchemist'
    AND L.Status = 'Returned';
	 
	 --8
	 SELECT DISTINCT 
    M.FullName
FROM 
    Member M
JOIN 
    Loan L ON M.MemberID = L.MemberID
JOIN 
    Staff S ON L.StaffID = S.StaffID
WHERE 
    S.FullName = 'Sarah Fathy';


	--9
	SELECT 
    M.FullName,
    B.Title AS BookTitle
FROM 
    Member M
JOIN 
    Loan L ON M.MemberID = L.MemberID
JOIN 
    Book B ON L.BookID = B.BookID
ORDER BY 
    B.Title;


	--10
SELECT 
    B.Title AS BookTitle,
    L.Name AS LibraryName,
    S.FullName AS ManagerName,
    B.ShelfLocation
FROM 
    Book B
JOIN 
    Library L ON B.LibraryID = L.LibraryID
JOIN 
    Staff S ON L.ManagerID = S.StaffID
WHERE 
    L.Address = 'Downtown';



UPDATE Library
SET ManagerID = 1  -- replace with a valid StaffID
WHERE Address = 'Downtown';

SELECT * FROM Library;

--11.DISPLAY ALL STAFF MANAGERS
SELECT 
    S.StaffID,
    S.FullName AS ManagerName,
    L.Name AS LibraryName,
    L.Address
FROM 
    Staff S
JOIN 
    Library L ON S.StaffID = L.ManagerID;

	--12
	SELECT 
    M.FullName,
    B.Title AS BookTitle,
    R.Rating,
    R.Comment,
    R.ReviewDate
FROM 
    Member M
LEFT JOIN 
    Review R ON M.MemberID = R.MemberID
LEFT JOIN 
    Book B ON R.BookID = B.BookID;
