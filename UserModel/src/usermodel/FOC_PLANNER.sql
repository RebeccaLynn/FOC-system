DROP DATABASE IF EXISTS FOC_DB;
CREATE DATABASE IF NOT EXISTS FOC_DB;
GRANT ALL PRIVILEGES ON FOC_DB.* TO 'Useruser'@'localhost' identified by 'user';
USE FOC_DB;

CREATE TABLE committiees
(
    id INT NOT NULL AUTO_INCREMENT,
    cName VARCHAR(50),
    PRIMARY KEY (id)
);
INSERT INTO committiees VALUES (1, 'Undergraduate Education');
INSERT INTO committiees VALUES (2, 'Treasure');
INSERT INTO committiees VALUES (3, 'Academics Services');
INSERT INTO committiees VALUES (4, 'Test Scores');

--select * from committiees;

CREATE TABLE members
(
    memberPK_id INT NOT NULL AUTO_INCREMENT,
    memberFK_id int,
    fName VARCHAR (50),
    lName VARCHAR (50), 
    active VARCHAR (3),
    previousPos VARCHAR (50),
    currentPos  VARCHAR (50),
    interests   VARCHAR (50),
    dateActivity DATE ,
    PRIMARY KEY(memberPK_id),
    FOREIGN KEY (memberFK_id) REFERENCES committiees(id)
);

INSERT INTO members VALUES (1,3,'James','Brown','Yes','Freshmen Services',
                            'Sophmore Services','Fishing','2012-03-13');
INSERT INTO members VALUES (2,4,'Kelly','Brown','No','Freshmen Test Scores',
                            'None','Rugby','2011-11-13');
INSERT INTO members VALUES (3,2,'Rebecca','Wright','Yes','Tuition Costs',
                            'Text Book Costs','Reading','2012-03-13');
INSERT INTO members VALUES (4,1,'Kwadwo','Brobbey','Yes','Junior Internship',
                            'Freshmen Classes','Soccer','2013-01-23');
INSERT INTO members VALUES (5,3,'Jennifer','Brenton','No','None',
                            'None','Fishing', CURDATE());

--SELECT * from members;


CREATE TABLE positions
(
    positionPK_id INT NOT NULL AUTO_INCREMENT,
    positionFK_id INT,
    posName VARCHAR (50),
    posVacancy VARCHAR(3),
    PRIMARY KEY (positionPK_id),
    FOREIGN KEY (positionFK_id) REFERENCES committiees(id)
);

INSERT INTO positions VALUES (1,1,'Junior Internship', 'NO');
INSERT INTO positions VALUES (2,4,'Freshmen Test Scores', 'YES');
INSERT INTO positions VALUES (3,2,'Tuition Costs', 'YES');
INSERT INTO positions VALUES (4,3,'Sophmore Services', 'NO');

--select * from positions;
