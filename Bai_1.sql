# create database bai_1;
use bai_1;
create table Customer(
    customerId int primary key auto_increment unique not null,
    customerName varchar(25) not null ,
    customerAge int not null check ( customerAge>=18 )
);
create table `Order_bai1`(
    orderId int primary key auto_increment unique not null ,
    cId int ,
     foreign key (cId) references Customer(customerId),
    orderDate date not null,
    orderTotalPrice decimal (10,2)
);
create table Product(
    productId int primary key auto_increment not null unique ,
    productName varchar(100) not null unique ,
    productPrice decimal(10,2)
);
create table OrderDetail(
    oId int,
    pId int,
    foreign key (oId) references `Order_bai1`(orderId),
    foreign key (pId) references Product(productId),
    orderQuantity int not null check ( orderQuantity>0 )
);
insert into Customer(customerName, customerAge) values('Người 1', 18),
                    ('Người 2', 19),
                    ('Người 3', 20),
                    ('Người 4', 21),
                    ('Người 5',22);
select * from Customer;
insert into Order_bai1 values(1,1, '2022-12-29 10:10:10', 10.56);
insert into Order_bai1 (cid, orderdate, ordertotalprice) values (1, '2021-1-30 12:12:12', 10.11);
insert into Order_bai1(cid, orderdate, ordertotalprice) values (2, '2022-11-24 10:1:1', 5.2);
insert into Order_bai1(cid, orderdate, ordertotalprice) values (3, '2021-12-12 0:0', 1);
insert into Order_bai1(cid, orderdate, ordertotalprice) values (3, '2021-12-12 10', 3.1);
insert into Order_bai1 (cId, orderDate, orderTotalPrice) values (2, '2022-1-1',1.2525);
select * from Order_bai1;

insert into OrderDetail(oid, pid, orderQuantity) values(1,1, 5),
                                                       (1,2,3),
                                                       (2,1,4);
select * from OrderDetail;