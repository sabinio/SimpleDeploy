if not exists (select 1 from sys.tables where name = 'Customer')
begin
create table Customer
   (
       CustomerId int not null constraint PK_Customer Primary Key
    , Name varchar(100)
    , PhoneNumber varchar(100) 
   )
end