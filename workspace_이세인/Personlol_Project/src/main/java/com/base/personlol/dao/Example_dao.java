package com.base.personlol.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.base.personlol.dto.Example_dto;
import com.base.personlol.dto.Test_member_dto;

public interface Example_dao {
	
	Example_dto testDB(Map<String, Integer> nums);



	int testDB3(Test_member_dto member);

	int cheackID(String userid);

	String login(Map<String, String> logindata);

	int cheackCode(String usercode);

	String pwfind(Map<String, String> pwfinddata);

	String idfind(@Param("account") String account, @Param("usercode") String usercode);



	int checknewpw(String usercode);


	Integer changepw(Map<String, String> changepwdata);


	Integer newcode(Map<String, String> id);

	Integer deletemember(Map<String, String> userid);
}
