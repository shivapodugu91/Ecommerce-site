# Ecommerce-site

UI Tier – ASP.net
App Tier – all business logic, UI and database interaction resides here
DB Tier – MySQL Community Version

Project: 
Create a 3-tier online order entry system which has the following:
(1)	Create User/Password
(2)	Create customer profile (Name, Address, Ship-To Address, Bill-To-Address, Credit Card)
(3)	Login authentication (validate user)
(4)	Create Catalog of items to be sold (SKU, Item Name, Item Description, Price, Available quantity)
(5)	Add items from catalog to order (if available quantity > 0)
(6)	Calculate total price + Sales Tax
(7)	Complete Order
(8)	Create shipment information for each line item in the order. Process shipment: Possible states - Pick, Pack, Ship 
(9)	Show shipment status on the order
(10)	Create subscription templates with due dates

Database Objects: User Table, Customer table, Address Table, Catalog table
Transactional Objects: Order table, LineItems Table, Shipment Table, Subscription Template, Subscription Orders

(1)	Customer Maintenance
•	Create, Update and Delete customer profiles
•	For Delete operation ensure all related orders/shipments are also deleted 

(2)	Catalog Maintenance
•	Add, modify, update catalog items
•	Change price and available quantity on existing items

(3)	Order-Shipments-Returns
•	Create, Modify, and Delete orders
•	Report Order status (order will have 4 states: PENDING, SHIPPED, INVOICED, RETURNED)
•	Report shipment status for each line item of an order (shipments will have 3 states: PICK, PACK, SHIP)
•	Process Returns

(4)	Subscription Orders
•	Create Subscription orders to be fulfilled, for example, every 2, 4, 6 months
•	Create a timer or trigger to start the creation of the order automatically a day before the subscription fulfill date
•	Process the order as all other orders 
