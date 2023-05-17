package com.base.personlol.dao;

import java.util.List;

<<<<<<< HEAD
=======
import org.apache.ibatis.annotations.Param;

>>>>>>> 7e07cbab88576cadfdf2605b98c732ce4a4ba0dd
import com.base.personlol.dto.rank_dto;

public interface rank_dao {

<<<<<<< HEAD
	List<rank_dto> challengerinfo();

	List<rank_dto> grandmasterinfo();

	List<rank_dto> masterinfo();
=======
	List<rank_dto> rankinginfo(@Param("rank") String rank, @Param("start_page") int start_page, @Param("end_page") int end_page);

	Integer highpage(@Param("rank") String rank);
>>>>>>> 7e07cbab88576cadfdf2605b98c732ce4a4ba0dd

}
