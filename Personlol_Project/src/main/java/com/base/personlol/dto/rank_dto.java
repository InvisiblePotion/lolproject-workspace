package com.base.personlol.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("rank_dto")
@Accessors(chain = true)

public class rank_dto {
	
	String tier;
	String summonerId;
	String summonerName;
	int leaguePoints;
	int wins;
	int losses;
	boolean veteran;
	boolean inactive;
	boolean freshBlood;
	boolean hotStreak;
	int ranking;

}
