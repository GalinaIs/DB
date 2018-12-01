DELIMITER //

CREATE PROCEDURE `delete_like`(my_user INT(4), my_elements INT(3), my_id_elements INT(3), OUT message VARCHAR(60))
READS SQL DATA
DETERMINISTIC
BEGIN
DECLARE my_id INT(10) DEFAULT 0;

SELECT `id` INTO my_id FROM `likes`
WHERE `id_user` = my_user AND `id_element` = my_elements AND `id_given_like` = my_id_elements;

IF my_id != 0 THEN
DELETE FROM `likes` WHERE `id` = my_id;
SET message = 'Отзыв лайка прошел успешно!';
ELSE
SET message = 'Нельзя отозвать лайк, который не был поставлен!';
END IF;
END//

DELIMITER ;