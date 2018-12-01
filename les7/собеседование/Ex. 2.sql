SELECT `F`.*, `users`.`nickname` FROM 
(SELECT DISTINCT `E`.`id_user` FROM
(SELECT `C`.*, `D`.`id_given_like` AS `id_given_like3` FROM
(SELECT `A`.`id_user`, `A`.`id_given_like` AS `id_given_like1`, `B`.`id_given_like` AS `id_given_like2` FROM
(SELECT * FROM `likes`
WHERE `id_element` = 1) AS `A`
INNER JOIN 
(SELECT * FROM `likes`
WHERE `id_element` = 1) AS `B`
ON `A`.`id_user` = `B`.`id_user`) AS `C`
INNER JOIN
(SELECT * FROM `likes`
WHERE `id_element` = 1) AS `D`
ON `C`.`id_user` = `D`.`id_user`) AS `E`
WHERE (`E`.`id_given_like1` = 1 AND `E`.`id_given_like2` = 2 AND `E`.`id_given_like3` != 4)
) AS `F`
INNER JOIN `users`
ON `users`.`id` = `F`.`id_user`;

call social_network.find_users_given_likes_users_A_B_not_given_user_C(1, 2, 4);