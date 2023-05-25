package com.base.personlol.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("summonerinfodto")
@Accessors(chain = true)

public class summoner_dto {
	String summoner_tier;
	int summoner_profile;
	int summoner_level;
	int summoner_losses;
	int summoner_wins;
}
