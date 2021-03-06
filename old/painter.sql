create table painter(
    book_id varchar(128) not null ,
    page_id varchar(128) not null ,    
    session_id varchar(128) not null comment 'session id for this user',
    step_id int(10) auto_increment not null,
    object_type varchar(50) not null comment 'rect/circle/fonts and so on',
    object_height float(9,9) default 0.0,
    object_width float(9,9) default 0.0,
    position_top float(9,9) default 0.0,
    position_left float(9,9) default 0.0,
    angle float(9,9) default 0.0,
    fill varchar(10),
    filpX varchar(5) default 'false',
    flipY varchar(5) default 'false',
    hasBorders varchar(5) default 'true',
    hasControls varchar(5) default 'true',
    hasRotatingPoint varchar(5) default 'false',
    opacity float(9,2) default 1.0 comment '1= visible, 0 = invisible',
    overlayFill varchar(10),
    scaleX float(9,9) default 0.0,
    scaleY float(9,9) default 0.0,
    selectable varchar(5) default 'true',
    primary key id(step_id),
    index(book_id,page_id,object_type)  
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `member` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthday_year` varchar(10) DEFAULT NULL,
  `birthday_month` varchar(10) DEFAULT NULL,
  `birthday_day` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `locality` varchar(10) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `active` varchar(10) NOT NULL DEFAULT 'N',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `user_name_password_mobile_email` (`user_name`,`password`,`mobile`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

