-- Deploy oparc:detailed_incident to pg

BEGIN;

CREATE VIEW detailed_incident AS
SELECT 
    incident.*, 
    -- pour la lisibilit√© de l'interface web, on ajoute le nom de l'attraction √† la liste des incidents
    (SELECT public_name FROM event WHERE id=incident.event_id) AS event_name
FROM incident 
WHERE close_date IS NULL 
ORDER BY open_date;

COMMIT;
