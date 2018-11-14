USE `countries_world`;

ALTER TABLE `country` RENAME `countries`;

ALTER TABLE `countries` CHANGE `country_name` `title` VARCHAR(150) NOT NULL;

CREATE INDEX `countries_index` on `countries` (`title`);


CREATE TABLE IF NOT EXISTS `regions` (
`id` INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`country_id` INT(4) NOT NULL,
`title` VARCHAR(150) NOT NULL
);

CREATE INDEX `regions_index` on `regions` (`title`);

ALTER TABLE `regions` ADD CONSTRAINT `foreign_key_country_id` FOREIGN KEY (`country_id`)
REFERENCES `countries` (`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;


ALTER TABLE `city` RENAME `cities`;

ALTER TABLE `cities` CHANGE `id_country` `country_id` INT(4) NOT NULL AFTER `id`;

ALTER TABLE `cities` ADD CONSTRAINT `cities_country_id` FOREIGN KEY (`country_id`)
REFERENCES `countries` (`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE `cities` ADD COLUMN `important` TINYINT(1) NOT NULL AFTER `country_id`;

ALTER TABLE `cities` ADD COLUMN `region_id` INT(4) NOT NULL AFTER `important`;

ALTER TABLE `cities` ADD CONSTRAINT `cities_region_id` FOREIGN KEY (`region_id`)
REFERENCES `regions` (`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE `cities` CHANGE `city_name` `title` VARCHAR(150) NOT NULL;

CREATE INDEX `cities_index` on `cities` (`title`);

ALTER TABLE `cities`
DROP COLUMN `id_district`,
DROP COLUMN `id_area`;


DROP TABLE `area`;

DROP TABLE `district`;


ALTER TABLE `cities` CONVERT TO CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `countries` CONVERT TO CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `regions` CONVERT TO CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;