-- QUERY BONUS WITH GROUP BY

-- 1. Conta gli ospiti raggruppandoli per anno di nascita:
SELECT (YEAR(`date_of_birth`)) AS Natti_nell_anno, COUNT(`id`) FROM `ospiti` GROUP BY YEAR(`date_of_birth`)

-- 2. Somma i prezzi dei pagamenti raggruppandoli per status:
SELECT `status`, SUM(`price`) FROM `pagamenti` GROUP BY `status`

-- 3. Conta quante volte è stata prenotata ogni stanza:
SELECT `stanza_id`, (COUNT(`stanza_id`)) AS QUANTE_VOLTE_PRENOTATA FROM `prenotazioni`GROUP BY `stanza_id`

-- 4. Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti:
SELECT (COUNT(`id`)) AS Prenotazioni, (HOUR(`created_at`)) as ORA FROM `prenotazioni`
GROUP BY HOUR(`created_at`) ORDER BY (COUNT(`id`)) DESC


-- 5. Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!):
SELECT COUNT(`prenotazione_id`), `ospite_id` FROM `prenotazioni_has_ospiti`
 GROUP BY `ospite_id` ORDER BY COUNT(`prenotazione_id`) DESC LIMIT 1
