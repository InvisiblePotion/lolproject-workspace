package com.base.personlol.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("userinfo")
@Accessors(chain = true)

public class userinfo_dto {
	
	String user_id;
	String user_pw;
	String user_lolname;
	String user_code;

}
