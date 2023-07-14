drop database if exists Logistica;
create database Logistica;
use Logistica;

create table userr(
	usuario varchar(50),
	clave varchar(50),
	PRIMARY KEY(usuario)
);

create table Gerente(
	id_gerente integer,
	ingresar_mercaderia varchar(50),
	ingresar_precio integer,
	modificar_precio integer,
	recibir_informe_ventas varchar(5000),
	id_mercaderia integer,
	id_empleado integer,
	PRIMARY KEY(id_gerente),
	FOREIGN KEY(id_empleado) references Empleado(id_empleado),
	FOREIGN KEY(id_mercaderia) references Mercaderia(id_mercaderia)
);

create table Empleado(
	id_empleado integer AUTO_INCREMENT,
	control_inventario varchar(5000),
	id_mercaderia varchar(50),
	id_chofer integer,
	id_pedido integer,
	PRIMARY KEY(id_empleado),
	FOREIGN KEY(id_mercaderia) references Mercaderia(id_mercaderia),
	FOREIGN KEY(id_chofer) references Chofer(id_chofer),
	FOREIGN KEY(id_pedido) references Pedido(id_pedido)
);

create table Chofer(
	id_chofer integer AUTO_INCREMENT,
	destino varchar(500),
	informe_llegada varchar(500),
	id_pedido integer,
	PRIMARY KEY(id_chofer),
	FOREIGN KEY(id_pedido) references Pedido(id_pedido)
);

create table Mercaderia(
	id_mercaderia integer AUTO_INCREMENT,
	descripcion varchar(500),
	precio integer,
	cant_mercaderia integer,
	PRIMARY KEY(id_mercaderia)
);

create table Pedido(
	id_pedido integer AUTO_INCREMENT,
	n_pedido integer,
	lista_mercaderia varchar(5000),
	fecha_emitida DATE,
	fecha_llegada DATE,
	id_chofer integer,
	id_mercaderia integer,
	PRIMARY KEY(id_pedido),
	FOREIGN KEY(id_chofer) references Chofer(id_chofer),
	FOREIGN KEY(id_mercaderia) references Mercaderia(id_mercaderia)
);

create table Ticket(
	id_ticket integer AUTO_INCREMENT,
	fecha DATE,
	precio_total integer,
	id_pedido integer,
	PRIMARY KEY(id_ticket),
	FOREIGN KEY(id_pedido) references Pedido(id_pedido)
	
);