drop table TEST_RUNE;
create table test_rune (
    runeId number(4),
    runeTypeId number(4),
    runeName nvarchar2(20),
    runeKey varchar(30),
    runeIcon varchar(100),
    runeShortDesc nvarchar2(300),
    runeLongDesc nvarchar2(1000)
);
alter table TEST_RUNE add CONSTRAINT testrune_runeid PRIMARY KEY(RUNEID);
alter table TEST_RUNE add CONSTRAINT testrune_runeTypeId FOREIGN KEY(runeTypeId) REFERENCES test_rune_type(runeTypeId);

drop table test_rune_type;
create table test_rune_type (
    runeTypeId number(4),
    runeTypeName nvarchar2(2),
    runeTypeKey varchar(30),
    runeTypeIcon varchar(100)
);
alter table test_rune_type add CONSTRAINT testrunetype_id PRIMARY KEY(runeTypeId);
alter table test_rune_type add CONSTRAINT testrunetype_name UNIQUE(runeTypeName);

DELETE FROM TEST_RUNE;

MERGE INTO TEST_RUNE USING DUAL ON(RUNEID=8112 and RUNETYPEID=8100) WHEN NOT MATCHED THEN INSERT VALUES(8112, 8100, "감전", "Electrocute", "perk-images/Styles/Domination/Electrocute/Electrocute.png", "3초 동안 같은 챔피언에게 기본 공격 또는 <b>개별</b> 스킬 3회를 적중시키면 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'>적응형 피해</lol-uikit-tooltipped-keyword> 적용", "3초 동안 같은 챔피언에게 <b>개별</b> 공격 또는 스킬을 3회 적중시키면 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입힙니다.<br><br>피해량: 30~180 (+추가 공격력의 0.4, +주문력의 0.25)<br><br>재사용 대기시간: 25~20초<br><br><hr><i>'우리는 그들을 천둥군주라고 부른다. 그들의 번개를 입에 올리는 것은 재앙을 부르는 길이기 때문이다.'</i>");