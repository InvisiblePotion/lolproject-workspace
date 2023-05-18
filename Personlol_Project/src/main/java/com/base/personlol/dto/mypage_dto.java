package com.base.personlol.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("mypage")
@Accessors(chain = true)

public class mypage_dto {
	
	String user_id;
	int summoner_profile;
	String summoner_name;
}
