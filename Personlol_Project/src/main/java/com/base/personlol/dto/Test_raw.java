package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
public class Test_raw {
	private String version;
	private String game_id;
	private Integer participant_number;
	private Integer champion_id;
	private String lane;
	private String participant_puuid;
	private String game;
	private String summoner;
	private String champion;
	private String spell;
	private String skill;
	private String skilltree;
	private String rune;
	private String item;
	private String startitem;
	private String itemtree;
	private String kda;
	private String gold;
	private String cs;
	private String turret;
	private String damage;
	private String vision;
}
