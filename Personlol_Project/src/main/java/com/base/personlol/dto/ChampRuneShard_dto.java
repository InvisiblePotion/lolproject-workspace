package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain =true)
public class ChampRuneShard_dto {
	private Integer runeshard_id;
	private String runeshard_stat;
	private String runeshard_icon;
	private String runeshard_desc;
	
}
