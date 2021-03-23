CREATE TABLE IF NOT EXISTS account (
	account_id serial UNIQUE PRIMARY KEY ,
	bank_name VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL ,
	credit INT );
/*
INSERT INTO account (bank_name,name,credit) VALUES 
	('SpearBank','Azat',1000),
	('Tinkoff','Sergey',1000),
	('SpearBank','Anton',1000),
	('-','Fees',0);
*/
BEGIN TRANSACTION;
SAVEPOINT SP;
UPDATE account
	SET credit = credit - 500
	WHERE account_id = 1;
	
UPDATE account
	SET credit = credit + 500
	WHERE account_id = 3;
	
ROLLBACK TO SAVEPOINT SP;
COMMIT;

BEGIN TRANSACTION;
SAVEPOINT SP;
UPDATE account
	SET credit = credit - 730
	WHERE account_id = 2;
	
UPDATE account
	SET credit = credit + 700
	WHERE account_id = 1;
	
UPDATE account
	SET credit = credit + 30
	WHERE account_id = 4;
	
ROLLBACK TO SAVEPOINT SP;
COMMIT;

BEGIN TRANSACTION;
SAVEPOINT SP;
UPDATE account
	SET credit = credit - 130
	WHERE account_id = 2;
	
UPDATE account
	SET credit = credit + 100
	WHERE account_id = 3;
	
UPDATE account
	SET credit = credit + 30
	WHERE account_id = 4;
	
ROLLBACK TO SAVEPOINT SP;
COMMIT;

SELECT * FROM account;




