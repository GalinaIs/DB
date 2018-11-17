USE `staff`;

ALTER TABLE `employees` ADD CONSTRAINT `foreign_dep_id` FOREIGN KEY (`depart`) 
REFERENCES `departments` (`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;

#СРЕДНЯЯ ЗП ПО ОТДЕЛАМ
SELECT `departments`.`name` AS `name_depart`, `A`.`avg_salary` FROM (SELECT AVG(`employees`.`salary`) AS `avg_salary`, `employees`.`depart` FROM `employees`
GROUP BY `depart`) AS `A`
LEFT JOIN (`departments`)
ON (`A`.`depart` = `departments`.`id`);

#СОТРУДНИК С МАХ ЗП
SELECT `id`, `first_name`, `last_name`, `salary`, `position` FROM `employees`
WHERE `salary` = (SELECT MAX(`salary`) FROM `employees`);

#УДАЛЕНИЕ СОТРУДНИКА С МАКСИМАЛЬНОЙ ЗП
DELETE `employees`.* FROM `employees`
INNER JOIN
(SELECT `employees`.`id` FROM `employees`
ORDER BY `salary` DESC LIMIT 1) AS `A`
ON `employees`.`id` = `A`.`id`;

#КОЛИЧЕСТВО СТОТРДНИКОВ В КАЖДОМ ИЗ ОТДЕЛОВ
SELECT `departments`.`name` AS `name_depart`, `A`.`count_employees` FROM (
SELECT COUNT(*) AS `count_employees`, `employees`.`depart` FROM `employees`
GROUP BY `depart`) AS `A`
LEFT JOIN (`departments`)
ON (`A`.`depart` = `departments`.`id`);

#НАЙТИ КОЛИЧЕСТВО СОТРУДНИКОВ В ОТДЕЛЕ И ПОСЧИТАТЬ СКОЛЬКО ДЕНЕГ ПОЛУЧАЕТ КАЖДЫЙ ОТДЕЛ. дЛЯ НАГЛЯДНОСТИ - ОТСОРТИРОВАЛА ПО ФОТ
SELECT `departments`.`name` AS `name_depart`, `A`.`count_employees`, `A`.`FOT_depart` FROM (
SELECT COUNT(*) AS `count_employees`, SUM(`salary`) AS `FOT_depart`, `employees`.`depart` FROM `employees`
GROUP BY `depart`)  AS `A`
LEFT JOIN (`departments`)
ON (`A`.`depart` = `departments`.`id`)
ORDER BY `A`.`FOT_depart` DESC;