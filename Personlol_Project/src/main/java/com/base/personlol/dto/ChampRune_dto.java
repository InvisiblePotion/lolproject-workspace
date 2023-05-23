package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain =true)
public class ChampRune_dto {
	private Integer champ_id;
	private String lane;
	private Integer runetype_core;
	private Integer core_mainrune;
	private Integer core_rune1;
	private Integer core_rune2;
	private Integer core_rune3;
	private Integer runetype_sub;
	private Integer sub_rune1;
	private Integer sub_rune2;
	private Integer shard_offense;
	private Integer shard_flex;
	private Integer shard_defence;
	private Integer pick_rate;
	private Integer game_count;
	private Integer win_rate;
	
	//rune join 아이콘들 가져오기
	
	
}
