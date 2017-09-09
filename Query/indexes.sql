create index index_nominee on nominee
(nomineeId, firstname);

SELECT 
    nomineeId AS NomineeID, firstname AS FirstName
FROM
    nominee; 



create index index_account on account
(AccountId, balance, openDate, BranchId);

SELECT 
    AccountId AS AccountID,
    balance AS Balance,
    openDate AS OpenDate,
    BranchId
FROM
    account;



create index index_customer on customer
(CustomerId, firstName, lastName, DOB,Gender, contactDetails);

SELECT 
    CustomerId,
    firstName AS FirstName,
    lastName AS LastName,
    DOB,
    Gender,
    contactDetails
FROM
    customer;



create index index_branch on branch
(BranchId, branchTotalbalance, phoneNo);

SELECT 
    BranchId, branchTotalbalance, phoneNo
FROM
    branch;



create index index_employee on employee
(EmployeeId, firstName, lastName, contactDetails, designation);

SELECT 
    EmployeeId, firstName, lastName, contactDetails, designation
FROM
    employee;

