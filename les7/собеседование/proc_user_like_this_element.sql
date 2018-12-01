DELIMITER //

CREATE PROCEDURE `users_likes_this_element` (my_elements INT(3), my_id_elements INT(3))
READS SQL DATA
BEGIN
SELECT `users`.* FROM
(SELECT * FROM `likes` WHERE `id_element` = my_elements AND `id_given_like` = my_id_elements) AS `A`
INNER JOIN `users`
ON `A`.`id_user` = `users`.`id`;
END//

DELIMITER ;