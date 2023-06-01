package com.base.personlol.dto;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
public class Item_dto {
	
	//아이템 초기정보
	private Integer champ_id;
	private Integer item_id;
	private String item_name;
	private String item_icon;
	private String item_desc;
	private String item_plaintext;
	private String item_totgold;
	private String item_basegold;
	
	//쳄피언 아이템 빌드 테이블 부분 
	private String lane;
	private Integer item1;
	private Integer item2;
	private Integer item3;
	private double pick_rate;
	private Integer game_count;
	private double win_rate;
	
	
	
	
	
}
