package com.base.personlol.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.dao.duo_dao;
import com.base.personlol.dto.duo_dto;
import com.base.personlol.dto.rank_dto;
import com.base.personlol.dto.userinfo_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class duo_service {

	@Autowired
	duo_dao ddao;

	public List<duo_dto> getList() {
		List<duo_dto> dList = null;
		dList = ddao.getList();

		return dList;
	}

	public boolean duoWrite(duo_dto duo) {
		System.out.println(""+duo.getDuo_ownerid());
		String user_id = duo.getDuo_ownerid();
		System.out.println("글쓰기요청자 id: "+ user_id);
		//글쓰기 중복체크 이미있다면 1 없으면 0
		int checkboard = ddao.checkboard(user_id);
		System.out.println("1=O, 0=X: "+checkboard);
		if(checkboard != 1) {
			return ddao.duoWrite(duo);
		}else {
			return false;
		}
		
	}

	// kang tae min
	public String getId(int duo_id) {
		System.out.println("service 작동중.." + duo_id);
		String getId = ddao.getId(duo_id);
		return getId;
	}

	public void Disable(Integer duo_id) {
		ddao.Disable(duo_id);
	}

	//
	public userinfo_dto getUserInfo(String duo_ownerid) {
		userinfo_dto userInfo = ddao.getUser_lolname(duo_ownerid);
		// 나머지 사용자 정보 설정...
		return userInfo;
	}

	public void accept(int duo_id, String loginCheck) {
		ddao.accept(duo_id, loginCheck);

	}

	public void convert(String loginCheck) {
		ddao.convert(loginCheck);

	}

	public List<Map<String, Object>> Line(String lane, int page, String tier) {
		System.out.println("lane: 값은 : " + lane);
		System.out.println("라인 서비스 작동하니?");

		int start_page = 1;

		int end_page = (page * 18);

		System.out.println("start_page:" + start_page);

		System.out.println("end_page:" + end_page);

		// 티어 값이 null인지 아닌지
		if (tier.equals("null")) {
			System.out.println("티어 정렬 아님");
			if ("top".equals(lane)) {
				List<Map<String, Object>> Line = ddao.top(start_page, end_page);
				return Line;
			} else if ("jungle".equals(lane)) {
				List<Map<String, Object>> Line = ddao.jungle(start_page, end_page);
				return Line;
			} else if ("mid".equals(lane)) {
				List<Map<String, Object>> Line = ddao.mid(start_page, end_page);
				return Line;
			} else if ("bottom".equals(lane)) {
				List<Map<String, Object>> Line = ddao.bottom(start_page, end_page);
				return Line;
			} else if ("support".equals(lane)) {
				List<Map<String, Object>> Line = ddao.support(start_page, end_page);
				return Line;
			} else {
				List<Map<String, Object>> Line = ddao.all(start_page, end_page);
				return Line;
			}

		} else {
			System.out.println("티어별 정렬");
			System.out.println("티어찍히낭?" + tier);
			List<Map<String, Object>> tier_Line = ddao.tier_all(start_page, end_page, tier);
			System.out.println("티어별 정렬 후 라인 받아와 DB에서?: " + tier_Line);
			return tier_Line;
		}
	}

	public Integer request(String user_id, String request_id) {
		System.out.println("피 요청자 id: " + user_id);
		System.out.println("요청자 id: " + request_id);
		// 같은 사람에게 요청 했는지 안했는지 했다면 막아야하니까
		int check_request = ddao.check_request(user_id, request_id);
		// 같은 사람이랑 이미 친구인지
		int check_myduo = ddao.check_myduo(user_id, request_id);
		System.out.println("check_request 1=중복: " + check_request);
		if (check_request != 1) {
			if(check_myduo != 1) {
				Integer insert_request = ddao.request(user_id, request_id);
				System.out.println("요청 성공이라면 1: " + insert_request);
				return insert_request;
			}else {
				System.out.println("이미 듀오 목록에있는 사람입니다.");
				return -88;
			}
		}else {
			System.out.println("같은 사람에게 요청");
			return -99;
		}

	}

}
