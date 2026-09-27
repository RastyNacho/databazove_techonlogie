
create table customers(
    customer_id varchar(20) primary key,
    customer_name varchar(100) not null,
    segment varchar(50),
    country varchar(50),
    region varchar(50)
);

create table products(
    product_id varchar(20) primary key,
    category varchar(50) not null,
    sub_category varchar(50),
    product_name varchar(100)
);

create table orders(
    order_id varchar(20) primary key,
    customer_id VARCHAR(20) NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    order_date date,
    ship_date date,
    sales decimal(2),
    quantity int,
    discount decimal(2),
    profit decimal(2),
    foreign key (customer_id)
        references customers(customer_id),
    foreign KEY (product_id)
        references products(product_id)
);
