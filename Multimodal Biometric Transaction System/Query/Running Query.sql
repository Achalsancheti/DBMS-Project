/* Query for displaying customer name and account*/

SELECT c1.firstName as Name, c1.lastName, a1.balance
FROM ( customer c1
INNER JOIN customeraccount ac1
ON c1.CustomerId =ac1.customerId)
INNER JOIN account a1
ON a1.accountId = ac1.accountId;

/* Query for displaying biometric data*/

select c1.firstName as Name, c1.lastName as LastName, f1.ark as ARk,f1.loops,f1.whorks,f1.pro
from((biometric b1
INNER JOIN fingerprintscandetails f1
ON b1.FingerPrintId = f1.FingerPrintId)
INNER JOIN customer c1
ON b1.BiometricId = c1.BiometricId
);


select * from branch;

    SELECT count(b1.branchId),
        b1.BranchId
    FROM
        (((customer c1
        INNER JOIN customeraccount ac1 ON c1.CustomerId = ac1.customerId)
        INNER JOIN account a1 ON a1.accountId = ac1.accountId)
        INNER JOIN branch b1 ON a1.branchId = b1.BranchId)
    WHERE
        b1.BranchId in(select BranchId from branch);

