CREATE DATABASE db_pet_adoption 

USE db_pet_adoption

CREATE TABLE `user`(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	email TEXT NOT NULL,
	password_hash VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	phone VARCHAR(10) NOT NULL
)

CREATE TABLE `role`(
	role_id INT PRIMARY KEY AUTO_INCREMENT,
	role_name VARCHAR(25) NOT NULL
)

CREATE TABLE user_role(
	user_id INT, 
	role_id INT,
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (role_id) REFERENCES `role`(role_id)
)


CREATE TABLE category(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
	category_name VARCHAR(255) NOT NULL
)

CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
	price FLOAT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category(category_id)
)

CREATE TABLE product_image(
	id INT PRIMARY KEY AUTO_INCREMENT,
	url TEXT NOT NULL,
	product_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES product(product_id)
)


CREATE TABLE animal(	
	animal_id INT PRIMARY KEY AUTO_INCREMENT,
	animal_name VARCHAR(250) NOT NULL
)

CREATE TABLE pet(
	pet_id INT PRIMARY KEY AUTO_INCREMENT,
	pet_name VARCHAR(255) NOT NULL,
	age INT NOT NULL,
	color VARCHAR(50) NOT NULL,
	weight FLOAT NOT NULL,
	gender INT NOT NULL,
	`status` INT NOT NULL,
	adoption INT NOT NULL,
	about TEXT NOT NULL,
	animal_id INT NOT NULL,
	FOREIGN KEY (animal_id) REFERENCES animal(animal_id) 
)

CREATE TABLE information(
	inf_id INT PRIMARY KEY AUTO_INCREMENT,
	inf_name VARCHAR(250)
)


CREATE TABLE pet_information(
 	pet_id INT NOT NULL,
 	inf_id INT NOT NULL,
 	FOREIGN KEY (pet_id) REFERENCES pet(pet_id),
 	FOREIGN KEY (inf_id) REFERENCES information(inf_id)
)

CREATE TABLE pet_image(
	id INT PRIMARY KEY AUTO_INCREMENT,
	url TEXT NOT NULL,
	pet_id INT NOT NULL,
	FOREIGN KEY (pet_id) REFERENCES pet(pet_id)
)

CREATE TABLE cart(
	cart_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES `user`(user_id)
)

CREATE TABLE item_cart(
	cart_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
	FOREIGN KEY (product_id) REFERENCES product(product_id)
)

CREATE TABLE `status` (
	status_id INT PRIMARY KEY AUTO_INCREMENT,
	status_name VARCHAR(255) NOT NULL
)

CREATE TABLE `order`(
	CODE INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	status_id INT NOT NULL,
	quantity INT NOT NULL,
	create_at DATETIME NOT NULL,
	update_at DATETIME NOT NULL,
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (product_id) REFERENCES `product`(product_id),
	FOREIGN KEY (status_id) REFERENCES `status`(status_id)
	
)












