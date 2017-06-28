
Insert Into tblAppSettings(PropertyName,PropertyValue)
Values('CurrentPrizeNo',60)

GO

if object_id('tblCoupons') is not null
	drop table tblCoupons

Create table tblCoupons(
SLNO int identity(1,1) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
CouponNo nvarchar(10) unique(CouponNo),
IsSelected bit default 0,
SelectionTime datetime,
PrizeNo	int default 0
)

GO

/*

Declare @EmpTbl as table(
EmployeeID nvarchar(50),
Taken bit default 0
);

Insert Into @EmpTbl(EmployeeID)
Select EmployeeID from tblEmployeeInfo Where isActive=1 

--Select * from @EmpTbl

Declare @Count as int Set @Count=1
Declare @NCount as int Set @NCount=0

Select @Count=Count(*) from tblCoupons
Set @Count = @Count + 1
Select @NCount=Count(*) from @EmpTbl
Set @NCount = @NCount + @Count

Declare @EmployeeID as nvarchar(50) Set @EmployeeID=''
Declare @CouponNo as nvarchar(4) Set @CouponNo=''
Declare @CurrentCouponNo as nvarchar(4) Set @CurrentCouponNo=''
Declare @CouponPrefix as nvarchar(1)
set @CouponPrefix=''

While @Count < @NCount
begin

	Select top 1 @EmployeeID=EmployeeID from @EmpTbl Where Taken=0
	
	set @CurrentCouponNo= Convert(nvarchar,@Count)
	Select @CouponNo=dbo.generateID(@CouponPrefix,@CurrentCouponNo,4)

	Insert into tblCoupons(EmployeeID,CouponNo)
	Values(@EmployeeID,@CouponNo)

	Update @EmpTbl Set Taken=1 Where EmployeeID=@EmployeeID
	Set @Count = @Count + 1
	Set @EmployeeID = ''
	Set @CouponNo = ''

end

select * from tblCoupons

*/

GO

if object_id('spSelectWinner') is not null
	drop proc spSelectWinner
GO

Create proc spSelectWinner
as
begin

	DECLARE @Random as INT 
	DECLARE @Upper as INT SET @Upper = 0
	DECLARE @Lower as INT SET @Lower = 1
	
	Declare @RaffleDrawBox as table(
	SLNO int identity(1,1),
	EmployeeID nvarchar(50),
	CouponNo nvarchar(10)
	);

	Insert Into @RaffleDrawBox(EmployeeID,CouponNo)
	Select EmployeeID,CouponNo from tblCoupons Where IsSelected=0

	Select @Upper = Count(*) from @RaffleDrawBox
	

	SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

	Select RB.EmployeeID,RB.CouponNo,EI.EmployeeName,ISNULL(EI.Photos,'') as 'Photos'
	from @RaffleDrawBox RB Inner Join tblEmployeeInfo EI On RB.EmployeeID=EI.EmployeeID
	Where RB.SLNO = @Random
	
end

-- exec spSelectWinner

GO

If object_id('spUpdateSelection') is not null
	drop proc spUpdateSelection

GO

Create proc spUpdateSelection
@CouponNo nvarchar(50)
as
begin
	Declare @CurrentPrizeNo as numeric(18,0) Set @CurrentPrizeNo = 0

	select @CurrentPrizeNo = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentPrizeNo'
	
	Update tblCoupons Set IsSelected=1,SelectionTime=GETDATE(),PrizeNo=@CurrentPrizeNo Where CouponNo=@CouponNo

	Set @CurrentPrizeNo = @CurrentPrizeNo - 1
	update tblAppSettings set PropertyValue=@CurrentPrizeNo where PropertyName='CurrentPrizeNo'
end
	
GO

if object_id('spGetCurrentPrizeNo') is not null
	drop proc spGetCurrentPrizeNo

GO

Create proc spGetCurrentPrizeNo
as
begin
	Declare @CurrentPrizeNo as numeric(18,0) Set @CurrentPrizeNo = 0

	select @CurrentPrizeNo = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentPrizeNo'
	
	Select @CurrentPrizeNo as 'CurrentPrizeNo'
end

-- exec spGetCurrentPrizeNo