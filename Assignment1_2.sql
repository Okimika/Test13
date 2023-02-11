/*
Student: Bui Thanh Vinh
Important note: This has example of table relation (1-1,1-m,m-m) for upcoming exam
*/
#Create dtb with guardian pattern
DROP DATABASE IF EXISTS testing_system_assignment_1;
CREATE DATABASE IF NOT EXISTS testing_system_assignment_1;

#Select dtb to work with
USE testing_system_assignment_1;

# Create table queries
CREATE TABLE department(
	DepartmentID TINYINT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(25) NOT NULL UNIQUE
);
CREATE TABLE `position`(
	PositionID TINYINT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(25) NOT NULL UNIQUE
);
CREATE TABLE `account`(
	AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Username VARCHAR(25) NOT NULL UNIQUE,
    Fullname VARCHAR(50) NOT NULL,
    DepartmentID TINYINT NOT NULL,
    PositionID TINYINT NOT NULL,
    CreateDate DATE NOT NULL,
    CONSTRAINT account_deparment_fk FOREIGN KEY(DepartmentID) REFERENCES department(DepartmentID),
    CONSTRAINT account_position_fk FOREIGN KEY(PositionID) REFERENCES `position`(PositionID)
);
CREATE TABLE `group`(
	GroupID TINYINT PRIMARY KEY AUTO_INCREMENT,
	GroupName VARCHAR(100) NOT NULL,
    # CreatorID is actually AccountID, only differ in name
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL,
    CONSTRAINT group_creator_fk FOREIGN KEY(CreatorID) REFERENCES `account`(AccountID)
);
/*
This table uses 2 foreign keys instead of primary
*/
CREATE TABLE GroupAccount(
	GroupID TINYINT NOT NULL,
    AccountID INT NOT NULL,
    JoinDate DATE NOT NULL,
    CONSTRAINT group_account_fk FOREIGN KEY(GroupID) REFERENCES `group`(GroupID),
    CONSTRAINT account_group_fk FOREIGN KEY(AccountID) REFERENCES `account`(AccountID)
);
CREATE TABLE typequestion(
	TypeID SMALLINT PRIMARY KEY AUTO_INCREMENT,
    TypeName ENUM('essay','multiple-choice')
);
CREATE TABLE categoryquestion(
	CategoryID TINYINT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE question(
	QuestionID SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(100) NOT NULL UNIQUE,
    CategoryID TINYINT NOT NULL,
    TypeID SMALLINT NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL,
    CONSTRAINT quest_category_fk FOREIGN KEY(CategoryID) REFERENCES categoryquestion(CategoryID),
    CONSTRAINT quest_type_fk FOREIGN KEY(TypeID) REFERENCES typequestion(TypeID),
    CONSTRAINT quest_creator_fk FOREIGN KEY(CreatorID) REFERENCES `account`(AccountID)
);
CREATE TABLE answer(
	AnswerID SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(500) NOT NULL UNIQUE,
    QuestionID SMALLINT NOT NULL,
    isCorrect BOOLEAN,
    CONSTRAINT answer_quest_fk FOREIGN KEY(QuestionID) REFERENCES question(QuestionID)
);
CREATE TABLE exam(
	ExamID INT PRIMARY KEY AUTO_INCREMENT,
    ExamCode INT NOT NULL UNIQUE,
    Title VARCHAR(100) NOT NULL UNIQUE,
    CategoryID TINYINT NOT NULL,
    Duration TIME NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL,
    CONSTRAINT exam_category_fk FOREIGN KEY(CategoryID) REFERENCES categoryquestion(CategoryID),
    CONSTRAINT exam_creator_fk FOREIGN KEY(CreatorID) REFERENCES `account`(AccountID)
);
CREATE TABLE examquestion(
	ExamID INT NOT NULL,
    QuestionID SMALLINT NOT NULL,
    CONSTRAINT exam_quest_fk FOREIGN KEY(ExamID) REFERENCES exam(ExamID),
    CONSTRAINT quest_id_fk FOREIGN KEY(QuestionID) REFERENCES question(QuestionID)
);