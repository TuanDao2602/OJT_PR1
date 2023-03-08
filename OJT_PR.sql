use grocery_ecomer;

create table catalog(
                        catalogID int auto_increment primary key,
                        catalogName nvarchar(100) not null unique ,
                        createDate date ,
                        decription nvarchar(100),
                        status bit default 1,
                        ParentID int not null
);
create table product(
                        productID int auto_increment primary key,
                        productName nvarchar(100) not null unique ,
                        CreateDate date ,
                        quantity int not null,
                        Image text not null,
                        title nvarchar(50),
                        status bit default 1,
                        catalogID int not null,
                        foreign key(catalogID) references catalog(catalogID),
                        DistCount int,
                        StartDistCount date,
                        EndDistCount date
);
alter table user modify column Email nvarchar(50) not null unique ;
create table User(
                     userID int auto_increment primary key ,
                     firstName nvarchar(50) not null ,
                     LastName nvarchar(50) not null ,
                     Country nvarchar(50) not null ,
                     Adress nvarchar(100) not null ,
                    City nvarchar(50) not null ,
                    State bit default 1,
                    PostCode int,
                    PhoneNumber nvarchar(20) not null ,
                    Email nvarchar(50)
);
CREATE  TABLE OrDers (
    OrderId int auto_increment primary key ,
    UserId int not null ,
    foreign key (UserId) references User(userID),
    Total float,
    Status int default 0
);
create table orDerDetail(
    detaiId int auto_increment primary key ,
    ProductId int not null ,
    foreign key (ProductId) references product(productID),
    OrDerId int not null ,
    foreign key (OrDerId)references OrDers(OrderId),
    price float not null ,
    CreDate date,
    Quantity int not null
);
create table Event(
    EventId int auto_increment primary key ,
    Content nvarchar(50),
    image text not null
);
create table banner(
    BannerId int auto_increment primary key ,
    image text not null ,
    content nvarchar(50),
    status bit,
    priority int

)