package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ChampStartBoots_dto {
	private Integer champ_id;
	private String lane;
	private Integer boots;
	private double pick_rate;
	private double game_count;
	private double win_rate;
	
}
