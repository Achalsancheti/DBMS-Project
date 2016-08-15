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





select * from transaction;




insert into transaction values(1,1,1000,'2015/12/02 2:20:45');
      insert into transaction values(2,2,-4000,'2015/12/02 3:20:45');
         insert into transaction values(3,3,3000,'2015/12/02 4:20:45');
            insert into transaction values(4,4,2000,'2015/12/02 5:20:45');
insert into transaction values(5,1,1000,'2015/12/02 2:20:45');
      insert into transaction values(6,2,-4000,'2015/12/02 3:20:45');
         insert into transaction values(7,3,3000,'2015/12/02 4:20:45');
            insert into transaction values(8,4,2000,'2015/12/02 5:20:45');
            insert into transaction values(9,1,1000,'2015/12/02 2:20:45');
      insert into transaction values(10,2,-4000,'2015/12/02 3:20:45');
         insert into transaction values(11,3,3000,'2015/12/02 4:20:45');
            insert into transaction values(12,4,2000,'2015/12/02 5:20:45');
            insert into transaction values(13,1,1000,'2015/12/02 2:20:45');
      insert into transaction values(14,2,-4000,'2015/12/02 3:20:45');
         insert into transaction values(15,3,3000,'2015/12/02 4:20:45');
            insert into transaction values(16,4,2000,'2015/12/02 5:20:45');
            insert into transaction values(17,1,1000,'2015/12/02 2:20:45');
      insert into transaction values(18,2,-4000,'2015/12/02 3:20:45');
         insert into transaction values(19,3,3000,'2015/12/02 4:20:45');
            insert into transaction values(20,4,2000,'2015/12/02 5:20:45');
            insert into transaction values(21,1,1000,'2015/12/02 2:20:45');
      insert into transaction values(22,2,-4000,'2015/12/02 3:20:45');
         insert into transaction values(23,3,3000,'2015/12/02 4:20:45');
            insert into transaction values(24,4,2000,'2015/12/02 5:20:45');
    
    