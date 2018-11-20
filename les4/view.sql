USE `staff`;

CREATE VIEW `AVG_zp_depart` AS
SELECT `departments`.`name` AS `name_depart`, `A`.`avg_salary` FROM (SELECT AVG(`employees`.`salary`) AS `avg_salary`, `employees`.`depart` FROM `employees`
GROUP BY `depart`) AS `A`
LEFT JOIN (`departments`)
ON (`A`.`depart` = `departments`.`id`);

SELECT * FROM `AVG_zp_depart`;

CREATE VIEW `employee_with_max_salary` AS
SELECT `id`, `first_name`, `last_name`, `salary`, `position` FROM `employees`
WHERE `salary` = (SELECT MAX(`salary`) FROM `employees`);

SELECT * FROM `employee_with_max_salary`;

CREATE VIEW `count_employees_in_depart` AS
SELECT `departments`.`name` AS `name_depart`, `A`.`count_employees` FROM (
SELECT COUNT(*) AS `count_employees`, `employees`.`depart` FROM `employees`
GROUP BY `depart`) AS `A`
LEFT JOIN (`departments`)
ON (`A`.`depart` = `departments`.`id`);

SELECT * FROM `count_employees_in_depart`;

CREATE VIEW `count_employees_in_depart_with_FOT` AS
SELECT `departments`.`name` AS `name_depart`, `A`.`count_employees`, `A`.`FOT_depart` FROM (
SELECT COUNT(*) AS `count_employees`, SUM(`salary`) AS `FOT_depart`, `employees`.`depart` FROM `employees`
GROUP BY `depart`)  AS `A`
LEFT JOIN (`departments`)
ON (`A`.`depart` = `departments`.`id`)
ORDER BY `A`.`FOT_depart` DESC;

SELECT * FROM `count_employees_in_depart_with_FOT`;