package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class champion_dto {
	private int champ_id;
	private String champ_key;
	private String champ_name;
	private String champ_title;
	private String champ_icon;
	private String champ_full;
	
//	champion_info와 join 컬럼들
	private String lane;
	private String win_rate;
	private String pick_rate;
	private String ban_rate;
	
	
	
	
}
