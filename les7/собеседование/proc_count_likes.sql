DELIMITER //

CREATE PROCEDURE `count_likes` (my_elements INT(3), my_id_elements INT(3), OUT count_likes INT(10))
READS SQL DATA
BEGIN
SELECT COUNT(*) INTO count_likes FROM `likes` WHERE `id_element` = my_elements AND `id_given_like` = my_id_elements;
END//

DELIMITER ;