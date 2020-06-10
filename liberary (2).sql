
ctreate database libarary;
create table Users (
  userID int primary key,
  ufirstname varchar (max) ,
  ulastname varchar(max), 
  Phonenumber nvarchar(max),
  uemail_address text
  );
  create table categories (
  categorieid int primary key,
  Cname varchar(max)
    
   );
create table books ( 
 bookID int primary key, 
 bname varchar(max),
 bcategorieid int foreign key references categories(categorieid), 
 bauthorname varchar(max) 
  );

create table borrowing (
   bookID int foreign key references books(bookID),
   userid int foreign key references Users(userID), 
   borrowdate date, 
   returndate date, 
   price int 
   );
     
use libarary ;
   
INSERT INTO Users VALUES (1562,'laila', 'mohamed','01023461754','laila16@gmail.com');
INSERT INTO Users VALUES (1456,'hedaia', 'ahmed','01023445754','hedaia256@gmail.com');
INSERT INTO Users VALUES (1789,'aya', 'ali','01023411754','ali2000@gmail.com');
INSERT INTO Users VALUES (1426,'noha', 'ahmad','01022261754','noha2000@gmail.com');
INSERT INTO Users VALUES (4635, 'zeynap', 'ali','01023331954','zeynap765@gmail.com');
INSERT INTO Users VALUES (6327, 'salma', 'mohamed','01023461123','salma754@gmail.com');
INSERT INTO Users VALUES (9723,'ali', 'mohamed','01023466385','ali2000@gmail.com');
INSERT INTO Users VALUES (3654, 'ahmed', 'ali','01023234754','ahmed45@gmail.com');
INSERT INTO Users VALUES (8756, 'salma', 'ali','01023461333','salma2000@gmail.com');
INSERT INTO Users VALUES (8136,'omar', 'eslam','01026661754','omar2000@gmail.com');
INSERT INTO Users VALUES (1784,'zayna', 'mohamed','01023455754','zayna3456@gmail.com');
INSERT INTO Users VALUES (1897,'heba', 'esmail','01027761754','heba679@gmail.com');
INSERT INTO Users VALUES (1875,'nour', 'fawzy','01044461754','nour342@gmail.com');
INSERT INTO Users VALUES (5689,'amr', 'medhat','01023471754','amr103@gmail.com');
INSERT INTO Users VALUES (1876,'habiba', 'mohamed','01023467349','habiba20440@gmail.com');

 
   
INSERT INTO  categories VALUES (1,'Literature')
INSERT INTO  categories VALUES (2,'Philosophical')
INSERT INTO  categories VALUES (3,'Maths')
INSERT INTO  categories VALUES (4,'Religious')
INSERT INTO  categories VALUES (5,'Languages')


INSERT INTO books VALUES (675,'Every Good Endeavour',4,'Timothy Keller')
INSERT INTO books VALUES (785,'A History of Western Philosophy',2,'Bertrand Russell')
INSERT INTO books VALUES (369,'Calculus Made Easy',3,' Silvanus P. Thompson')
INSERT INTO books VALUES (753,'Man’s Search for Meaning',2,'Viktor Frankl')
INSERT INTO books VALUES (852,'Calculus On Manifolds',3,' Michael Spivak')

INSERT INTO  borrowing VALUES (675,5689,'2020-05-10','2020-05-23',486)
INSERT INTO  borrowing VALUES (785,8756,'2020-03-6','2020-03-28',298)
INSERT INTO  borrowing VALUES (369,9723,'2020-05-14','2020-05-28',453)
INSERT INTO  borrowing VALUES (753,1456,'2020-10-10','2020-11-01',275)
INSERT INTO  borrowing VALUES (852,8136,'2020-02-23','2020-03-10',543)

SELECT AVG(price) FROM  borrowing;
SELECT min(price) FROM  borrowing;
SELECT max(price) FROM  borrowing;
SELECT DATEPART(year, borrowdate)  from borrowing;
SELECT DATEPART(year, returndate)  from borrowing;
SELECT DATEPART(DAY, borrowdate)  from borrowing;
SELECT DATEPART(DAY, returndate)  from borrowing;
SELECT DATENAME(MONTH,borrowdate ) from borrowing;
SELECT DATENAME(MONTH,returndate) from borrowing;
SELECT UPPER(ufirstname) from Users;
SELECT UPPER(ulastname) from Users;
SELECT difference(ulastname,ufirstname) from Users;
SELECT concat(ulastname,ufirstname) from Users;
SELECT LEN(bname) from books;
SELECT LEN(bauthorname) from books;
SELECT LEN(Cname) from categories;
SELECT STR(bookID) from books;
SELECT STR(bcategorieid) from books;
SELECT ISNULL(Null,ulastname) from Users;
SELECT ISNULL(Null, borrowdate) from borrowing;

select bookID from books
  where  bname = 'Every Good Endeavour';


select userID from borrowing 
  where bookID in (
    select bookID from books
      where bookID > 675
    );

 
select userID from borrowing
  where bookID = any(
    select bookID from books
      where bookID < 6000
  );

  select COUNT(ufirstname) 
  from Users 
  where ufirstname in(
    select ufirstname from Users
      where LEN(ufirstname) = 4
  );
  
  select COUNT( bookID) 
  from books
  where  bookID in(
    select  bookID from books
      where  bookID < 785
  );
SELECT books.bookID,borrowing.userid
	FROM books
	INNER JOIN borrowing
	ON  books.bookID = borrowing.bookID;

SELECT books.bname,borrowing.bookID
	FROM books
	LEFT JOIN borrowing 
	ON books.bookID = borrowing.bookID	

SELECT categories.categorieid, books.bname, bauthorname
	FROM categories
	RIGHT JOIN books
	ON categories.categorieid = books.categorieid

SELECT  books.bname, borrowing.bookID
	FROM  books
	FULL OUTER JOIN borrowing
	ON books.bookID = borrowing.bookID
	
SELECT A.bname , B.bauthorname , A.bcategorieid
	FROM books A, books B
	WHERE A.bookID <> B.bookID
	AND A.bcategorieid = B.bcategorieid
	
DELETE FROM Users WHERE ufirstname ='nour';
DELETE FROM Users WHERE ufirstname='ahmed';
DELETE FROM Users WHERE ufirstname='habiba';
DELETE FROM Users WHERE ufirstname='aya';
DELETE FROM Users WHERE ufirstname='ahmed';

UPDATE Users
SET Phonenumber = '01245678493'
WHERE userID = 1562;

UPDATE Users
SET Phonenumber = '01011008768'
WHERE userID= 1456;

UPDATE Users
SET Phonenumber = '01236367424'
WHERE userID = 3654;

UPDATE Users
SET Phonenumber = '01236369824'
WHERE userID = 9723;

UPDATE Users
SET Phonenumber = '012363695674'
WHERE userID = 5689;
