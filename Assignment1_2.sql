CREATE DATABASE department;
USE department;
CREATE TABLE department(
	DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(25) NOT NULL UNIQUE
);
CREATE TABLE `position`(
	PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(25) NOT NULL UNIQUE
);
CREATE TABLE `account`(
	AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Username VARCHAR(25) NOT NULL UNIQUE,
    Fullname VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    PositionID INT NOT NULL,
    CreateDate DATE NOT NULL
);
CREATE TABLE `group`(
	GroupID INT PRIMARY KEY AUTO_INCREMENT,
	GroupName VARCHAR(100) NOT NULL,
    CreatorID INT NOT NULL UNIQUE,
    CreateDate DATE NOT NULL
);
CREATE TABLE GroupAccount(
	GroupID INT NOT NULL,
    AccountID INT NOT NULL,
    JoinDate DATE NOT NULL
);
CREATE TABLE typequestion(
	TypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName ENUM('essay','multiple-choice')
);
