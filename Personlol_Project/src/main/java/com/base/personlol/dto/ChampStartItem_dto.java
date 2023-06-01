package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ChampStartItem_dto {
	private Integer champ_id;
	private String lane;
	private String start_item;
	private double pick_rate;
	private double game_count;
	private double win_rate;
	
}
