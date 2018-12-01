DELIMITER //

CREATE PROCEDURE `add_like`(my_user INT(4), my_elements INT(3), my_id_elements INT(3), OUT message VARCHAR(45))
READS SQL DATA
DETERMINISTIC
BEGIN
DECLARE my_id INT(10) DEFAULT 0;

SELECT `id` INTO my_id FROM `likes`
WHERE `id_user` = my_user AND `id_element` = my_elements AND `id_given_like` = my_id_elements;

IF my_id = 0 THEN
INSERT INTO `likes` (`id_user`, `id_element`, `id_given_like`) VALUES (my_user, my_elements, my_id_elements);
SET message = 'Добавление лайка прошло успешно!';
ELSE
SET message = 'Нельзя дважды поставить лайк!';
END IF;
END//

DELIMITER ;