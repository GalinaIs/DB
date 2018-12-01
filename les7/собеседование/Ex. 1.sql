USE `social_network`;

SELECT `M`.*, `S`.`likes_mutual` FROM 
(SELECT `D`.*, `F`.`likes_is_given` FROM 
(SELECT `A`.*, `C`.`likes_is_received` FROM 
(SELECT DISTINCT `users`.`id`, `users`.`nickname` FROM `users`
INNER JOIN `likes`
ON `likes`.`id_given_like` = `users`.`id`
WHERE `likes`.`id_element` = 1) AS `A`
INNER JOIN 
(SELECT `B`.`id_given_like`, COUNT(*) AS `likes_is_received` FROM 
(SELECT * FROM `likes`
WHERE `id_element` = 1) AS `B`
GROUP BY `B`.`id_given_like`) AS `C`
ON `A`.`id` = `C`.`id_given_like`) AS `D`
INNER JOIN
(SELECT `E`.`id_user`, COUNT(*) AS `likes_is_given` FROM 
(SELECT * FROM `likes`
WHERE `id_element` = 1) AS `E`
GROUP BY `E`.`id_user`) AS `F`
ON `F`.`id_user` = `D`.`id`) AS `M`
INNER JOIN 
(SELECT `N`.`id_user`, COUNT(*) AS `likes_mutual` FROM
(SELECT `G`.* FROM
(SELECT * FROM `likes`
WHERE `id_element` = 1) AS `G`
INNER JOIN
(SELECT * FROM `likes`
WHERE `id_element` = 1) AS `J`
ON `G`.`id_user` = `J`.`id_given_like` AND `J`.`id_user` = `G`.`id_given_like`) AS `N`
GROUP BY `N`.`id_user`) AS `S`
ON `S`.`id_user` = `M`.`id`;

#СОЗДАНА ПРОЦЕДУРА social_network.info_about_users_likes_to_users
call social_network.info_about_users_likes_to_users();
