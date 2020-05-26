drop database if exists crimeSceneInvestigation;
create database crimeSceneInvestigation;
use crimeSceneInvestigation;

create table detective (
detective_id int not null primary key auto_increment,
name varchar(50) not null,
surname varchar(50),
workExpirience decimal(15,3) not null,
active boolean not null,
caseInvestigation  int,
policeDepartment int
);

create table detective_pd(
detective int,
pd int 
);

create table  policeDepartment (
pd_id int not null primary key auto_increment,
name varchar (100) not null,
address varchar(100) not null,
city varchar(50) not null
);

create table caseInvestigation(
case_Id int not null primary key auto_increment,
typeOfCase varchar(100) not null,
openCase boolean not null,
description text not null,
evidence int,
witness int,
victim int ,
caseOpened datetime,
suspect int
);

create table victim(
name varchar(50) not null,
surname varchar(50) not null,
address varchar(100),
description text not null,
alive boolean not null
);

create table witness(
witness_id int not null primary key auto_increment,
name varchar(50) not null,
surname varchar(50) not null,
notes varchar(200)
);

create table evidence(
evidence_id int not null primary key auto_increment,
typeOfEvidence varchar(100) not null,
description text not null,
evidenceFound datetime,
address varchar(100) not null
);

create table evidenceOnCase (
caseInvestigation int,
evidence int
);
