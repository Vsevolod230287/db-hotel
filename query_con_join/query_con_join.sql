-- 1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?

SELECT `ospiti`.`name`, `ospiti`.`lastname`, COUNT(`prenotazioni_has_ospiti`.`prenotazione_id`) AS `num_prenotazioni`
FROM `ospiti` INNER JOIN `prenotazioni_has_ospiti` ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`
GROUP BY `ospiti`.`id` HAVING `num_prenotazioni` > '2'

-- 2. Stampare tutti gli ospiti per ogni prenotazione:

SELECT `ospiti`.`name`, `ospiti`.`lastname`, `prenotazioni_has_ospiti`.`prenotazione_id` FROM `ospiti`
INNER JOIN `prenotazioni_has_ospiti` ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`



-- 3. Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018:

SELECT `paganti`.`name`,`paganti`.`lastname`, `pagamenti`.`price`, `paganti`.`created_at`
FROM `pagamenti` INNER JOIN `paganti` ON `pagamenti`.`pagante_id` = `paganti`.`id`
WHERE YEAR(`paganti`.`created_at`) = 2018 AND MONTH(`paganti`.`created_at`) = 5


-- 4. Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano

SELECT SUM(`pagamenti`.`price`) AS Somma_prezzi_piano_1 FROM `prenotazioni` INNER JOIN `stanze`
ON `prenotazioni`.`stanza_id` = `stanze`.`id` INNER JOIN `pagamenti` ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
WHERE `stanze`.`floor` = 1



-- 5. Prendi i dati di fatturazione per la prenotazione con id=7:

SELECT `pagamenti`.`prenotazione_id`,`pagamenti`.`price`, `paganti`.`ospite_id`, `paganti`.`name`, `paganti`.`lastname`,
`paganti`.`address` FROM `prenotazioni` INNER JOIN `pagamenti` ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
INNER JOIN `paganti` ON `pagamenti`.`pagante_id` = `paganti`.`id` WHERE `prenotazioni`.`id` = 7



-- 6. Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate):

SELECT `stanze`.`room_number`, (`prenotazioni`.`id`) AS Prenotata FROM `stanze`
LEFT JOIN `prenotazioni` ON `stanze`.`id` = `prenotazioni`.`stanza_id` WHERE `prenotazioni`.`id` IS NULL
