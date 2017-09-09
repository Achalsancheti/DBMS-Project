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
ON a1.accountId = ac1.accountId))

call secondhighestCustomerBalance()



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

call sp_fingerprintscandetails(32, "0.47jhcas6s5","1.46a6g6","8.95a4fh","7.64adr9e7")



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



/**Stored Procedure to verify customer using two biometrics**/

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_verifier$$
CREATE PROCEDURE sp_verifier()
BEGIN
Select b1.BiometricId, b1.FingerPrintId, b1.retinaId, c1.customerId, a1.AccountId
 from ((((biometric b1
INNER JOIN fingerprintscandetails f1
ON b1.FingerPrintId = f1.FingerPrintId)
Left Outer JOIN retinascandetails r1
ON b1.retinaId = r1.retinaId)
Left Outer JOIN customer c1
ON b1.BiometricId = c1.BiometricId)
Left Outer join CustomerAccount a1 
On c1.CustomerId = a1.CustomerId)
order by c1.customerId;
END$$
DELIMITER ;

call sp_verifier()



