package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
public class ChampSpell_dto {
	private Integer champ_id;
	private String lane;
	private Integer spell1;
	private Integer spell2;
	private double pick_rate;
	private Integer game_count;
	private double win_rate;
	
	//스펠 이미지 부분
	private Integer spell_id;
	private String spell_key;
	private String spell_name;
	private String spell_desc;
	private String spell_icon;
}
