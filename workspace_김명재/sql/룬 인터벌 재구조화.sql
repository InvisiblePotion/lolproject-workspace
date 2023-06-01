
-- create champion_rune_main

CREATE TABLE champion_rune_main
(
  version       VARCHAR(30) NOT NULL,
  update_time   DATE        NOT NULL,
  champ_id      NUMBER(3)   NOT NULL,
  lane          VARCHAR(7)  NOT NULL,
  runetype_core NUMBER(4)   NOT NULL,
  core_mainrune NUMBER(4)   NOT NULL,
  runetype_sub  NUMBER(4)   NOT NULL,
  pick_rate     NUMBER      NOT NULL,
  game_count    NUMBER(6)   NOT NULL,
  win_rate      NUMBER      NOT NULL,
  CONSTRAINT PK_champion_rune_main PRIMARY KEY (
    version, update_time, champ_id, lane,
    runetype_core, core_mainrune, runetype_sub)
);


-- create champion_rune_detail

CREATE TABLE champion_rune_detail
(
  version       VARCHAR(30) NOT NULL,
  update_time   DATE        NOT NULL,
  champ_id      NUMBER(3)   NOT NULL,
  lane          VARCHAR(7)  NOT NULL,
  runetype_core NUMBER(4)   NOT NULL,
  core_mainrune NUMBER(4)   NOT NULL,
  runetype_sub  NUMBER(4)   NOT NULL,
  core_rune1    NUMBER(4)   NOT NULL,
  core_rune2    NUMBER(4)   NOT NULL,
  core_rune3    NUMBER(4)   NOT NULL,
  sub_rune1     NUMBER(4)   NOT NULL,
  sub_rune2     NUMBER(4)   NOT NULL,
  shard_offense NUMBER(4)   NOT NULL,
  shard_flex    NUMBER(4)   NOT NULL,
  shard_defence NUMBER(4)   NOT NULL,
  pick_rate     NUMBER      NOT NULL,
  game_count    NUMBER(6)   NOT NULL,
  win_rate      NUMBER      NOT NULL,
  CONSTRAINT PK_champion_rune_detail PRIMARY KEY (
    version, update_time, champ_id, lane,
    runetype_core, core_mainrune, runetype_sub,
    core_rune1, core_rune2, core_rune3, sub_rune1, sub_rune2,
    shard_offense, shard_flex, shard_defence)
);


-- champion_rune_main FK

ALTER TABLE champion_rune_main
  ADD CONSTRAINT FK_RuneType_TO_champion_rune_main1
    FOREIGN KEY (runetype_core)
    REFERENCES RuneType (runetype_id);

ALTER TABLE champion_rune_main
  ADD CONSTRAINT FK_RuneType_TO_champion_rune_main2
    FOREIGN KEY (runetype_sub)
    REFERENCES RuneType (runetype_id);

ALTER TABLE champion_rune_main
  ADD CONSTRAINT FK_Rune_TO_champion_rune_main1
    FOREIGN KEY (core_mainrune)
    REFERENCES Rune (rune_id);


-- champion_rune_detail FK

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_champion_rune_main_TO_champion_rune_detail1
    FOREIGN KEY (
        version, update_time, champ_id, lane,
        runetype_core, core_mainrune, runetype_sub)
    REFERENCES champion_rune_main (
        version, update_time, champ_id, lane,
        runetype_core, core_mainrune, runetype_sub);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_RuneType_TO_champion_rune_detail1
    FOREIGN KEY (runetype_core)
    REFERENCES RuneType (runetype_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_RuneType_TO_champion_rune_detail2
    FOREIGN KEY (runetype_sub)
    REFERENCES RuneType (runetype_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_Rune_TO_champion_rune_detail1
    FOREIGN KEY (core_mainrune)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_Rune_TO_champion_rune_detail2
    FOREIGN KEY (core_rune1)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_Rune_TO_champion_rune_detail3
    FOREIGN KEY (core_rune2)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_Rune_TO_champion_rune_detail4
    FOREIGN KEY (core_rune3)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_Rune_TO_champion_rune_detail5
    FOREIGN KEY (sub_rune1)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_Rune_TO_champion_rune_detail6
    FOREIGN KEY (sub_rune2)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_RuneShard_TO_champion_rune_detail1
    FOREIGN KEY (shard_offense)
    REFERENCES RuneShard (runeshard_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_RuneShard_TO_champion_rune_detail2
    FOREIGN KEY (shard_flex)
    REFERENCES RuneShard (runeshard_id);

ALTER TABLE champion_rune_detail
  ADD CONSTRAINT FK_RuneShard_TO_champion_rune_detail3
    FOREIGN KEY (shard_defence)
    REFERENCES RuneShard (runeshard_id);