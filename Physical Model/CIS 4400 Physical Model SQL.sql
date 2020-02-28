CREATE TABLE Loan_Dim
(
  loantype_dim_id INT PRIMARY KEY, 
  LoanTypeID INT(15), 
  LoanType VARCHAR(12)
);

CREATE TABLE Age_Dim
(
  Age_dim_id INT PRIMARY KEY, 
  AgeID VARCHAR(5), 
  AgeGroup VARCHAR(6)
);

CREATE TABLE RaceEthinicity_Dim
(
  race_ethnicity_id INT PRIMARY KEY,
  RaceEthnicityID INT(15), 
  RaceEthnicity VARCHAR(23)
);

CREATE TABLE Gender_Dim
(
  gender_dim_id INT PRIMARY KEY, 
  GenderID INT(15),
  Gender VARCHAR(6)
);

CREATE TABLE Region_Dim
(
  region_dim_id INT PRIMARY KEY, 
  RegionID INT(15),
  Region VARCHAR(3)
);

CREATE TABLE Time_Dim
(
  time_dim_id INT PRIMARY KEY, 
  TimeID INT(15),
  Year DateTime
);

CREATE TABLE Loan_Fact
(
  HELOC INT(15),
  AutoLoan INT(15),
  CreditCard INT(15),
  StudentLoan INT(15),
  Other INT(15),
  Time INT(15),
  TimeID INT(15),
  time_dim_id INT(15),
  LoanSum Double,
  CreditOtherSum Double,
  TotalDollar Double
);

ALTER TABLE `loan_fact` ADD CONSTRAINT `loan_fact_FK1` FOREIGN KEY (`time_dim_id`)
			references `Time_Dim` (`time_dim_id`);

CREATE TABLE Death_Fact
(
  time_dim_id INT, 
  gender_dim_id INT, 
  race_ethnicity_id INT, 
  Age_dim_id INT, 
  region_dim_id INT, 
  TotalDeathsAgeGenderEth DOUBLE
);

ALTER TABLE `Death_Fact` ADD CONSTRAINT `death_fact_FK1` FOREIGN KEY (`time_dim_id`)
			references `Time_Dim` (`time_dim_id`);

ALTER TABLE `Death_Fact` ADD CONSTRAINT `death_fact_FK2` FOREIGN KEY (`gender_dim_id`)
			references `gender_dim` (`gender_dim_id`);

ALTER TABLE `Death_Fact` ADD CONSTRAINT `death_fact_FK3` FOREIGN KEY (`race_ethnicity_id`)
			references `raceethinicity_dim` (`race_ethnicity_id`);

ALTER TABLE `Death_Fact` ADD CONSTRAINT `death_fact_FK4` FOREIGN KEY (`age_dim_id`)
			references `age_dim` (`age_dim_id`);
            
ALTER TABLE `Death_Fact` ADD CONSTRAINT `death_fact_FK5` FOREIGN KEY (`region_dim_id`)
			references `region_dim` (`region_dim_id`);
            
CREATE TABLE Birth_Fact
(
   GenderID INT(15),
   TimeID INT(15),
   RaceEthnicityID INT(15),
   BirthYear INT(15),
   SexOfInfant VARCHAR(6), 
   RaceOfMother VARCHAR(23),
   Births DECIMAL(30, 0),
   Percentage DECIMAL(4, 1), 
   race_ethnicity_id INT,
   time_dim_id INT,
   gender_dim_id INT
);

ALTER TABLE `birth_fact` ADD CONSTRAINT `birth_fact_FK1` FOREIGN KEY (`race_ethnicity_id`)
			references `raceethinicity_dim` (`race_ethnicity_id`);
            
ALTER TABLE `birth_fact` ADD CONSTRAINT `birth_fact_FK2` FOREIGN KEY (`time_dim_id`)
			references `time_dim` (`time_dim_id`);
            
ALTER TABLE `birth_fact` ADD CONSTRAINT `birth_fact_FK3` FOREIGN KEY (`gender_dim_id`)
			references `gender_dim` (`gender_dim_id`);