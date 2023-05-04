-- ================================================================
-- ========================== 챔피언 정보 ==========================
-- ================================================================

CREATE TABLE ChampData
(
  champ_id    NUMBER(3)    NOT NULL,
  champ_key   VARCHAR(12)  NOT NULL,
  champ_name  NVARCHAR2(9) NOT NULL,
  champ_title VARCHAR      NOT NULL,
  champ_icon  VARCHAR      NOT NULL,
  champ_full  VARCHAR      NOT NULL,
  CONSTRAINT PK_ChampData PRIMARY KEY (champ_id)
);

ALTER TABLE ChampData
  ADD CONSTRAINT UQ_champ_id UNIQUE (champ_id);

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


-- ================================================================
-- ========================== 룬 빌드 정보 =========================
-- ================================================================

CREATE TABLE RuneType
(
  runetype_id   NUMBER(4)    NOT NULL,
  runetype_name NVARCHAR2(2) NOT NULL,
  runetype_key  VARCHAR(16)  NOT NULL,
  runetype_icon VARCHAR      NOT NULL,
  CONSTRAINT PK_RuneType PRIMARY KEY (runetype_id)
);

ALTER TABLE RuneType
  ADD CONSTRAINT UQ_runetype_id UNIQUE (runetype_id);

ALTER TABLE RuneType
  ADD CONSTRAINT UQ_runetype_name UNIQUE (runetype_name);

ALTER TABLE RuneType
  ADD CONSTRAINT UQ_runetype_key UNIQUE (runetype_key);

ALTER TABLE RuneType
  ADD CONSTRAINT UQ_runetype_icon UNIQUE (runetype_icon);

-- ================================================================
-- ============================ 룬 정보 ============================
-- ================================================================

CREATE TABLE Rune
(
  rune_id        NUMBER(4)       NOT NULL,
  runetype_id    NUMBER(4)       NOT NULL,
  rune_name      NVARCHAR2(20)   NOT NULL,
  rune_key       VARCHAR(30)     NOT NULL,
  rune_icon      VARCHAR         NOT NULL,
  rune_shortdesc NVARCHAR2(300)  NOT NULL,
  rune_longdesc  NVARCHAR2(1000) NOT NULL,
  CONSTRAINT PK_Rune PRIMARY KEY (rune_id)
);

ALTER TABLE Rune
  ADD CONSTRAINT UQ_rune_id UNIQUE (rune_id);

ALTER TABLE Rune
  ADD CONSTRAINT UQ_rune_name UNIQUE (rune_name);

ALTER TABLE Rune
  ADD CONSTRAINT UQ_rune_key UNIQUE (rune_key);

-- ================================================================
-- ========================= 룬 파편 정보 ==========================
-- ================================================================

CREATE TABLE RuneShard
(
  runeshard_id   NUMBER(4)     NOT NULL,
  runeshard_type VARCHAR(7)    NOT NULL,
  runeshard_stat NVARCHAR2(2)  NOT NULL,
  runeshard_icon VARCHAR       NOT NULL,
  runeshard_desc NVARCHAR2(30) NOT NULL,
  CONSTRAINT PK_RuneShard PRIMARY KEY (runeshard_id)
);

ALTER TABLE RuneShard
  ADD CONSTRAINT UQ_runeshard_id UNIQUE (runeshard_id);

ALTER TABLE RuneShard
  ADD CONSTRAINT UQ_runeshard_stat UNIQUE (runeshard_stat);

-- ================================================================
-- =========================== 챔피언/룬 ===========================
-- ================================================================

CREATE TABLE champion_rune
(
  champ_id      NUMBER(3)   NOT NULL,
  lane          VARCHAR(7)  NOT NULL,
  runetype_core NUMBER(4)   NOT NULL,
  core_mainrune NUMBER(4)   NOT NULL,
  core_rune1    NUMBER(4)   NOT NULL,
  core_rune2    NUMBER(4)   NOT NULL,
  core_rune3    NUMBER(4)   NOT NULL,
  runetype_sub  NUMBER(4)   NOT NULL,
  sub_rune1     NUMBER(4)   NOT NULL,
  sub_rune2     NUMBER(4)   NOT NULL,
  shard_offense NUMBER(4)   NOT NULL,
  shard_flex    NUMBER(4)   NOT NULL,
  shard_defence NUMBER(4)   NOT NULL,
  pick_rate     NUMBER(4,2) NOT NULL,
  game_count    NUMBER(6)   NOT NULL,
  win_rate      NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_rune PRIMARY KEY (champ_id, lane, core_mainrune, runetype_sub)
);