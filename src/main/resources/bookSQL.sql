use book;

DROP DATABASE book;

CREATE DATABASE book;

use book;

CREATE TABLE `member` (
	`userId`	varchar(255)	NOT NULL,
	`userName`	varchar(20)	NULL,
	`userPw`	varchar(255)	NULL,
	`phone1`	varchar(3)	NULL,
	`phone2`	varchar(4)	NULL,
	`phone3`	varchar(4)	NULL,
	`email1`	varchar(255)	NULL,
	`email2`	varchar(255)	NULL,
	`post`	varchar(6)	NULL,
	`add`	varchar(255)	NULL
);

CREATE TABLE `cart` (
	`cartId`	int	NOT NULL	auto_increment,
	`bookId`	varchar(200)	NULL,
	`cCount`	int	NULL,
	`userId`	varchar(255)	NOT NULL
);

CREATE TABLE `inventory` (
	`bookId`	varchar(200)	NOT NULL,
	`iCount`	int	NULL
);

CREATE TABLE `orderInfo` (
	`orderId`	int	NOT NULL	auto_increment,
	`orderDate`	date	NULL,
	`userId`	varchar(255)	NOT NULL
);

CREATE TABLE `orderDetail` (
	`orderDetailId`	int	NOT NULL	auto_increment,
	`bookId`	varchar(255)	NULL,
	`orderCount`	int	NULL,
	`orderPrice`	BIGINT	NULL,
	`orderId`	varchar(255)	NOT NULL
);

CREATE TABLE `goods` (
	`bookId`	varchar(200)	NOT NULL,
	`title`	varchar(200)	NULL,
	`author`	varchar(200)	NULL,
	`price`	BIGINT	NULL,
	`category`	varchar(200)	NULL,
	`publisher`	varchar(200)	NULL,
	`imageCode`	varchar(200)	NULL,
	`publishDate`	date	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`userId`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cartId`
);

ALTER TABLE `inventory` ADD CONSTRAINT `PK_INVENTORY` PRIMARY KEY (
	`bookId`
);

ALTER TABLE `orderInfo` ADD CONSTRAINT `PK_ORDERINFO` PRIMARY KEY (
	`orderId`
);

ALTER TABLE `orderDetail` ADD CONSTRAINT `PK_ORDERDETAIL` PRIMARY KEY (
	`orderDetailId`
);

ALTER TABLE `goods` ADD CONSTRAINT `PK_GOODS` PRIMARY KEY (
	`bookId`
);

ALTER TABLE `inventory` ADD CONSTRAINT `FK_goods_TO_inventory_1` FOREIGN KEY (
	`bookId`
)
REFERENCES `goods` (
	`bookId`
);
