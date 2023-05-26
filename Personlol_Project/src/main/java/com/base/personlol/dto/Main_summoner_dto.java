package com.base.personlol.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
@Alias("mainSummoner")
public class Main_summoner_dto {
	private String summoner_name;
	private String summoner_level;
	private String summoner_tier;
	private int summoner_profile;
}
