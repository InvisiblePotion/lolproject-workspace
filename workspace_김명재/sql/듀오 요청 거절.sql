-- deleteDuoSingleRequest(user_id, req_id)
DELETE FROM DUO_REQUEST
WHERE user_id = {user_id} AND request_id = {req_id};

-- public class Controller() {
    
--     private Dao dao = new Dao();

--     void asdf(String user_id, String req_id) {
--         dao.deleteSingleDuoRequest(user_id, req_id);
--     }

-- }