DROP DATABASE `wecol_db`;

DROP DATABASE IF EXISTS `wecol_db`;
CREATE DATABASE `wecol_db`;

USE `wecol_db`;

CREATE TABLE `countries` (
    `id` INT(3) NOT NULL,
    `name` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `username` VARCHAR(45) NOT NULL UNIQUE,
   `firstname` VARCHAR(45) NOT NULL,
   `lastname` VARCHAR(45) NOT NULL,
   `address` VARCHAR(80) NOT NULL,
   `email` VARCHAR(80) NOT NULL UNIQUE,
   `phone` BIGINT(15) UNSIGNED NOT NULL UNIQUE,
   `avatar` TEXT(200) NOT NULL,
   `password` VARCHAR(45) NOT NULL,
   PRIMARY KEY (`id`)
);

ALTER TABLE `users`
    ADD COLUMN `countries_id` INT(3) NOT NULL,
    ADD CONSTRAINT `FK_countries_id` FOREIGN KEY (`countries_id`) REFERENCES countries(`id`);

CREATE TABLE `roles` (
    `id` INT(1) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);
CREATE TABLE `users_roles` (
    `users_id` INT NOT NULL,
    `roles_id` INT(1) NOT NULL
);
ALTER TABLE `users_roles`
    ADD CONSTRAINT `FK_users_id` FOREIGN KEY (`users_id`) REFERENCES users(`id`),
    ADD CONSTRAINT `FK_roles_id` FOREIGN KEY (`roles_id`) REFERENCES roles(`id`);

CREATE TABLE `shoppingcart` (
    `id` INT NOT NULL,
    `saleamount` INT UNSIGNED NOT NULL,
    `saledate` DATE NOT NULL,
    PRIMARY KEY (`id`)
);
ALTER TABLE `shoppingcart`
    ADD COLUMN `users_id2` INT NOT NULL,
    ADD CONSTRAINT `FK_users_id2` FOREIGN KEY (`users_id2`) REFERENCES users(`id`);

CREATE TABLE `products` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `price` INT UNSIGNED NOT NULL,
    `description` TEXT(300) NOT NULL,
    `image` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`id`)
);
CREATE TABLE `products_shoppingcart` (
    `products_id` INT NOT NULL,
    `shoppingcart_id` INT NOT NULL
);

ALTER TABLE `products_shoppingcart`
    ADD CONSTRAINT `FK_products_id` FOREIGN KEY (`products_id`) REFERENCES products(`id`),
    ADD CONSTRAINT `FK_shoppingcart_id` FOREIGN KEY (`shoppingcart_id`) REFERENCES shoppingcart(`id`);

CREATE TABLE `categories` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);
CREATE TABLE `brands` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);
ALTER TABLE `products`
    ADD COLUMN `categories_id` INT NOT NULL,
    ADD COLUMN `brands_id` INT NOT NULL,
    ADD CONSTRAINT `FK_categories_id` FOREIGN KEY (`categories_id`) REFERENCES categories(`id`),
    ADD CONSTRAINT `FK_brands_id` FOREIGN KEY (`brands_id`) REFERENCES brands(`id`);

CREATE TABLE `opinions` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `description` VARCHAR(280) NOT NULL,
    `response` VARCHAR(280) NOT NULL,
    PRIMARY KEY (`id`)
);
ALTER TABLE `opinions`
    ADD COLUMN `products_id2` INT NOT NULL,
    ADD COLUMN `users_id3` INT NOT NULL,
    ADD CONSTRAINT `FK_products_id2` FOREIGN KEY (`products_id2`) REFERENCES products(`id`),
    ADD CONSTRAINT `FK_users_id3` FOREIGN KEY (`users_id3`) REFERENCES users(`id`);

INSERT INTO `categories` VALUES
                             (1, 'Mouse'),
                             (2, 'Teclado'),
                             (3, 'Audífonos'),
                             (4, 'Relojes'),
                             (5, 'Accesorios'),
                             (6, 'Portátiles'),
                             (7, 'Celulares');

INSERT INTO `categories`(`name`)
    VALUES ('Tablet');

INSERT INTO `categories`(`name`)
VALUES ('Cargador');
