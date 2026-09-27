
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

select o.order_id,c.customer_name, o.sales from orders o join customers c on o.customer_id = c.customer_id where o.sales>500 order by o.sales desc;
select o.order_id,c.customer_name, p.category, o.sales from orders o join customers c on o.customer_id = c.customer_id  join products p on o.product_id = p.product_id order by o.order_id desc;
select c.region, sum(o.sales) as salesSum from orders o right join customers c on o.customer_id = c.customer_id group by c.region order by c.region;
select p.product_name, sum(o.sales) from products p left join orders o on p.product_id = o.product_id group by p.product_name;
select c.customer_name, o.order_id, o.sales from orders o join customers c on c.customer_id = o.customer_id;
select c.region, sum(o.sales) as sumsale from customers c left join orders o on c.customer_id = o.customer_id group by c.region order by sumsale desc;
select c.customer_name, count(o.order_id) countorder from customers c left join orders o on c.customer_id = o.customer_id group by c.customer_id order by countorder; 
select p.category, avg(o.discount) as avgdiscoun from products p left join orders o on p.product_id = o.order_id group by p.category order by avgdiscoun;
select c.customer_name, sum(o.sales) sumsales from customers c left join orders o on c.customer_id = o.customer_id group by c.customer_id having sum(o.sales) > 2000 order by sumsales desc;