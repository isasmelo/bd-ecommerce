-- criando banco de dados ecommerce 
show databases;
create database ecommerce;
use ecommerce;
show tables;

-- criando tabela endereço
create table Address(
	IdAddress int auto_increment primary key,
    CEP char(8),
    StreetAndNumber varchar(255) not null,
    City varchar(45) not null,
    State varchar(10) not null
    );
alter table address auto_increment = 1;
desc address;

-- criando tabela cliente
create table clients(
	IdClient int auto_increment primary key,
    IdClientAddress int,
    FName varchar(20) not null,
    LName varchar(30) not null,
    CPF char(11),
    Bdate date not null,
    Contact varchar(25) not null,
    constraint unique_cpf_client unique (CPF),
    constraint fk_address_client foreign key (IdClientAddress) references address(IdAddress)
);
alter table clients auto_increment = 1;
desc clients;

-- criando tabela produto
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(255) not null,
        classification_kids bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        Pvalue float not null,
        review float default 0,
        size varchar(10)
);
alter table product auto_increment=1;

-- criando tabela pagamento
create table payment(
	IdPayment int auto_increment,
    IdPaymentClient int,
    PaymentDate datetime not null,
    PaymentStatus bool default false,
    TPaymentType enum('Dinheiro','Crédito','Débito','Pix'),
    primary key(IdPayment, IdPaymentClient),
	constraint fk_payment_client foreign key (idPaymentClient) references clients(idClient)
		on update cascade
    );
 alter table payment auto_increment = 1;


-- criando tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
	idPayment int not null, 
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    constraint fk_payment_orders foreign key (IdPayment) references payment (IdPayment),
    constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
);
alter table orders auto_increment=1;

desc orders;


-- criando tabela estoque
create table Storagee(
	idStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);
alter table Storagee auto_increment=1;


-- criando tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;


-- criando tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;

-- tabelas de relacionamento

-- criando tabela relacionamento produto-vendedor
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);


-- criando tabela relacionamento produto-pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder)

);


-- criando tabela relacionamento estoque-produto
create table productStorage(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references Storagee(idStorage)
);


-- criando tabela relacionamento produto-fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);


use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';



