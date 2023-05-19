package com.base.personlol.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.rank_dto;

public interface rank_dao {

	List<rank_dto> rankinginfo(@Param("rank") String rank, @Param("start_page") int start_page, @Param("end_page") int end_page);

	Integer highpage(@Param("rank") String rank);

}
