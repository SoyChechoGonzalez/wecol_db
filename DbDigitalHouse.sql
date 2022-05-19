DROP DATABASE IF EXISTS dbDigitalHouse;
CREATE DATABASE dbDigitalHouse;
USE dbDigitalHouse;
    
CREATE TABLE roles (
	idRole INT NOT NULL AUTO_INCREMENT,
	role VARCHAR (50) NOT null,
	PRIMARY KEY (idRole)
);
INSERT INTO roles VALUES 
    (1, 'restaurantOwner'),
    (2, 'user');

CREATE TABLE users (
	idUser INT NOT NULL AUTO_INCREMENT,
	firtName VARCHAR (50) NULL,
	lastName VARCHAR (50) NULL,
	address VARCHAR (50) NULL,
	email VARCHAR (50) NOT NULL,
	phone BIGINT NOT NULL,
	password VARCHAR (50) NOT NULL,
	country VARCHAR(50) NULL,
	avatar VARCHAR(50) NULL,
	idRole INT NOT NULL,
	PRIMARY KEY (idUser),
	FOREIGN KEY (idRole) REFERENCES dbDigitalHouse.roles(idRole)
);
INSERT INTO users (idUser,email,phone,password,country,avatar,idRole) 
VALUES 	(1, 'malejis16@hotmail.com', 3132715710 , 'malejis16', 'Colombia', 'image-1648177069320.jpg',1),
		(2, 'alejandra@hotmail.com', 3132715711 , 'alejandra', 'Ecuador','image-1648177069320.jpg',1),
		(3, 'rodrigo@hotmail.com', 3132715712 , 'rodrigo', 'Argentina', 'image-1648177069320.jpg',2),
		(4, 'leonardo@hotmail.com', 3132715715 , 'leonardo', 'Colombia', 'image-1648177069320.jpg',2),
		(5, 'cristian@hotmail.com', 3132715714 , 'cristian', 'Colombia', 'image-1648177069320.jpg',1),
        (6, 'gerado@hotmail.com', 3132715714 , 'gerardopass', 'Ecuador', 'image-1648177062548.jpg',2);

CREATE TABLE businesses (
	idBusiness INT NOT NULL AUTO_INCREMENT,
	businessName VARCHAR(50) NOT NULL,
    businessEmail1 VARCHAR(50) NOT NULL,
	businessEmail2 VARCHAR(50) NULL,
	businessPhone1 BIGINT NOT NULL,
	businessPhone2 BIGINT NULL,
	businessTime TIME NOT NULL,
	businessDescription VARCHAR(200) NOT NULL,
	businessProfile BLOB NULL,
	idUser INT NOT NULL,
	PRIMARY KEY (idBusiness),
	FOREIGN KEY (idUser) REFERENCES dbDigitalHouse.users(idUser)
);
INSERT INTO businesses (idBusiness,businessName,businessEmail1,businessPhone1,businessTime,businessDescription,idUser) 
VALUES 	(1, 'KFC','kfc@gmail.com',3132715712, '18:44:11', 'American fast food restaurant chain specializing in fried chicken.',1),
		(2, 'Dominos Pizza', 'dominospizza@gmail.com' , 3124585474, '20:25:11', 'American fast food restaurant chain specializing in fried chicken.',2),
		(3, 'Quartos Pizza', 'QuartosPi@gmail.com' , 3132715714, '20:00:11', 'Deep pan and thin crust pizzas, pasta, sandwiches and salads',5);

CREATE TABLE categories (
	idCategory INT NOT NULL AUTO_INCREMENT,
	category VARCHAR(50) NOT NULL,
	PRIMARY KEY (idCategory)
  );
INSERT INTO categories 
VALUES	(1, 'Hamburgers'),
		(2, 'Hot dogs'),
        (3, 'Pizzas'),
        (4, 'House specials'),
        (5, 'Salads'),
        (6, 'Soups'),
        (7, 'Ice creams'),
        (8, 'Coffee'),
        (9, 'Drinks');
	
CREATE TABLE products (
	idProduct INT NOT NULL AUTO_INCREMENT,
	productName VARCHAR(50) NOT NULL,
	productPrice BIGINT NOT NULL,
	productDescription VARCHAR(200) NOT NULL,
	idBusiness INT NOT NULL,
	idCategory INT NOT NULL,
	PRIMARY KEY (idProduct),
	FOREIGN KEY (idBusiness) REFERENCES dbDigitalHouse.businesses(idBusiness),
	FOREIGN KEY (idCategory) REFERENCES dbDigitalHouse.categories(idCategory)
  );
INSERT INTO products 
VALUES	(1, 'Hamburguesa Campesina', 17000 , 'Sándwich hecho a base de carne molida o de origen vegetal, aglutinada en forma de filete cocinado a la parrilla o a la plancha',1,1),
		(2, 'Hamburguesa Tradicinal', 13000 , 'Sándwich hecho a base de carne molida o de origen vegetal, aglutinada en forma de filete cocinado a la parrilla o a la plancha',2,1),
		(3, 'Pizza Hawaiana', 4500 , 'Sándwich hecho a base de carne molida o de origen vegetal, aglutinada en forma de filete cocinado a la parrilla o a la plancha',3,3),
		(4, 'Hot Dog Sencillo ', 8000 , 'Combinación de una salchicha del tipo salchicha de frankfurt ( frankfurter) o vienesa ( wiener) hervida o frita, servida en un pan con forma alargada',2,2),
		(5, 'Bull Dog', 14000 , 'combinación de una salchicha del tipo salchicha de frankfurt ( frankfurter) o vienesa ( wiener) hervida o frita, servida en un pan con forma alargada',3,2),
        (6, 'Pizza Mexicana', 4500, 'Sándwich hecho a base de carne molida o de origen vegetal, aglutinada en forma de filete cocinado a la parrilla o a la plancha',1,3),
		(7, 'Limonada Cerezada', 6000 , 'Receta fresca y frutal para hacer con ingredientes sencillos',1,7),
		(8, 'Capuchino', 8000 , 'Preparada con café expreso y leche montada con vapor para darle cremosidad.',1,8),
		(9, 'Granizado de Café', 7000 , 'Receta fresca y frutal para hacer con ingredientes sencillos',3,7),
		(10, 'Mazorcada', 17000 , 'mazorca desgranada con pollo sofrito',2,4);
        


CREATE TABLE carts (
	codeSale INT NOT NULL AUTO_INCREMENT,
	saleAmount INT NOT NULL,
	saleDate DATETIME NOT NULL,
	idUser INT NOT NULL,
	PRIMARY KEY (codeSale),
    FOREIGN KEY (idUser) REFERENCES dbDigitalHouse.users(idUser)
  );
INSERT INTO carts 
VALUES 	(1, 28000, '2022-05-19 20:30:20',3),
		(2, 17000,'2022-05-19 16:30:20',4),
		(3, 21000,'2022-05-18 11:30:20',6);
  
CREATE TABLE cartDetail (
	codeSale INT NOT NULL,
	idProduct INT NOT NULL,
	number VARCHAR(50) NOT NULL,
	PRIMARY KEY (codeSale, idProduct),
	FOREIGN KEY (codeSale) REFERENCES dbDigitalHouse.carts(codeSale),
	FOREIGN KEY (idProduct) REFERENCES dbDigitalHouse.products(idProduct)
  );
INSERT INTO cartDetail 
VALUES 	(1, 5, 2),
		(2, 1, 1),
		(3, 9, 3);
  

  

