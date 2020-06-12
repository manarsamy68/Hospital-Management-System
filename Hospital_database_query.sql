
--create stetment

create table departments
( department_number             int             primary key   ,
  department_name               varchar(50)     not null      ,
  department_manager            varchar(50)                   );
create table doctors
( doctor_id                int                  primary key   ,
  doctor_name              varchar(50)                        ,
  doctor_age               int                                ,
  doctor_specialization    varchar(50)                        ,
  doctor_phone             int                                ,
  doctor_address           varchar(50)                        , 
  doctor_salary            int                                ,
  department_number int FOREIGN KEY REFERENCES departments (department_number) );
create table treatment
( treatment_code                  int           primary key  ,
  treatment_name                 varchar(50)    not null     ,
  treatment_price                int                         ,
  treatment_expire               int                         );
create table patients
( patient_id             int   primary key       not null     ,
  patient_name           varchar(50)                          ,
  patient_age            int                                  ,
  type_of_disease        varchar(50)                          ,
  patient_phone          int                                  ,
  patient_address        varchar(50)                          ,
  doctor_id int FOREIGN KEY REFERENCES doctors (doctor_id)    ,
  treatment_code int FOREIGN KEY REFERENCES treatment(treatment_code ));



  --insert into departments

insert into departments
values(3,'Cardiac surgery','Islam');

insert into departments
values(5,'Orthopedic','Ahmed');

insert into departments
values(4,'Ophthalmology','Manar');

insert into departments
values(2,'Intensive care unit','Hayah');

insert into departments
values(1,'surgery','Yousef');


    --insert into doctors

insert into doctors
values(112,'Reda',40,'eyes doctor',01112223334,'Alexandria',1000,1);

insert into doctors
values(122,'Islam',20,'surgeon',01117788339,'Cairo',20000,2);

insert into doctors
values(123,'Manar',22,'heart’s doctor',01000887761,'Cairo',3000,3);

insert into doctors
values(224,'Noran',23,'orthopedist',01111111112,'Aswan',4000,4);

insert into doctors
values(111,'Mohamed',33,'surgeon',01000223344,'Giza',5000,5);



     --insert into treatment

insert into treatment
values(333344,'Mucophylline', 50, 11082020);

insert into treatment
values(336118,'Contafever', 30, 11092021);

insert into treatment
values(321675,'cyrinol', 25, 11072020);

insert into treatment
values(436114,'congistal', 60, 210902022);

insert into treatment
values(356775,'1,2,3', 22, 11122020);



--insert into patients

insert into patients 
values(1,'ali',25,'Heart disease',01006723456,'cairo',112,333344);

insert into patients 
values(2,'ahmed',22,'Diabetic',01057236,'kfs',122,321675);

insert into patients 
values(3,'mostafa',70,'Alzheimer',01672356,'alex',224,321675);

insert into patients 
values(4,'fahmy',85,'Cancer',021007,'cairo',112,333344);

insert into patients 
values(5,'khalid',25,'Diabetic',30056,'cairo',111,356775);


-- update statement

update doctors
set doctor_name = 'Osama'
where doctor_name = 'mohamed';

update doctors
set doctor_salary = 3000
where doctor_salary = 2000;

update patients
set type_of_disease = 'Heart disease'
where type_of_disease = 'Cancer';

update patients
set patient_age = 10
where patient_age = 7;

update departments
set department_manager = 'Samy'
where department_manager = 'Manar';



-- delete statement

delete from doctors
where doctor_name = 'mohamed';

delete from departments
where department_number = 6;

delete from doctors
where doctor_age =32;

delete from treatment
where treatment_expire = 210902022;

delete from patients
where patient_age =85;



--select statement

select * from doctors;

select doctor_name,doctor_id
from doctors;

select Max (doctor_salary)
from doctors;

select sum (doctor_salary) from doctors;

select avg (doctor_salary) from doctors;

select avg (doctor_salary) from doctors
where department_number = 3;

select max(doctor_salary) , min(doctor_salary)
from doctors;

select * from doctors
where doctor_address = 'cairo' or doctor_name = 'Islam';

select * from doctors
where doctor_name like ' %Manar% ';

select * from patients;

select Count(patient_id)
from patients;

select patient_name,patient_id,patient_age	
from patients 
where patient_age < 10;

select * from patients
where patient_address = 'cairo' or patient_age > 20;

select * from patients
where patient_age between 20 and 50;

select * from departments; 

select * from departments
where department_manager = 'Manar'

select * from departments
where department_name like ' %Intensive% ';


select * from departments
where department_manager not in ( 'Manar' , 'Islam');

select * from departments
where department_number between 1 and 4;


select * from treatment;

select * from treatment
where treatment_price > 50;


select treatment_name,treatment_code,treatment_expire
from treatment
where treatment_name = 'congistal' and treatment_price < 25;


select * from treatment
where treatment_price in (22,25);



select department_number, Count(*)
from doctors
group by department_number
HAVING count(*) > 3;

select department_name , count(*)
from doctors , departments
where doctor_salary > 2000
group by department_name
HAVING count(*) > 2;


-- INNER Join
select department_name,doctor_name,doctor_specialization
from departments join doctors
On departments.department_number = doctors.department_number;

-- LEFT Join
select doctor_name,doctor_age,patient_name 
from doctors left join patients 
on doctors.doctor_id= patients.doctor_id
order by doctor_name;

-- RIGHT Join
select patient_name,treatment_name,treatment_price,treatment_expire
from patients right join treatment 
on treatment.treatment_code=patients.treatment_code
order by treatment_name;




-- FULL Join
select doctor_name,doctor_age,patient_name 
from doctors full outer join patients 
on doctors.doctor_id= patients.doctor_id;

-- SELF Join
select * from doctors
where doctor_address = 'cairo' or doctor_name = 'Islam';


--Sub query

select doctor_id , doctor_name
from doctors
where doctor_salary = (select max (doctor_salary) from doctors);

select doctor_id , doctor_address , doctor_name
from doctors
where department_number = (select department_number from doctors 
where doctor_name = 'Manar' );

select patient_id , patient_name , patient_address
from patients
where patient_age = (select max (patient_age) from patients);