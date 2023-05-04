CREATE TABLE ChampData
(
  champ_id    NUMBER(3)     NOT NULL,
  champ_key   VARCHAR(12)   NOT NULL,
  champ_name  NVARCHAR2(9)  NOT NULL,
  champ_title NVARCHAR2(12) NOT NULL,
  champ_icon  VARCHAR(100)  NOT NULL,
  champ_full  VARCHAR(100)  NOT NULL,
  CONSTRAINT PK_ChampData PRIMARY KEY (champ_id)
);

ALTER TABLE ChampData
  ADD CONSTRAINT UQ_champ_key UNIQUE (champ_key);

ALTER TABLE ChampData
  ADD CONSTRAINT UQ_champ_name UNIQUE (champ_name);

ALTER TABLE ChampData
  ADD CONSTRAINT UQ_champ_title UNIQUE (champ_title);

ALTER TABLE ChampData
  ADD CONSTRAINT UQ_champ_icon UNIQUE (champ_icon);

ALTER TABLE ChampData
  ADD CONSTRAINT UQ_champ_full UNIQUE (champ_full);




CREATE TABLE ChampSkill
(
  champ_id       NUMBER(3)       NOT NULL,
  skill_id       VARCHAR(30)     NOT NULL,
  skill_name     NVARCHAR2(20)   NOT NULL,
  skill_icon     VARCHAR(100)    NOT NULL,
  skill_desc     NVARCHAR2(1000) NOT NULL,
  skill_tooltip  NVARCHAR2(1000),
  skill_cooldown VARCHAR(30)    ,
  skill_cost     VARCHAR(30)    ,
  skill_range    VARCHAR(30)    ,
  CONSTRAINT PK_ChampSkill PRIMARY KEY (skill_id)
);

ALTER TABLE ChampSkill
  ADD CONSTRAINT UQ_skill_name UNIQUE (skill_name);

ALTER TABLE ChampSkill
  ADD CONSTRAINT UQ_skill_icon UNIQUE (skill_icon);



CREATE TABLE ChampSkin
(
  champ_id     NUMBER(3)     NOT NULL,
  skin_id      NUMBER(6)     NOT NULL,
  skin_num     NUMBER(3)     NOT NULL,
  skin_name    NVARCHAR2(30) NOT NULL,
  skin_icon    VARCHAR(100)  NOT NULL,
  skin_full    VARCHAR(100)  NOT NULL,
  skin_chromas NUMBER(1)     DEFAULT 0 NOT NULL,
  CONSTRAINT PK_ChampSkin PRIMARY KEY (champ_id, skin_id)
);

ALTER TABLE ChampSkin
  ADD CONSTRAINT UQ_skin_name UNIQUE (skin_name);

ALTER TABLE ChampSkin
  ADD CONSTRAINT UQ_skin_icon UNIQUE (skin_icon);

ALTER TABLE ChampSkin
  ADD CONSTRAINT UQ_skin_full UNIQUE (skin_full);


CREATE TABLE Item
(
  item_id        NUMBER(4)   NOT NULL,
  item_name      VARCHAR(20) NOT NULL,
  item_icon      VARCHAR(100),
  item_desc      NVARCHAR2(800),
  item_plaintext NVARCHAR2(200),
  item_totalgold NUMBER(4),
  item_basegold  NUMBER(4),
  CONSTRAINT PK_Item PRIMARY KEY (item_id)
);

ALTER TABLE Item
  ADD CONSTRAINT UQ_item_name UNIQUE (item_name);



CREATE TABLE ItemUpgrade
(
  base_item NUMBER(4) NOT NULL,
  next_item NUMBER(4) NOT NULL,
  CONSTRAINT PK_ItemUpgrade PRIMARY KEY (base_item, next_item)
);



CREATE TABLE Rune
(
  rune_id        NUMBER(4)       NOT NULL,
  runetype_id    NUMBER(4)       NOT NULL,
  rune_name      NVARCHAR2(20)   NOT NULL,
  rune_key       VARCHAR(30)     NOT NULL,
  rune_icon      VARCHAR(100)    NOT NULL,
  rune_shortdesc NVARCHAR2(300)  NOT NULL,
  rune_longdesc  NVARCHAR2(1000) NOT NULL,
  CONSTRAINT PK_Rune PRIMARY KEY (rune_id)
);

ALTER TABLE Rune
  ADD CONSTRAINT UQ_rune_name UNIQUE (rune_name);

ALTER TABLE Rune
  ADD CONSTRAINT UQ_rune_key UNIQUE (rune_key);



CREATE TABLE RuneShard
(
  runeshard_id   NUMBER(4)     NOT NULL,
  runeshard_type VARCHAR(7)    NOT NULL,
  runeshard_stat NVARCHAR2(2)  NOT NULL,
  runeshard_icon VARCHAR(100)  NOT NULL,
  runeshard_desc NVARCHAR2(30) NOT NULL,
  CONSTRAINT PK_RuneShard PRIMARY KEY (runeshard_id)
);

ALTER TABLE RuneShard
  ADD CONSTRAINT UQ_runeshard_stat UNIQUE (runeshard_stat);



CREATE TABLE RuneType
(
  runetype_id   NUMBER(4)    NOT NULL,
  runetype_name NVARCHAR2(2) NOT NULL,
  runetype_key  VARCHAR(16)  NOT NULL,
  runetype_icon VARCHAR(100) NOT NULL,
  CONSTRAINT PK_RuneType PRIMARY KEY (runetype_id)
);

ALTER TABLE RuneType
  ADD CONSTRAINT UQ_runetype_name UNIQUE (runetype_name);

ALTER TABLE RuneType
  ADD CONSTRAINT UQ_runetype_key UNIQUE (runetype_key);

ALTER TABLE RuneType
  ADD CONSTRAINT UQ_runetype_icon UNIQUE (runetype_icon);



CREATE TABLE Spell
(
  spell_id   NUMBER(2)      NOT NULL,
  spell_key  VARCHAR(32)    NOT NULL,
  spell_name NVARCHAR2(12)  NOT NULL,
  spell_desc NVARCHAR2(200) NOT NULL,
  spell_icon VARCHAR(100)   NOT NULL,
  CONSTRAINT PK_Spell PRIMARY KEY (spell_id)
);

ALTER TABLE Spell
  ADD CONSTRAINT UQ_spell_key UNIQUE (spell_key);

ALTER TABLE Spell
  ADD CONSTRAINT UQ_spell_name UNIQUE (spell_name);

ALTER TABLE Spell
  ADD CONSTRAINT UQ_spell_icon UNIQUE (spell_icon);



CREATE TABLE Summoner
(
  summoner_id         VARCHAR(70)   NOT NULL,
  summoner_puuid      VARCHAR(100)  NOT NULL,
  summoner_name       NVARCHAR2(20) NOT NULL,
  summoner_level      NUMBER(4)     NOT NULL,
  summoner_profile    NUMBER(4)     NOT NULL,
  summoner_tier       VARCHAR(20)   DEFAULT 'Unranked' NOT NULL,
  summoner_rank       NUMBER(1)     DEFAULT 0 NOT NULL,
  summoner_wins       NUMBER(4)     DEFAULT 0 NOT NULL,
  summoner_losses     NUMBER(4)     DEFAULT 0 NOT NULL,
  summoner_veteran    NUMBER(1)     DEFAULT 0 NOT NULL,
  summoner_inactive   NUMBER(1)     DEFAULT 0 NOT NULL,
  summoner_freshblood NUMBER(1)     DEFAULT 0 NOT NULL,
  summoner_hotstreak  NUMBER(1)     DEFAULT 0 NOT NULL,
  CONSTRAINT PK_Summoner PRIMARY KEY (summoner_id)
);

ALTER TABLE Summoner
  ADD CONSTRAINT UQ_summoner_puuid UNIQUE (summoner_puuid);

ALTER TABLE Summoner
  ADD CONSTRAINT UQ_summoner_name UNIQUE (summoner_name);


ALTER TABLE Rune
  ADD CONSTRAINT FK_RuneType_TO_Rune
    FOREIGN KEY (runetype_id)
    REFERENCES RuneType (runetype_id);

ALTER TABLE ChampSkill
  ADD CONSTRAINT FK_ChampData_TO_ChampSkill
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);

ALTER TABLE ChampSkin
  ADD CONSTRAINT FK_ChampData_TO_ChampSkin
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);

ALTER TABLE ItemUpgrade
  ADD CONSTRAINT FK_Item_TO_ItemUpgrade
    FOREIGN KEY (base_item)
    REFERENCES Item (item_id);

ALTER TABLE ItemUpgrade
  ADD CONSTRAINT FK_Item_TO_ItemUpgrade1
    FOREIGN KEY (next_item)
    REFERENCES Item (item_id);