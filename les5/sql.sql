USE `staff`;

EXPLAIN SELECT `departments`.`name` AS `name_depart`, `A`.`count_employees` FROM (
SELECT COUNT(*) AS `count_employees`, `employees`.`depart` FROM `employees`
GROUP BY `depart`) AS `A`
LEFT JOIN (`departments`)
ON (`A`.`depart` = `departments`.`id`);

#УДАЛЕНИЕ СОТРУДНИКА С МАКСИМАЛЬНОЙ ЗП ЧЕРЕЗ ТРАНЗАКЦИЮ
SET SQL_SAFE_UPDATES = 0;
SET AUTOCOMMIT = 0;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT @max_salary := MAX(`salary`) FROM `employees`;
DELETE FROM `employees` WHERE `id` IS NOT NULL AND `salary` = @max_salary;
COMMIT;

SET SQL_SAFE_UPDATES = 1;
SET AUTOCOMMIT = 1;

#ПРИ ПЕРВОМ ПРИМЕНЕНИИ EXPLAIN СТАЛО ПОНЯТНО, ЧТО ЗАПРОС МОЖНО ОПТИМИЗИРОВАТЬ И ОПТИМИЗИРОВАТЬ ДЛЯ ПОИСКА ЕГО МОЖНО СОЗДАНИЕМ ИНДЕКСА ПО ПОЛЮ, ПО КОТОРОМУ ОСУЩЕСТВЛЯТСЯ ПОИСК
EXPLAIN SELECT * FROM `employees` WHERE `last_name` LIKE 'Галина%';

CREATE INDEX `last_name_ind` ON `employees` (`last_name`);

EXPLAIN SELECT * FROM `employees` WHERE `last_name` LIKE 'Галина%';