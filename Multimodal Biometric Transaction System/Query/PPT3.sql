/**Index 1**/

create index index_employee on employee
(EmployeeId, firstName, lastName, contactDetails, designation);

SELECT 
    EmployeeId, firstName, lastName, contactDetails, designation
FROM
    employee;


/**Index 2**/
    
create index index_branch on branch
(BranchId, branchTotalbalance, phoneNo);

SELECT 
    BranchId, branchTotalbalance, phoneNo
FROM
    branch;



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

call highestCustomerBalance()



/**Stored Procedure to delete a row from fingerprintscandetails table**/

DELIMITER $$
DROP PROCEDURE IF EXISTS delete_sp_fingerprintscandetails_by_id$$
CREATE PROCEDURE delete_sp_fingerprintscandetails_by_id(IN FingerPrintIdparam int(11))
BEGIN
delete from fingerprintscandetails
where FingerPrintId=FingerPrintIdparam ; 
END$$
DELIMITER ;

call delete_sp_fingerprintscandetails_by_id(32)



/**Stored Procedure for update data in fingureprintscandetails table**/

DELIMITER $$
DROP PROCEDURE IF EXISTS update_sp_fingerprintscandetails_by_id$$
CREATE PROCEDURE update_sp_fingerprintscandetails_by_id(IN FingerPrintIdparam int(11)
, IN arkparam VARCHAR(45)
)
BEGIN
update fingerprintscandetails
set ark= arkparam
where FingerPrintId=FingerPrintIdparam;
END$$
DELIMITER ;

call update_sp_fingerprintscandetails_by_id(29,"1.87kal75")