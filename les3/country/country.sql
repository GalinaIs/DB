USE `countries_world`;

SELECT `cities`.`id`, `cities`.`title` AS `cities_title`, `countries`.`title` AS `countries_title`, `regions`.`title` AS `regions_title` FROM `cities`
LEFT JOIN (`countries`)
ON (`cities`.`country_id` = `countries`.`id`)
LEFT JOIN (`regions`)
ON (`cities`.`region_id` = `regions`.`id`);

SELECT * FROM
(SELECT `cities`.`id`, `cities`.`title` AS `cities_title`, `countries`.`title` AS `countries_title`, `regions`.`title` AS `regions_title`, `regions`.`id` AS `regions_id` FROM `cities`
LEFT JOIN (`countries`)
ON (`cities`.`country_id` = `countries`.`id`)
LEFT JOIN (`regions`)
ON (`cities`.`region_id` = `regions`.`id`)) AS `A`
WHERE `A`.`regions_id` = 1;