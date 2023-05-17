package com.base.personlol.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("duo")
public class duo_dto {
	
	private Long duo_id;
	private String duo_title;
	private String duo_content;
	private Date duo_date;
	
}
