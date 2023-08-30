-- utilizando queries do BD ecommerce
show databases;
use ecommerce;
show tables;

-- recuperação de pedido com produto associado
select concat(c.Fname,' ',c.Lname) as complet_name, c.CPF, o.orderStatus, o.orderDescription, o.sendValue, t.Pname , t.Pvalue from clients c
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
                inner join product t on t.idproduct = p.idPOproduct
		group by idClient, idOrder, idPOproduct; 
select * from clients c;
select * from orders;
select * from productOrder;
select * from product;
    
-- Quantos pedidos por cada cliente?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient;
    
-- Recuperar clientes com mais de 1 pedido
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient
        having count(*)>1
        order by idClient; 

-- status dos pedidos dos clientes
select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
        
-- Relação de produtos fornecedores e estoques;
select f.SocialName as nome_fornecedor, p.Pname as nome_produto, e.quantity from supplier f
join productsupplier fp on f.idSupplier = fp.idPsSupplier
join product p on fp.idPsProduct = p.idproduct
join productStorage pe on p.idproduct = pe.idLproduct
join Storagee e on pe.idLstorage = e.idStorage;


-- produtos que não são para crianças
select idProduct, Pname, category, review from product
    where classification_kids=0
    order by review;