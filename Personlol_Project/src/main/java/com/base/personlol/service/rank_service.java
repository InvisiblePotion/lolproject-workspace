package com.base.personlol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.rank_dao;
import com.base.personlol.dto.rank_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class rank_service {
	@Autowired
	rank_dao r_dao;

	public List<rank_dto> challengerinfo() {
		List<rank_dto> challengerinfo = r_dao.challengerinfo();
		System.out.println("ser에 challengerinfo 받아와? ");
		return challengerinfo;
	}

	public List<rank_dto> grandmasterinfo() {
		List<rank_dto> grandmasterinfo = r_dao.grandmasterinfo();
		System.out.println("ser에 grandmasterinfoinfo 받아와? ");
		return grandmasterinfo;
	}

	public List<rank_dto> masterinfo() {
		List<rank_dto> masterinfo = r_dao.masterinfo();
		System.out.println("ser에 masterinfoinfo 받아와? ");
		return masterinfo;
	}

}
