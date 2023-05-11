CREATE TABLE champion_info
(
  version     VARCHAR(30) NOT NULL,
  update_time DATE        NOT NULL,
  champ_id    NUMBER(3)   NOT NULL,
  lane        VARCHAR(7)  NOT NULL,
  tier        NUMBER(1)   NOT NULL,
  win_rate    NUMBER(4,2) NOT NULL,
  pick_rate   NUMBER(4,2) NOT NULL,
  ban_rate    NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_info PRIMARY KEY (version, update_time, champ_id, lane)
);

CREATE TABLE champion_item_boots
(
  version     VARCHAR(30) NOT NULL,
  update_time DATE        NOT NULL,
  champ_id    NUMBER(3)   NOT NULL,
  lane        VARCHAR(7)  NOT NULL,
  boots       NUMBER(4)   NOT NULL,
  pick_rate   NUMBER(4,2) NOT NULL,
  game_count  NUMBER(6)   NOT NULL,
  win_rate    NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_item_boots PRIMARY KEY (version, update_time, champ_id, lane, boots)
);

CREATE TABLE champion_item_build
(
  version     VARCHAR(30) NOT NULL,
  update_time DATE        NOT NULL,
  champ_id    NUMBER(3)   NOT NULL,
  lane        VARCHAR(7)  NOT NULL,
  item1       NUMBER(4)   NOT NULL,
  item2       NUMBER(4)   NOT NULL,
  item3       NUMBER(4)   NOT NULL,
  pick_rate   NUMBER(4,2) NOT NULL,
  game_count  NUMBER(6)   NOT NULL,
  win_rate    NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_item_build PRIMARY KEY (version, update_time, champ_id, lane, item1, item2, item3)
);

CREATE TABLE champion_item_start
(
  version     VARCHAR(30) NOT NULL,
  update_time DATE        NOT NULL,
  champ_id    NUMBER(3)   NOT NULL,
  lane        VARCHAR(7)  NOT NULL,
  start_item  VARCHAR(50) NOT NULL,
  pick_rate   NUMBER(4,2) NOT NULL,
  game_count  NUMBER(6)   NOT NULL,
  win_rate    NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_item_start PRIMARY KEY (version, update_time, champ_id, lane, start_item)
);

CREATE TABLE champion_matchup
(
  version           VARCHAR(30) NOT NULL,
  update_time       DATE        NOT NULL,
  champ_id          NUMBER(3)   NOT NULL,
  lane              VARCHAR(7)  NOT NULL,
  opponent_id       NUMBER(3)   NOT NULL,
  game_count        NUMBER(5)   NOT NULL,
  win_rate          NUMBER(4,2) NOT NULL,
  kda               NUMBER(4,2) NOT NULL,
  kill_involve_rate NUMBER(4,2) NOT NULL,
  dealt_to_champ    NUMBER(6)   NOT NULL,
  position_win_rate NUMBER(4,2) NOT NULL,
  ban_rate          NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_matchup PRIMARY KEY (version, update_time, champ_id, lane, opponent_id)
);

CREATE TABLE champion_rune
(
  version       VARCHAR(30) NOT NULL,
  update_time   DATE        NOT NULL,
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
  CONSTRAINT PK_champion_rune PRIMARY KEY (version, update_time, champ_id, lane, core_mainrune, runetype_sub)
);

CREATE TABLE champion_skill
(
  version     VARCHAR(30) NOT NULL,
  update_time DATE        NOT NULL,
  champ_id    NUMBER(3)   NOT NULL,
  lane        VARCHAR(7)  NOT NULL,
  skill_build VARCHAR(40) NOT NULL,
  pick_rate   NUMBER(4,2) NOT NULL,
  game_count  NUMBER(6)   NOT NULL,
  win_rate    NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_skill PRIMARY KEY (version, update_time, champ_id, lane, skill_build)
);

CREATE TABLE champion_spell
(
  version     VARCHAR(30) NOT NULL,
  update_time DATE        NOT NULL,
  champ_id    NUMBER(3)   NOT NULL,
  lane        VARCHAR(7)  NOT NULL,
  spell1      NUMBER(2)   NOT NULL,
  spell2      NUMBER(2)   NOT NULL,
  pick_rate   NUMBER(4,2) NOT NULL,
  game_count  NUMBER(6)   NOT NULL,
  win_rate    NUMBER(4,2) NOT NULL,
  CONSTRAINT PK_champion_spell PRIMARY KEY (version, update_time, champ_id, lane, spell1, spell2)
);


-- FK_champion_info
ALTER TABLE champion_info
  ADD CONSTRAINT FK_ChampData_TO_champion_info
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);


-- FK_champion_rune
ALTER TABLE champion_rune
  ADD CONSTRAINT FK_ChampData_TO_champion_rune
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_RuneType_TO_champion_rune1
    FOREIGN KEY (runetype_core)
    REFERENCES RuneType (runetype_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_Rune_TO_champion_rune1
    FOREIGN KEY (core_mainrune)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_Rune_TO_champion_rune2
    FOREIGN KEY (core_rune1)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_Rune_TO_champion_rune3
    FOREIGN KEY (core_rune2)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_Rune_TO_champion_rune4
    FOREIGN KEY (core_rune3)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_RuneType_TO_champion_rune2
    FOREIGN KEY (runetype_sub)
    REFERENCES RuneType (runetype_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_Rune_TO_champion_rune5
    FOREIGN KEY (sub_rune1)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_Rune_TO_champion_rune6
    FOREIGN KEY (sub_rune2)
    REFERENCES Rune (rune_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_RuneShard_TO_champion_rune1
    FOREIGN KEY (shard_offense)
    REFERENCES RuneShard (runeshard_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_RuneShard_TO_champion_rune2
    FOREIGN KEY (shard_flex)
    REFERENCES RuneShard (runeshard_id);

ALTER TABLE champion_rune
  ADD CONSTRAINT FK_RuneShard_TO_champion_rune3
    FOREIGN KEY (shard_defence)
    REFERENCES RuneShard (runeshard_id);


-- FK_champion_skill
ALTER TABLE champion_skill
  ADD CONSTRAINT FK_ChampData_TO_champion_skill
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);


-- FK_champion_item_build
ALTER TABLE champion_item_build
  ADD CONSTRAINT FK_ChampData_TO_champion_item_build
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);

ALTER TABLE champion_item_build
  ADD CONSTRAINT FK_Item_TO_champion_item_build1
    FOREIGN KEY (item1)
    REFERENCES Item (item_id);

ALTER TABLE champion_item_build
  ADD CONSTRAINT FK_Item_TO_champion_item_build2
    FOREIGN KEY (item2)
    REFERENCES Item (item_id);

ALTER TABLE champion_item_build
  ADD CONSTRAINT FK_Item_TO_champion_item_build3
    FOREIGN KEY (item3)
    REFERENCES Item (item_id);


-- FK_champion_item_boots
ALTER TABLE champion_item_boots
  ADD CONSTRAINT FK_ChampData_TO_champion_item_boots
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);

ALTER TABLE champion_item_boots
  ADD CONSTRAINT FK_Item_TO_champion_item_boots
    FOREIGN KEY (boots)
    REFERENCES Item (item_id);


-- FK_champion_item_start
ALTER TABLE champion_item_start
  ADD CONSTRAINT FK_ChampData_TO_champion_item_start
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);


-- FK_champion_spell
ALTER TABLE champion_spell
  ADD CONSTRAINT FK_ChampData_TO_champion_spell
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);

ALTER TABLE champion_spell
  ADD CONSTRAINT FK_Spell_TO_champion_spell1
    FOREIGN KEY (spell1)
    REFERENCES Spell (spell_id);

ALTER TABLE champion_spell
  ADD CONSTRAINT FK_Spell_TO_champion_spell2
    FOREIGN KEY (spell2)
    REFERENCES Spell (spell_id);


-- FK_champion_matchup
ALTER TABLE champion_matchup
  ADD CONSTRAINT FK_ChampData_TO_champion_matchup1
    FOREIGN KEY (champ_id)
    REFERENCES ChampData (champ_id);

ALTER TABLE champion_matchup
  ADD CONSTRAINT FK_ChampData_TO_champion_matchup2
    FOREIGN KEY (opponent_id)
    REFERENCES ChampData (champ_id);