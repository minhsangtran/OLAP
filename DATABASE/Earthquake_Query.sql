select * from Dim_Area


create table Dim_Time
(
earthquake_date	datetime	primary key,
earthquake_month	int,
earthquake_year	int,
earthquake_quarter	int
)


CREATE PROCEDURE createTableDim_Time
As
Begin
Declare @Smalldate datetime
Declare @MaxDate datetime    
    delete from Dim_Time
    select @Smalldate= Min(earthquake_date) from Fact
    select @MaxDate= Max(earthquake_date) from Fact
    WHILE (@SmallDate<=@MaxDate)
    BEGIN    
       INSERT INTO Dim_Time(earthquake_date,earthquake_month,earthquake_year,earthquake_quarter)
       values (@SmallDate,MONTH(@SmallDate), YEAR(@SmallDate),DATEPART(QUARTER,@SmallDate))
     set @SmallDate=@SmallDate+1    
    end    
End

exec createTableDim_Time


select * from Dim_Time