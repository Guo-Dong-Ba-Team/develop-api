SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

##创建数据库guodongba
CREATE DATABASE IF NOT EXISTS guodongba DEFAULT CHARACTER SET utf8;
USE guodongba;

##商家端表格已经由django程序创建，无需再次创建,这里这是提供一个测试和创建总结
##创建表格 business_user
CREATE TABLE IF NOT	EXISTS business_user(
	user_name 	varchar(100),
	login_type 	tinyint(1),
	phone_num 	varchar(11),
	email 		varchar(254),
	password 	varchar(50),
	INDEX idx_user_name(user_name)
);

##gym_info
CREATE TABLE IF NOT	EXISTS gym_info(
	id int,
	owner varchar(100),
	name varchar(500),
	phone varchar(11),
	type int(8), ##1. 羽毛球 2.乒乓球 3. 网球 4. 健身馆 5.桌球 6.游泳馆
	address_city varchar(20),
	address_detail varchar(500),
	longitude float(20),
	latitude float(20),
	main_image varchar(500),
	open_time varchar(100),
	single_price float,
	vip_price float,
	discount float,
	hardware_info varchar(1000),
	service_info varchar(1000),
	PRIMARY KEY(id),
	CONSTRAINT FOREIGN KEY (owner) REFERENCES business_user(user_name),
	INDEX idx_id(id)
);

## gym_detail_images
CREATE TABLE IF NOT	EXISTS gym_detail_images(
	gym_id int,
	path varchar(500),

	CONSTRAINT FOREIGN KEY (gym_id) REFERENCES gym_info(id)
);


## gym_star_level
CREATE TABLE IF NOT	EXISTS gym_star_level(
	gym_id int,
	star_level ENUM('1','2','3','4','5'),

	CONSTRAINT FOREIGN KEY (gym_id) REFERENCES gym_info(id)
);

##app用户信息 customer_info
CREATE TABLE IF NOT	EXISTS customer_info(
	username varchar(100),
	phone 	varchar(11),
	password 	varchar(50),
	PRIMARY KEY(phone),
	INDEX idx_phone(phone)
);

##订单信息
CREATE TABLE IF NOT	EXISTS order_info(
	user varchar(100),
	gym_name varchar(500),
	order_time date, ##下订单的时间
	reserve_time date ## 预订的去场馆的时间
	reserve_field int ##预订是第几块场地
	status int(8),
	money float,
	##
	#CONSTRAINT FOREIGN KEY (user) REFERENCES customer_info(username),
	#CONSTRAINT FOREIGN KEY (gym_id) REFERENCES gym_info(id)
);


