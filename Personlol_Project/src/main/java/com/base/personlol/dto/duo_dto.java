package com.base.personlol.dto;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("duo")
public class duo_dto {
	
	private Long duo_id;
	private String duo_ownerid;
	private String duo_accepter;
	private String duo_content;
	private Long duo_active;
	private Timestamp duo_date;
	private String duo_title;	
}

