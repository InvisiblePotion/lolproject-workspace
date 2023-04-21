import cx_Oracle as ora

class OracleTools:

    def __init__(self, id: str, pw: str, port: int, host: str='localhost', edition: str='xe'):
        self.db = ora.connect(id, pw, ora.makedsn(host, port, edition))

    def test(self, sql: str):

        sql = sql
        exe = self.db.cursor().execute(sql)

        result = []
        for row in exe:
            result.append(row)

        return result