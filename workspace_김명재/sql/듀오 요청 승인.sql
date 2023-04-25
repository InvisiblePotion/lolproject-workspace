-- deleteDuoAllRequest(user_id)
DELETE FROM DUO_REQUEST
WHERE user_id = {user_id};

-- getDuoIdByUserid(user_id)
SELECT duo_id
FROM USER
WHERE user_id = {user_id}

-- duoAccept(user_id, req_id)
UPDATE DUO
SET
    duo_accpeter = {req_id}
    duo_active = 0
WHERE duo_id = {user_id}

-- public class Controller() {
    
--     private Dao dao = new Dao();

--     void asdf(String user_id, String req_id) {
--         dao.deleteAllDuoRequest(user_id);
--         dao.duoAccept(dao.getDuoIdByUserid(user_id), req_id);
--     }

-- }