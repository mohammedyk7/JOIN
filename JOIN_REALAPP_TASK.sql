-- Widget 1: Active Orders Summary
SELECT o.OrderID, c.FullName, r.Name AS RestaurantName, o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
WHERE o.Status = 'Preparing';

-- Widget 2: Restaurant Menu Coverage
SELECT m.ItemName, r.Name AS RestaurantName,
       CASE WHEN oi.ItemName IS NOT NULL THEN 'Yes' ELSE 'No' END AS Ordered
FROM Menu m
JOIN Restaurants r ON m.RestaurantID = r.RestaurantID
LEFT JOIN OrderItems oi ON m.ItemName = oi.ItemName;

-- Widget 3: Customers Without Orders
SELECT c.CustomerID, c.FullName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Widget 4: Full Engagement Report
SELECT c.CustomerID, c.FullName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Widget 5: Referral Tree
SELECT c.FullName AS Customer, r.FullName AS ReferredBy
FROM Customers c
LEFT JOIN Customers r ON c.ReferralID = r.CustomerID;

-- Widget 6: Menu Performance Tracker
SELECT r.Name AS Restaurant, m.ItemName,
       COUNT(oi.OrderItemID) AS TimesOrdered,
       COALESCE(SUM(oi.Quantity), 0) AS TotalQuantity
FROM Menu m
JOIN Restaurants r ON m.RestaurantID = r.RestaurantID
LEFT JOIN OrderItems oi ON m.ItemName = oi.ItemName
GROUP BY r.Name, m.ItemName;

-- Widget 7: Unused Customers and Items
SELECT c.FullName AS Name, 'Unused Customer' AS Type
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
UNION
SELECT m.ItemName, 'Unused Item'
FROM Menu m
LEFT JOIN OrderItems oi ON m.ItemName = oi.ItemName
WHERE oi.OrderItemID IS NULL;

-- Widget 8: Orders with Missing Menu Price Match
SELECT oi.*
FROM OrderItems oi
JOIN Orders o ON oi.OrderID = o.OrderID
LEFT JOIN Menu m ON o.RestaurantID = m.RestaurantID AND oi.ItemName = m.ItemName
WHERE m.ItemName IS NULL;

-- Widget 9: Repeat Customers Report
SELECT c.FullName, COUNT(o.OrderID) AS TotalOrders,
       MIN(o.OrderDate) AS FirstOrderDate,
       MAX(o.OrderDate) AS LastOrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FullName
HAVING COUNT(o.OrderID) > 1;

-- Widget 10: Item Referral Revenue
SELECT c.FullName AS Customer, r.FullName AS ReferredBy,
       SUM(oi.Quantity * oi.Price) AS TotalSpent
FROM Customers c
JOIN Customers r ON c.ReferralID = r.CustomerID
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
GROUP BY c.FullName, r.FullName; 

-- Widget 11: Update Prices for Bestsellers
UPDATE m
SET m.Price = m.Price * 1.10
FROM Menu m
JOIN (
  SELECT ItemName
  FROM OrderItems
  GROUP BY ItemName
  HAVING COUNT(*) > 3
) AS popular ON m.ItemName = popular.ItemName;

-- Widget 12: Delete Inactive Customers
DELETE c
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL AND c.ReferralID IS NULL;

-- Widget 13: Adjust Prices for Inactive Restaurants
UPDATE m
SET m.Price = m.Price * 0.85
FROM Menu m
JOIN Restaurants r ON m.RestaurantID = r.RestaurantID
LEFT JOIN Orders o ON r.RestaurantID = o.RestaurantID
WHERE o.OrderID IS NULL;

-- Widget 14: Register VIP Customers
-- First, confirm with SELECT:
SELECT DISTINCT c.CustomerID, c.FullName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID;

-- Then insert manually:
INSERT INTO VIPCustomers(CustomerID, FullName) VALUES (1, 'Ahmed AlHarthy');
INSERT INTO VIPCustomers(CustomerID, FullName) VALUES (2, 'Fatma AlBalushi');

-- Widget 15: Order Dispatch Overview
SELECT c.FullName AS CustomerName, r.Name AS RestaurantName, 
       oi.ItemName, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
JOIN OrderItems oi ON o.OrderID = oi.OrderID;
