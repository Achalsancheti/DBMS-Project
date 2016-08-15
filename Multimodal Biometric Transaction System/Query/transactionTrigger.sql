insert into transaction values(1,1,1000,'2015/12/02 2:20:45');
      insert into transaction values(2,2,-4000,'2015/12/02 3:20:45');
         insert into transaction values(3,3,3000,'2015/12/02 4:20:45');
            insert into transaction values(4,4,2000,'2015/12/02 5:20:45');
            
            
	insert into transactiontype values(1,'deposit');
      insert into transactiontype values(2,'withdraw');
         insert into transactiontype values(3,'deposit');
            insert into transactiontype values(4,'deposit');
            
            alter table transaction drop column status;

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

drop trigger customer_uppercase;

insert into customer value(31,'achal','kumar','sancheti','1993-08-28','11','Male',456965,'achal@gmail.com',22,27);
select * from customer order by customerId desc;
delete from customer where customerId=31;