import cx_Oracle as ora

class Execute:
        
        cursor = None

        def __init__(self, cursor) -> None:
            self.cursor = cursor


class OracleTools:


    def __init__(self, id: str, pw: str, port: int, host: str='localhost', edition: str='xe'):
        self.db = ora.connect(id, pw, ora.makedsn(host, port, edition))


    def __enter__(self):
        return Execute(self.db.cursor())


    def __exit__(self, exc_type, exc_value, traceback):
        self.db.commit()
        self.db.close()