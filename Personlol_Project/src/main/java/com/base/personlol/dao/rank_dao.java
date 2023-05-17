package com.base.personlol.dao;

import java.util.List;

import com.base.personlol.dto.rank_dto;

public interface rank_dao {

	List<rank_dto> challengerinfo();

	List<rank_dto> grandmasterinfo();

	List<rank_dto> masterinfo();

}
