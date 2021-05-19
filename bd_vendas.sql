drop database `bd_vendas`;
create schema if not exists `bd_vendas` default character set utf8;
use `bd_vendas`;


create table if not exists `bd_vendas` . `tb_clientes` (
	`id` int not null auto_increment,
    `nome` varchar(50) null,
    primary key (`id`)
) engine = InnoDB;

create table if not exists `bd_vendas` . `tb_endereco` (
	`id_endereco` int not null ,
    `id` int not null,
    `rua` varchar(50) not null,
    `cidade` varchar(50) not null,
    `cep` varchar(50) not null,
    `pais` varchar(50) not null,
    `telefone` varchar(50) not null,
    `cliente_id` int not null,
    primary key (`id_endereco`),
    index `fk_tb_endereco_tb_clientes_idx` (`cliente_id` ASC),
    constraint `fk_tb_endereco_tb_clientes`
		foreign key (`cliente_id`)
        references `bd_vendas`.`tb_clientes` (`id`)
        on delete no action
        on update no action
) engine = InnoDB;

create table if not exists `bd_vendas` . `tb_pedidos` (
	`numero_pedido` int not null ,
    `id` int not null,
    `data_pedido` date not null,
    `data_despacho` date not null,
    `cliente_id` int not null,
    primary key (`numero_pedido`),
    index `fk_tb_pedidos_tb_clientes_idx` (`cliente_id` ASC),
    constraint `fk_tb_pedidos_tb_clientes`
		foreign key (`cliente_id`)
        references `bd_vendas` . `tb_clientes` (`id`)
        on delete no action
        on update no action
) engine = InnoDB ;

create table if not exists `bd_vendas`. `tb_itens` (
	`numero_pedido` int not null,
    `numero_produto` int not null ,
    `numero_iten` int not null,
    `preco_unidade` double not null,
    `quantidade` int not null,
    `pedido_id` int not null,
    primary key (`numero_pedido`),
    index `fk_tb_itens_tb_pedidos_idx` (`pedido_id` ASC),
    constraint `fk_tb_itens_tb_pedidos`
    foreign key (`pedido_id`)
    references `bd_vendas` . `tb_pedidos` (`numero_pedido`)
    on delete no action
    on update no action
) engine = InnoDB;

create table if not exists `bd_vendas` . `tb_produto` (
	`numero_produto` int not null,
    `nome_produto` char(50) not null,
    `quantidade_unidade` int not null,
    `preco_unidade` double not null,
    `produto_id` int not null,
    primary key (`numero_produto`),
    index `fk_tb_produto_tb_itens_idx` (`produto_id` ASC),
    constraint `fk_tb_produtos_tb_itens1`
    foreign key (`nome_produto`)
    references `bd_vendas` . `tb_itens` (`numero_pedido`)
    on delete no action
    on update no action
) engine = InnoDB;