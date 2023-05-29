package com.base.personlol.dto;

import java.util.List;

import lombok.Data;

@Data
public class summoner_recent_game_dto {
    String summoner_name;
    List<String> game_id_list;
}
