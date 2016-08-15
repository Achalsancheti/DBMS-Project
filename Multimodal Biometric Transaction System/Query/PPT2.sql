/**Transaction**/

START Transaction;
savepoint savepoint1;
insert into transaction values(27,2,1000,'2015/12/02 2:20:45');
insert into transaction values(28,3,1000,'2015/12/02 2:20:45');
insert into transaction values(29,4,1000,'2015/12/02 2:20:45');
insert into transaction values(30,2,1000,'2015/12/02 2:20:45');
insert into transaction values(31,6,1000,'2015/12/02 2:20:45');
insert into transaction values(32,4,1000,'2015/12/02 2:20:45');
insert into transaction values(33,1,1000,'2015/12/02 2:20:45');
SELECT * from transaction;
rollback to SAVEPOINT savepoint1;
insert into transaction values(26,1,1000,'2015/12/02 2:20:45');
commit;


/**View to know customer information**/

CREATE VIEW view_customerdetails AS
    SELECT 
        c1.customerId,
        c1.firstName AS FirstName,
        c1.lastName AS LastName,
        a1.balance AS Balance,
        b1.BranchId,
        ad1.addressLine1 AS AddressLine1,
        ad1.addressLine2 AS AddressLine2,
        ad1.zipCode AS ZipCode
    FROM
        ((((customer c1
        INNER JOIN customeraccount ac1 ON c1.CustomerId = ac1.customerId)
        INNER JOIN account a1 ON a1.accountId = ac1.accountId)
        INNER JOIN branch b1 ON a1.branchId = b1.BranchId)
        INNER JOIN address ad1 ON c1.customerAddressId = ad1.AddressId)
    WHERE
        b1.BranchId = 1
    ORDER BY balance DESC;

SELECT 
    *
FROM
    view_customerdetails;


/**View to know customer and its nominee**/

CREATE VIEW view_Customer AS
    SELECT 
        C1.customerId,
        CONCAT_WS(' ', C1.firstname, c1.lastname) AS CustomerName,
        CONCAT_WS(' ', n1.firstName, n1.lastname) AS NomineeName
    FROM
        ((((nominee n1
        INNER JOIN accountnominee an1 ON n1.nomineeId = an1.customerNomineeId)
        INNER JOIN account a1 ON an1.customerAccountId = a1.accountId)
        INNER JOIN customeraccount ca1 ON a1.AccountId = ca1.AccountId)
        INNER JOIN customer c1 ON ca1.customerId = c1.customerId)
    ORDER BY c1.CustomerId;

SELECT * FROM view_Customer;


/**Index 1**/

create index index_nominee on nominee
(nomineeId, firstname);

SELECT 
    nomineeId AS NomineeID, firstname AS FirstName
FROM
    nominee; 

/**Index 2**/

create index index_account on account
(AccountId, balance, openDate, BranchId);

SELECT 
    AccountId AS AccountID,
    balance AS Balance,
    openDate AS OpenDate,
    BranchId
FROM
    account;


/**User Privileges**/

/**Employee**/
show grants for 'shabbir'@'localhost';

/**Admin**/
show grants for 'achal'@'localhost';

/**Customer**/
show grants for 'pallak'@'localhost';


/**Custromer Privilege**/

    SELECT 
        c1.customerId,
        c1.firstName AS FirstName,
        c1.lastName AS LastName,
        a1.balance AS Balance,
        b1.BranchId,
        ad1.addressLine1 AS AddressLine1,
        ad1.addressLine2 AS AddressLine2,
        ad1.zipCode AS ZipCode
    FROM
        ((((customer c1
        INNER JOIN customeraccount ac1 ON c1.CustomerId = ac1.customerId)
        INNER JOIN account a1 ON a1.accountId = ac1.accountId)
        INNER JOIN branch b1 ON a1.branchId = b1.BranchId)
        INNER JOIN address ad1 ON c1.customerAddressId = ad1.AddressId)
    WHERE
        c1.customerId = 1
    ORDER BY balance DESC;
    
    
/**Stored Procedure to find highest balance of customer **/

use biometric_project1;
create procedure highestCustomerBalance()
SELECT c1.firstName as Name, c1.lastName, a1.balance
FROM (( customer c1
INNER JOIN customeraccount ac1
ON c1.CustomerId =ac1.customerId)
INNER JOIN account a1
ON a1.accountId = ac1.accountId)
order by balance desc;

call highestCustomerBalance();
    
    
/**Stored Procedure to find second highest balance of customer **/

create procedure secondhighestCustomerBalance()
SELECT c1.firstName as Name, c1.lastName, MAX(a1.balance)
FROM (( customer c1
INNER JOIN customeraccount ac1
ON c1.CustomerId =ac1.customerId)
INNER JOIN account a1
ON a1.accountId = ac1.accountId)
 where a1.balance <(SELECT MAX(a1.balance)
FROM (( customer c1
INNER JOIN customeraccount ac1
ON c1.CustomerId =ac1.customerId)
INNER JOIN account a1
ON a1.accountId = ac1.accountId));

call secondhighestCustomerBalance();

/**Stored Procedure to insert data in fingureprintscandetails table **/

DELIMITER $$
USE biometric_project1$$
DROP PROCEDURE IF EXISTS sp_fingerprintscandetails$$
CREATE PROCEDURE sp_fingerprintscandetails(IN FingerPrintIdparam int(11)
, IN arkparam VARCHAR(45)
, IN loopsparam VARCHAR(45)
, IN whorksparam VARCHAR(45)
, IN proparam VARCHAR(45))
BEGIN
INSERT INTO fingerprintscandetails (
FingerPrintId
, ark
, loops
, whorks
, pro)
   VALUES (FingerPrintIdparam
   , arkparam
   , loopsparam
   , whorksparam
   , proparam);

END$$
DELIMITER ;

call sp_fingerprintscandetails(32, "0.47jhcas6s5","1.46a6g6","8.95a4fh","7.64adr9e7");
select * from fingerprintscandetails order by fingerprintId desc;



/**Trigger**/


DELIMITER $$
CREATE TRIGGER customer_uppercase
BEFORE INSERT ON customer 
for each row
BEGIN
SET NEW.firstName=UPPER(NEW.firstName);
SET NEW.middleName=UPPER(NEW.middleName);
SET NEW.lastName=UPPER(NEW.lastName);
END$$
DELIMITER ;

insert into customer value(31,'achal','kumar','sancheti','1993-08-28','11','Male',456965,'achal@gmail.com',22,27);
select * from customer order by customerId desc;


/**subQuery**/

SELECT 
        c1.customerId,
        c1.firstName AS FirstName,
        c1.lastName AS LastName,
        a1.balance AS Balance,
        b1.BranchId
    FROM
        (((customer c1
        INNER JOIN customeraccount ac1 ON c1.CustomerId = ac1.customerId)
        INNER JOIN account a1 ON a1.accountId = ac1.accountId)
        INNER JOIN branch b1 ON a1.branchId = b1.BranchId)
    WHERE 
		a1.balance > ( SELECT avg(balance) from account)
    ORDER BY balance DESC;
    
    select * from account;
    
    
    
SELECT 
    transactionAccountId, SUM(amount) AS Amount
FROM
    transaction
GROUP BY transactionAccountId;









