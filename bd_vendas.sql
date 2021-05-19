drop database `bd_vendas`;
create schema if not exists `bd_vendas` default character set utf8;
use `bd_vendas`;


create table if not exists `bd_vendas` . `tb_cliente` (
	`id_cliente` int not null auto_increment,
    `nome` varchar(50),
    primary key (`id_cliente`)
) engine = InnoDB;

create table if not exists `bd_vendas` . `tb_pedido` (
	`numero_pedido` int not null auto_increment,
    `data_pedido` date,
    `data_despacho` date,
    `id_cliente` int,
    primary key (`numero_pedido`),
    index fk_pedido_cliente1_idx (`id_cliente` ASC),
    constraint `fk_pedido_cliente1`
		foreign key(`id_cliente`)
        references `bd_vendas`.`tb_cliente` (`id_cliente`)
        on delete no action
        on update no action
) engine = InnoDB ;

create table if not exists `bd_vendas` . `tb_endereco` (
	`id_endereco` int not null auto_increment,
    `rua` varchar(30),
    `cidade` varchar(50),
    `cep` varchar(10),
    `pais` varchar(50),
    `telefone` varchar(14),
    `id_cliente` int,
    primary key (`id_endereco`),
    index fk_endereco_cliente1_idx (`id_cliente` ASC),
    constraint `fk_endereco_cliente`
		foreign key (`id_cliente`)
        references `bd_vendas`.`tb_cliente` (`id_cliente`)
        on delete no action
        on update no action
) engine = InnoDB;

create table if not exists `bd_vendas` . `tb_produto` (
	`numero_produto` int not null auto_increment,
    `nome_produto` char(100),
    `quantidade_unidade` int,
    `preco_unidade` decimal(15,2),
    primary key (`numero_produto`)
) engine = InnoDB;

create table if not exists `bd_vendas`. `tb_itens` (
    `numero_item` int not null,
    `preco_unidade` decimal(15,2) not null,
    `quantidade` int not null,
    `numero_pedido` int not null,
    `numero_produto` int not null ,
    primary key (`numero_item`),
    index fk_itens_pedido1_idx (`numero_pedido` ASC),
    index fk_itens_produto1_idx (`numero_produto` ASC),
    constraint `fk_itens_pedido1`
		foreign key (`numero_pedido`)
		references `bd_vendas`.`tb_pedido` (`numero_pedido`)
		on delete no action
		on update no action,
    constraint `fk_itens_produto1`
		foreign key (`numero_produto`)
		references `bd_vendas`.`tb_produto` (`numero_produto`)
		on delete no action
		on update no action
) engine = InnoDB;

