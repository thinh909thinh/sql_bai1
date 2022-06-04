USE ex4
GO
CREATE TABLE Book(
    BookCode int PRIMARY KEY,
    BookTitle varchar(100),
    Author varchar(50),
    Edition int IDENTITY,
    BookPrice money ,
    Copies int
)
CREATE TABLE Member(
    MemberCode int PRIMARY KEY,
    Name varchar(50),
    Address varchar(100),
    PhoneNumber int 
)
CREATE TABLE IssueDetails(
    BookCode int CONSTRAINT fk FOREIGN KEY(BookCode) REFERENCES Book(BookCode),
    MemberCode int CONSTRAINT ck FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode),
    IssueDate datetime,
    ReturnDate datetime
)
INSERT INTO Book(BookCode,BookTitle,Author,BookPrice,Copies)
    VALUES(1,'ABC','MXT',1,1)
	INSERT INTO Book(BookCode,BookTitle,Author,BookPrice,Copies)
    VALUES(1000,'AdBC','MdXT',11,12)
	INSERT INTO Book(BookCode,BookTitle,Author,BookPrice,Copies)
    VALUES(1300,'Ad3BC','MqdXT',1122,121)
SELECT * FROM Book
INSERT INTO Member(MemberCode,Name,Address,PhoneNumber)
    VALUES(1,'Tien','Doi Nhan',0988362662)
	INSERT INTO Member(MemberCode,Name,Address,PhoneNumber)
    VALUES(2,'Thinh','dep trai',0968668874)
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate)
    VALUES(1,1,'05-12-2022','05-19-2022')
	SELECT * FROM Member
ALTER TABLE IssueDetails
    DROP CONSTRAINT fk;
ALTER TABLE Book
    DROP CONSTRAINT PK__Book__0A5FFCC69C68AF3F;
ALTER TABLE Book
    ADD CONSTRAINT pk PRIMARY KEY (BookCode)
ALTER TABLE Book
    ADD CONSTRAINT CHK PRIMARY KEY (BookPrice)

ALTER TABLE IssueDetails
    DROP CONSTRAINT ck;
ALTER TABLE Member
    DROP CONSTRAINT PK__Member__84CA637669BF0638;
ALTER TABLE Member
    ADD CONSTRAINT CK PRIMARY KEY (MemberCode)

ALTER TABLE IssueDetails
    ADD CONSTRAINT MK FOREIGN KEY (BookCode) REFERENCES Book(BookCode)
ALTER TABLE IssueDetails
    ADD CONSTRAINT DK FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)


ALTER TABLE Book
    ADD CONSTRAINT pkh CHECK (BookPrice >0 AND BookPrice<200)
ALTER TABLE Member
    ADD CONSTRAINT duynhat UNIQUE  (PhoneNumber)
ALTER TABLE IssueDetails
	ALTER COLUMN BookCode int NOT NULL;
ALTER TABLE IssueDetails
	ALTER COLUMN MemberCode int NOT NULL;
ALTER TABLE IssueDetails
	ADD CONSTRAINT khoachinh PRIMARY KEY (BookCode, MemberCode);
select *from IssueDetails
select *from Member
select *from Book
