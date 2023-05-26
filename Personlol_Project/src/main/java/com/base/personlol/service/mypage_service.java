package com.base.personlol.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.personlol.dao.mypage_dao;
import com.base.personlol.dto.duo_dto;
import com.base.personlol.dto.mypage_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class mypage_service {
	@Autowired
	mypage_dao my_dao;
	
	public String getcurcode(String user_id) {
		System.out.println("service: 세션id 받아옴?"+ user_id);
		String selectcode = my_dao.getcurcode(user_id);
		return selectcode;
	}

	//icon
	public mypage_dto getnameicon(String user_id) {
		System.out.println("service: 세션id 받아옴?"+ user_id);
		mypage_dto getnameicon = my_dao.getnameicon(user_id);
		System.out.println("돌아온 mm"+getnameicon);
		return getnameicon;
	}

	public Integer changelolname(Map<String, String> changelolname) {
		System.out.println("mypage넘어오냐?"+changelolname);
		Integer rename_result = my_dao.changelolname(changelolname);
		System.out.println("받아서 돌아오냐 풋? "+rename_result);
		return rename_result;
	}
	
	// 듀오 요청 받아오기
	public List<Map<String, String>> getrequest(String user_id) {
		System.out.println("req_service userid: "+user_id);
		
		//내 userId로 join해서 요청자 user_lolname가져오기
		List<Map<String, String>> request_lolname = my_dao.request_id(user_id);
		System.out.println("req_ser의 상대lolname: "+request_lolname);
		return request_lolname;
	}
	
	//내 글 불러오기
	public duo_dto getmyboard(String user_id) {
		duo_dto getmyboard = my_dao.getmyboard(user_id);
		System.out.println("서비스 글 정보 리턴직전"+getmyboard);
		return getmyboard;
	}

	public int go_deleteboard(String user_id) {
		System.out.println("글 삭제 실행");
		int deleteboard = my_dao.go_deleteboard(user_id);
		System.out.println("글삭제 실행 반환 값: "+deleteboard);
		
		//0 이상이면 삭제성공
		if(deleteboard > 0) {
			System.out.println("삭제 성공입니다.");
			return deleteboard;
		}
		return 0;
	}

	public int delrequest(String user_id, String user_lolname) {
		System.out.println("거절 서비스 실행");
		
		//user_lolname -> request_id 함수
		System.out.println("서비스 user_lolname: "+user_lolname);
		
		String request_id = my_dao.getuser_id(user_lolname);
		
		System.out.println("거절에서 name -> id: "+request_id);
		
		int delrequest = my_dao.delrequest(request_id, user_id);
		//삭제가 성공한다면 1반환
		if(delrequest >0) {
			System.out.println("delrequest = 1 "+delrequest);
			return delrequest;
		}else {
			System.out.println("듀오요청 삭제 실패");
			return 0;
		}
		
		
	}

	public String go_accept(String user_lolname, String user_id) {
		System.out.println("요청 수락 서비스 롤네임: "+user_lolname);
		System.out.println("요청 수락 서비스 user_id: "+ user_id);
		//user_lolname -> request_id로
		String request_id = my_dao.getuser_id(user_lolname);
		System.out.println("요청 수락 받아온 request_id: "+request_id);
		
		//user_id로 모든 request 정리
		int acc_delete = my_dao.useralldel(user_id);
		//받아온 값이 acc_delete>0 여야함
		System.out.println("요청 수락 서비스 acc_del:" +acc_delete);
		if(acc_delete>0) {
			System.out.println("요청 수락 모든request제거 성공");
			//성공했다면 이제 테이블 업데이트
			int update_duo = my_dao.go_update_duo(user_id, request_id);
			//업데이트 성공하면 1을 반환합니다.
			System.out.println("요청 수락 업데이트: "+ update_duo);
			// 업데이트 성공했다면 아이디값을 받아와
			if(update_duo == 1) {
				System.out.println("요청 수락 업데이트 성공");
				return user_lolname;
			}	
		}
		System.out.println("요청 수락 모든request제거 실패");
		return "err";
	}
	
	
	//내 듀오 목록 불러오기
	public List<mypage_dto> getmyduo(String user_id) {
		System.out.println("듀오 목록 서비스: "+user_id);
		//듀오 친구들의 이름을 받아온다.
 		List<mypage_dto> myduo = my_dao.getmyduo(user_id);
 		System.out.println("듀오 목록 서비스 리턴: "+ myduo);
		return myduo;
	}

	public int go_duo_del(String user_lolname, String user_id) {
		System.out.println("듀오 삭제 서비스: "+"user_lolname: "+user_lolname+"user_id: "+user_id);
		//user_lolname-> request_id
		String request_id = my_dao.getuser_id(user_lolname);
		System.out.println("듀오 삭제 서비스 re_id: "+request_id);
		
		//1이면 삭제완료 0이면 없음
		int result_del = my_dao.go_duo_del(user_id,request_id);
		if(result_del == 1) {
			System.out.println("성공적으로 듀오를 삭제하였습니다.");
			return result_del;
		}else {
			System.out.println("DB에서 삭제 불가처리");
			return 0;
		}
		
		
	}

}
