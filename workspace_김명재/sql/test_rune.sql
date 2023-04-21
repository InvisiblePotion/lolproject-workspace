drop table TEST_RUNE;
create table test_rune (
    runeId number(4),
    runeTypeId number(4),
    runeName nvarchar2(20),
    runeKey varchar(30),
    runeIcon varchar(200),
    runeShortDesc nvarchar2(300),
    runeLongDesc nvarchar2(1000)
);
alter table TEST_RUNE add CONSTRAINT testrune_runeid PRIMARY KEY(RUNEID);

drop table test_rune_type;
create table test_rune_type (
    runeTypeId number(4),
    runeTypeName nvarchar2(2),
    runeTypeKey varchar(30),
    runeTypeIcon varchar(100)
);
alter table test_rune_type add CONSTRAINT testrunetype_id PRIMARY KEY(runeTypeId);
alter table test_rune_type add CONSTRAINT testrunetype_name UNIQUE(runeTypeName);

alter table TEST_RUNE add CONSTRAINT testrune_runeTypeId FOREIGN KEY(runeTypeId) REFERENCES test_rune_type(runeTypeId);

-- DELETE FROM TEST_RUNE;