--Record Sorting:
--Ascending and descending Orders:
--select * from student order by Age ASC
--select * from student order by Age DESC
--select * from student order by Age (by default ASC is used.)

--select * from student where ID=10 or ID=20
--select top 2 * from Student
--select top 2 * from Student order by age

--Searching:
--like command 
--by only one charcter 
--by complete string but not know one character 
--select * from student where S_Name like 'A%' --%=>like operator minimum known maximum not.
--select * from student where S_Name like 'An%'
--select * from student where S_Name like '%A'
--select * from student where S_Name like '%is'
--select * from student where S_Name like '%n%'
--select * from student where S_Name like '[a-g]%' 
--select * from student where S_Name like '%[a-g]'
--select * from student where S_Name like '[^a-g]%'  ^ => NOT
--select * from student where Email like '%@_____.com'
