package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
public class Champskill_dto {
	
	//챔프스킬 초기정보 
	private Integer champ_id;
	private String skill_id;
	private String skill_name;
	private String skill_icon;
	private String skill_desc;
	private String skill_tooltip;
	private String skill_cooldown;
	private String skill_cost;
	private String skill_range;

	
	//챔프스킬 트리 테이블 부분
	private String lane;
	private String skill_build;
	private double pick_rate;
	private Integer game_count;
	private double win_rate;
}
