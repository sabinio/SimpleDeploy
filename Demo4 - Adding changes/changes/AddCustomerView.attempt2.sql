if not exists (select 1 from sys.views where name = 'CustomerOnlyName')
begin
    exec sp_executesql N'
    create view CustomerOnlyName
    as
    select CustomerId, Name
        from Customer'
end