-- 1. Seleziona tutti gli ospiti che sono stati identificati con la carta di
identità:
SELECT `name`,`lastname`,`document_type` FROM `ospiti` WHERE `document_type` = 'CI'

-- 2. Seleziona tutti gli ospiti che sono nati dopo il 1988:
SELECT `name`, `lastname`, `date_of_birth` FROM `ospiti` WHERE YEAR(`date_of_birth`) > 1988;

-- 3. Seleziona tutti gli ospiti che hanno più di 20 anni (al momento
dell’esecuzione della query):
 SELECT `name`, `lastname`, `date_of_birth` FROM `ospiti` WHERE `date_of_birth` < NOW() - INTERVAL 20 YEAR



-- 4. Seleziona tutti gli ospiti il cui nome inizia con la D:
SELECT `name`,`lastname` FROM `ospiti` WHERE `name` LIKE 'D%';



-- 5. Calcola il totale incassato degli ordini accepted:
SELECT (SUM(price)) AS Totale_ordini_accepted FROM `pagamenti` WHERE `status` = 'accepted';


-- 6. Qual è il prezzo massimo pagato?
SELECT MAX(price) FROM `pagamenti` WHERE `status` = 'accepted'

-- 7. Seleziona gli ospiti riconosciuti con patente e nati nel 1975:
SELECT `name`,`lastname`,`date_of_birth`,`document_type` FROM `ospiti` WHERE YEAR(`date_of_birth`) = 1975 AND `document_type` = 'Driver License'


-- 8. Quanti paganti sono anche ospiti?
SELECT (COUNT(`ospite_id`)) AS OSPITI_PAGANTI FROM `paganti` WHERE `ospite_id` IS NOT NULL

-- 9. Quanti posti letto ha l’hotel in totale
SELECT SUM(`beds`) FROM `stanze`
