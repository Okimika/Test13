/* 
Student: Bùi Thành Vinh
Important note: Bài có ví dụ lệnh CHECK và data type ENUM để ôn tập.
*/

/*
Khởi tạo database mới:
DROP là guardian pattern trong trường hợp test lại để không lỗi
khi tạo mới database (conflict existed database).
*/
DROP DATABASE IF EXISTS fresher_training_management;
CREATE DATABASE IF NOT EXISTS fresher_training_management;

# Nhớ chọn database thì mới thêm table được (stupid me don't forget in future):
USE fresher_training_management;

# Tạo table theo yêu cầu Quest 1:
CREATE TABLE trainee(
	TraineeID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(30) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('male','female','unknown') NOT NULL,
    ET_IQ TINYINT CHECK( ET_IQ >= 0 AND ET_IQ <= 20),
    ET_Gmath TINYINT CHECK( ET_Gmath >= 0 AND ET_Gmath <= 20),
    ET_English TINYINT CHECK( ET_English >= 0 AND ET_English <= 50),
    Training_Class INT,
    Evaluation_Note VARCHAR(500)
    /*
    <ET_IQ TINYINT, CHECK( ET_IQ >= 0 AND ET_IQ <= 20)> hoặc
	<ET_IQ TINYINT,
	 CHECK( ET_IQ >= 0 AND ET_IQ <= 20)>
	 đều cho ra kết quả theo yêu cầu nhưng chậm hơn bài làm ở trên.
     Credit: Thầy Nam.
     */
);

# Thêm column theo yêu cầu Quest 2:
ALTER TABLE trainee
ADD VTI_Account VARCHAR(25);
