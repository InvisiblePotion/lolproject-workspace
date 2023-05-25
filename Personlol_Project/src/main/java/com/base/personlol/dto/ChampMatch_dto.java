package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ChampMatch_dto {
	
	private String lane;
	private String champ_id_x;
	private String champ_id_y;
	private String matchup_count;
	private String matchup_win_rate;
	private String kda_x;
	private String kda_y;
	private String killparticipation_x;
	private String killparticipation_y;
	private String total_champ_damage_x;
	private String total_champ_damage_y;
	
}
