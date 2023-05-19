package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain =true)
public class ChampRuneCore_dto {
	
	private Integer rune_id;
	private Integer runetype_id;
	private String rune_name;
	private String rune_key;
	private String rune_icon;
	private String rune_shortdesc;
	private String rune_longdesc;
	
	
}
