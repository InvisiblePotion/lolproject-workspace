CREATE SEQUENCE SEQ_Duo
START WITH 1
INCREMENT BY 1;

CREATE TABLE Duo
(
  duo_id       NUMBER(32)     DEFAULT SEQ_DUO.NEXTVAL NOT NULL,
  duo_ownerid  VARCHAR(20)    NOT NULL,
  duo_accepter VARCHAR(20)    DEFAULT 'none' NOT NULL,
  duo_content  NVARCHAR2(100) DEFAULT '' NOT NULL,
  duo_active   NUMBER(1)      DEFAULT 1 NOT NULL,
  duo_date     DATE           DEFAULT SYSDATE NOT NULL,
  CONSTRAINT PK_Duo PRIMARY KEY (duo_id)
);

CREATE TABLE UserInfo
(
  user_id      VARCHAR(20)   NOT NULL,
  user_pw      VARCHAR(20)   NOT NULL,
  user_lolname NVARCHAR2(20) NOT NULL,
  user_code    VARCHAR(8)    NOT NULL,
  CONSTRAINT PK_UserInfo PRIMARY KEY (user_id)
);

ALTER TABLE UserInfo
  ADD CONSTRAINT UQ_user_lolname UNIQUE (user_lolname);

CREATE TABLE duo_request
(
  user_id    VARCHAR(20) NOT NULL,
  request_id VARCHAR(20) NOT NULL,
  CONSTRAINT PK_duo_request PRIMARY KEY (user_id, request_id)
);

-- FK_Duo
ALTER TABLE Duo
  ADD CONSTRAINT FK_UserInfo_TO_Duo1
    FOREIGN KEY (duo_ownerid)
    REFERENCES UserInfo (user_id);

ALTER TABLE Duo
  ADD CONSTRAINT FK_UserInfo_TO_Duo2
    FOREIGN KEY (duo_accepter)
    REFERENCES UserInfo (user_id);


-- FK_duo_request
ALTER TABLE duo_request
  ADD CONSTRAINT FK_UserInfo_TO_duo_request1
    FOREIGN KEY (user_id)
    REFERENCES UserInfo (user_id);

ALTER TABLE duo_request
  ADD CONSTRAINT FK_UserInfo_TO_duo_request2
    FOREIGN KEY (request_id)
    REFERENCES UserInfo (user_id);