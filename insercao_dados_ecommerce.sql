-- inserção de dados no bd ecommerce
show databases;
use ecommerce;
show tables;

desc address;
-- idAddress, CEP, StreetAndNuber, City, State
insert into Address (CEP, StreetAndNumber, City, State) 
	   values(69152355, 'Rua Sucupira 29, Folreste', 'Parintins', 'AM'),
		     (90880971,'Avenida Doutor Carlos Barbosa 314, Azenha', 'Porto Alegre', 'RS'),
			 (87114360,'Rua Via Láctea 78, Jardim Universal', 'Sarandi', 'PR'),
			 (68928349,'Rua Travessa Maracanã 23, Centro', 'Santana', 'AP'),
			 (69921124,'Rua Aroeira 756, Horizonte', 'Rio Branco', 'AC'),
			 (65081755,'Rua da Estrela 444, Paraiso', 'São Luís', 'MA');
select * from address;
delete from address;

desc clients;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (IdClientAddress, Fname, Lname, CPF, Bdate, contact) 
	   values(7, 'Maria','Silva', 12346789, '1965-01-09', 6337666010 ),
		     (8,'Matheus','Pimentel', 987654321,'1955-12-08', 8637555384),
			 (9,'Ricardo','Silva', 45678913,'1941-06-20', 673116-6189),
			 (10,'Julia','França', 789123456,'1974-11-01', 6633243312),
			 (11,'Roberta','Assis', 98745631,'1972-05-04', 2734273976),
			 (12,'Isabela','Cruz', 654789123,'1980-07-22', 8234806696);
select * from clients;
delete from clients;

desc product;
-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), valor, avaliação, size
insert into product (Pname, classification_kids, category, Pvalue, review, size) values
							  ('Fone de ouvido',false,'Eletrônico',159.99,4.0,null),
                              ('Barbie Elsa',true,'Brinquedos',99.00,3.0,null),
                              ('Body Carters',true,'Vestimenta',112.89,5.0,null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico',359.00,4.3,null),
                              ('Sofá retrátil',False,'Móveis',400.00, null,'3x57x80'),
                              ('Farinha de arroz',False,'Alimentos',12.59,2.9,null),
                              ('Fire Stick Amazon',False,'Eletrônico',78.99,3.1,null);
select * from product;

desc payment;
insert into payment (IdPaymentClient, PaymentDate, PaymentStatus, TpaymentType) values
	(7,'2023-07-16 14:24:52', true, 'Dinheiro'),
    (8,'2023-05-27 09:42:00', false, 'Crédito'),
    (9,'2023-03-30 15:53:00', true, 'Crédito'),
    (10,'2023-01-01 08:09:58', true, 'Débito'),
    (11,'2022-12-16 16:12:22', true, 'Pix'),
    (12,'2023-01-10 08:30:58', true, 'Crédito')
    ;
select * from payment;
insert into payment (IdPaymentClient, PaymentDate, PaymentStatus, TpaymentType) values
	(7,'2023-07-16 14:24:52', true, 'Dinheiro'),
    (8,'2023-05-27 09:42:00', true, 'Crédito');


desc orders;
insert into orders (idOrderClient, idPayment, orderStatus, orderDescription, sendValue) values 
							 (7,1, default,'compra via aplicativo',null),
                             (8,2,default,'compra via aplicativo',50),
                             (9,3,'Confirmado',null,null),
                             (10,4,default,'compra via web site',150),
                             (11,5,'Confirmado','compra via web site',25),
                             (12,6,'Confirmado',null,null);
select * from orders;
insert into orders (idOrderClient, idPayment, orderStatus, orderDescription, sendValue) values 
							 (7,7, default,'compra via aplicativo',10),
                             (8,8,default,'compra via aplicativo',10);




desc storagee;
-- storageLocation,quantity
insert into Storagee (storageLocation,quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);


desc supplier;
insert into supplier (SocialName, CNPJ, contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');

desc seller;
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);
                        
desc productSeller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values 
						 (1,1,80),
                         (2,5,10);

select * from productSeller;

desc productOrder;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (8,5,2,null),
                         (9,4,1,null),
                         (11,6,1,null);


desc productStorage;
insert into productStorage (idLproduct, idLstorage, location) values
						 (8,2,'RJ'),
                         (9,6,'GO');

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						 (1,8,500),
                         (1,9,400),
                         (2,10,633),
                         (3,11,5),
                         (2,12,10);
