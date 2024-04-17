if object_id('dbo.SKU') is null
begin
  create table dbo.SKU (
      ID int identity(1,1) primary key,
      Code as 's' + cast(id as varchar(10)) unique,
      Name varchar(255),
      MDT_ID_PrincipalCreatedBy int not null,
      MDT_DateCreate datetime not null
  )
end

if object_id('dbo.Family') is null
begin
  create table dbo.Family (
      ID int identity(1,1) primary key,
      SurName varchar(255),
      BudgetValue decimal(18, 2),
      MDT_ID_PrincipalCreatedBy int not null,
      MDT_DateCreate datetime not null
  )
end

if object_id('dbo.basket') is null
begin
  create table dbo.Basket (
    ID int identity(1,1) primary key,
    ID_SKU int,
    ID_Family int,
    Quantity int check (Quantity >= 0),
    [Value] decimal(18, 2) check ([Value] >= 0),
    PurchaseDate date default getdate(),
    DiscountValue decimal(18, 2),
    MDT_ID_PrincipalCreatedBy int not null,
    MDT_DateCreate datetime not null,
    foreign key (ID_SKU) references dbo.SKU(ID),
    foreign key (ID_Family) references dbo.Family(ID)
)
end
