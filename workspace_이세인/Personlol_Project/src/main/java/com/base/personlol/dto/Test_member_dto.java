package com.base.personlol.dto;

import java.util.Random;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)

@Alias("member")
public class Test_member_dto {
	private String userid;
	private String userpw;
	private String pwchk;
	private String account;
	private String usercode;
	
	

}
