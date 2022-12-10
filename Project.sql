
describe penna;
select * from penna;

###########################################################
#Part 1
###########################################################

#API1
call API1('Trump','2025-11-07 04:00:36','Adams Township - St. Michael Voting Precinct');

#API2
call API2('2020-11-04');

#API3
call API3('Trump');

#API4
call API4('Johnstown - Prospect Voting Precinct');

#API5
call API5('township');

###########################################################
#Part 4 - Triggers
###########################################################

CREATE TABLE TriggerPenna AS SELECT * FROM Penna;
#drop table TriggerPenna;
describe TriggerPenna;

Create Table DeletedTuples(
id int(10),
timestamp datetime,
state varchar(5),
locality varchar(30),
precinct varchar(50),
geo varchar(50),
totalvotes int(10),
Biden int(10),
Trump int(10),
filestamp varchar(50)
);
#drop table DeletedTuples;
Create Table UpdatedTuples(
id int(10),
timestamp datetime,
state varchar(5),
locality varchar(30),
precinct varchar(50),
geo varchar(50),
totalvotes int(10),
Biden int(10),
Trump int(10),
filestamp varchar(50)
);
#drop table UpdatedTuples;
Create Table InsertedTuples(
id int(10),
timestamp datetime,
state varchar(5),
locality varchar(30),
precinct varchar(50),
geo varchar(50),
totalvotes int(10),
Biden int(10),
Trump int(10),
filestamp varchar(50)
);
#drop table InsertedTuples;


SET SQL_SAFE_UPDATES = 0;

#delete from TriggerPenna where totalvotes < 10;
#select * from DeletedTuples;
#select * from TriggerPenna where totalvotes < 10;

#insert into TriggerPenna(id,timestamp,state,locality,precinct,geo,totalvotes,Biden,Trump,filestamp) 
#values(9766,'2023-11-04 04:00:36','NJ','TCNJ','Busch','somewhere over the rainbow','9000','8998','1','google.com');
#select * from InsertedTuples;

#update TriggerPenna set state = 'FL' where Biden>Trump;
#select * from UpdatedTuples;
#select * from TriggerPenna;


########################################################
#Part 4 - MOVE VOTES
########################################################
CREATE TABLE MovePenna AS SELECT * FROM Penna;
#drop table MovePenna;
describe MovePenna;

select * from MovePenna where precinct = 'Adams Township - Dunlo Voting Precinct';

call MoveVotes('Adams Township - Dunlo Voting Precinct','2020-11-04 04:07:12','Trump',10000000);

#######################################################
#Part 3
#######################################################
select case when exists (select * from penna where Trump + Biden > totalvotes)
then 'true' else 'false' end;

select case when exists(select * from penna where timestamp > '2020-11-11' or timestamp < '2020-11-03')
then 'true' else 'false' end;

select case when exists (select * from penna where timestamp > '2020-11-05 00:00:00' and totalvotes < (select totalvotes from penna where precinct = precinct and timestamp = '2020-11-05 00:00:00') )
then 'true' else 'false' end;

#######################################################
#Part 2
#######################################################

#call newPenna();

#call Switch();

