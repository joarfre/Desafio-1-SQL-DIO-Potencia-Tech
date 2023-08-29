-- inserção de dados e queries

use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)
	values('Maria', 'M', 'Silva', 123456789, 'rua silva da prata 29, Carangola - Cidade das flores'),
		  ('Matheus', 'O', 'Pimentel', 987654321, 'rua alemeda 289, Centro - Cidade das flores'),
          ('Ricardo', 'F', 'Silva', 456789123, 'avenida alemeda vinha 1009, Centro - Cidade das flores'),
          ('Julia', 'S', 'França', 789123456, 'rua laranjeiras 861, Centro - Cidade das flores');
          
-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis','Livros'), avaliação, size, price
insert into product (Pname, classification_kids, category, avaliação, size, price) values
								('Fone de ouvido',false,'Eletônico','4',null,'R$60,00'),
                                ('Barbie Elsa',true,'Brinquedos','3',null,'R$79,99'),
                                ('Body Carters',true,'Vestimenta','5',null,'R$55,30'),
                                ('Sofá retrátil',false,'Móveis','3', '3x57x80', 'R$649,99'),
                                ('Farinha de arroz',false,'Alimentos','2',null,'R$5,65');
                                
select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
							(1, default, 'compra via aplicativo', null,1),
                            (2,default,'compra via aplicativo',50,0),
                            (3,'Confirmado',null,null,1),
                            (4,default,'compra via web site',150,0);
                            
                            
-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,1,2,null),
                         (2,1,1,null),
                         (3,2,1,null);
                         
                         
-- storageLocation, quantify
insert into productStorage (storageLocation, quantify) values
						   ('Rio de Janeiro',1000),
                           ('Rio de Janeiro',500),
                           ('São Paulo',10),
                           ('Brasília',60);
                           
                           
-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,4,'GO');
                            
                            
-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
						('Almeida e filhos', 123456789123456, '21985474'),
                        ('Eletrônicos Silva', 854519649143457, '21985484'),
                        ('Eletrônico Valma', 934567893934695, '21975474');
                        
                        
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						(1,1,500),
                        (1,2,400),
                        (2,4,633),
                        (3,3,5),
                        (2,5,10);
                        
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (socialName, AbstName, CNPJ, CPF, location, contact) values
						('Tech eletronicx', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
                        ('Botique Durgas', null,null,123456783, 'Rio de Janeiro', 219567895),
                        ('Kids World', null, 456789123654485,null, 'São Paulo', 1198657484);
                        
select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
							(1,2,80),
                            (2,5,10);
                            
select * from clients c, orders o where c.idClient = idOrderClient;

select count(*) from clients;

select * from productSeller;

select Fname,Lname,idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client ,idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

-- recuperação de pedido com produto associado
select * from clients c inner join orders o ON c.idClient = o.idOrderClient
					inner join productOrder p on p.idPOorder = o.idOrder;
		-- group by idClient;

-- Recuperar quantos pedidos foram realizados pelos clientes           
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o on c.idClient = o.idOrderClient
			group by idClient;