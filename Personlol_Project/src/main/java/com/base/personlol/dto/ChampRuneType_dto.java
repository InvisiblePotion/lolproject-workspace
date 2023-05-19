package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain =true)
public class ChampRuneType_dto {
	private Integer runetype_id;
	private String runetype_name;
	private String runetype_key;
	private String runetype_icon;
	
	//rune join 한 컬럼들
//	private Integer rune_id;
//	private Integer rune_name;
//	private Integer rune_key;
//	private Integer rune_icon;
//	private Integer rune_shortdesc;
//	private Integer rune_longdesc;
}
