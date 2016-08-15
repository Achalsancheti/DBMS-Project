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
    
    SELECT * FROM view_TRANSACTION;


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

/**Custromer Privilege**/

CREATE VIEW view_customerdet AS
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

SELECT 
    *
FROM
    view_customerdet;
    

