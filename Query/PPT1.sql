/**Index 1**/

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

/**Trigger**/

use biometric_project1

DELIMITER $$
CREATE TRIGGER update_count 
AFTER INSERT on transaction
for each row
BEGIN
update  Account a1
Set a1.balance = a1.balance + NEW.amount
where a1.AccountId = NEW.transactionaccountId;
END $$
DELIMITER ;

insert into transaction values(35,1,1000,'2015/12/02 2:20:45');

select * from transaction;
select * from account;

