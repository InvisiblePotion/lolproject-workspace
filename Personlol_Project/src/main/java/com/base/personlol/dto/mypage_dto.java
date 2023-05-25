package com.base.personlol.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("mypage")
@Accessors(chain = true)

public class mypage_dto {
	
	private String user_id;
	private int summoner_profile;
	private String summoner_name;
	
	private String duo_ownerid;
	private String duo_title;
	private String duo_content;
	
	private String duolist;
}
