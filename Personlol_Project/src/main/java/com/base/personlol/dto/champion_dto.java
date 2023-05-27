package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class champion_dto {
	private Integer champ_id;
	private String champ_key;
	private String champ_name;
	private String champ_title;
	private String champ_icon;
	private String champ_full;
	
//	champion_info와 join 컬럼들
	private String lane;
	private Integer game_count;
	private double win_rate;
	private double pick_rate;
	private double ban_rate;
	
	
	//정렬
	private String sort;
	
	//champion matchup과 조인
	private Integer champ_id_x;
	private Integer champ_id_y;

	
	
	
	
}
