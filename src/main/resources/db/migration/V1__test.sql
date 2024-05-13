CREATE TABLE `user`
(
    `user_id`    bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ユーザーID',
    `name`       varchar(32)  NOT NULL COMMENT 'ユーザー名',
    `email`      varchar(32)  NOT NULL COMMENT 'メールアドレス',
    `password`   varchar(128) NOT NULL COMMENT 'パスワード',
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日',
    `updated_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY (`user_id`),
    UNIQUE (`email`)
) ENGINE=InnoDB COMMENT='ユーザー';

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `created_at`, `updated_at`)
VALUES (1, 'labol', 'labol@example.com', '{bcrypt}$2a$10$qsp2hyF8ed/12BSTWoKzkOmW/ibvjaqGPjCQ10Vllx3JdsWKyKUmu',
        '2023-08-17 07:04:10', '2023-08-17 07:04:10');

CREATE TABLE `product`
(
    `product_id`    bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    `name`       varchar(32)  NOT NULL COMMENT '商品名',
    `price`      INTEGER  NOT NULL COMMENT '金額',
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日',
    `updated_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    PRIMARY KEY (`product_id`),
    UNIQUE (`name`)
) ENGINE=InnoDB COMMENT='商品';

INSERT INTO `product` (`name`, `price`)
VALUES ('リンゴ',300),
('イチゴ', 500)
;

CREATE TABLE `purchase_log`
(
    `user_id`    bigint unsigned NOT NULL  COMMENT 'ユーザーID',
    `product_id`    bigint unsigned NOT NULL  COMMENT '商品ID',
    `number`      INTEGER  NOT NULL COMMENT '購入数',
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日',
    `updated_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
    INDEX (`user_id`)
) ENGINE=InnoDB COMMENT='購入履歴';

INSERT INTO `purchase_log` (`user_id`, `product_id`, `number`)
VALUES (1, 1, 5),
(1, 2, 5)
;