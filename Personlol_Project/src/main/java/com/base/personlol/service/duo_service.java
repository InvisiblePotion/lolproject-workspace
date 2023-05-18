package com.base.personlol.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.base.personlol.dao.duo_dao;
import com.base.personlol.dto.Duo_dto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class duo_service {
	
	@Autowired
	duo_dao ddao;
	
	public List<Duo_dto> getList() {
		System.out.println("getList..........");
		List<Duo_dto> dList=null;
		dList=ddao.getList();
		return dList;
	}
	
	public boolean duoWrite(Duo_dto duo) {
		System.out.println("Service: "+ ddao.duoWrite(duo));
		return ddao.duoWrite(duo);
	}
	
	public void duoDelete(Integer duo_id) {
		boolean b = true;
		int cnt=ddao.getDuoExist(duo_id);
		if (cnt!=0) {
			b = ddao.duoDelete(duo_id);
		}System.out.println("b="+b);
		/* return ddao.duoDelete(duo_id); */
	}

	public boolean duoUpdate(Duo_dto duo) {
		System.out.println("Service_update: "+duo);
		return ddao.duoUpdate(duo);
	}

	
	
//	public boolean duoWrite(duo_dto duo) {
//		return ddao.duoWrite(duo);
//	}
	
	
	/*
	 * public List<duo_dto> duoWrite(duo_dto duo) { List<duo_dto> dList =
	 * null; dList=ddao.getList(); return dList;
	 
	}*/

//	public boolean duoDelete(String duo_id) {
//		System.out.println("Success Delete..........");
//		List<duo_dto> dList = null; 
//		dList= ddao.getList();
//		return	dList;
//	}

	
	/*
	 * @Transactional public void duoDelete(Integer duo_id) { boolean id; id=true;
	 * 
	 * List<duo_dto> dList = null; dList = ddao.getList();
	 * System.out.println("after delete="+ dList); return dList; }
	 */

	/*
	 * public List<duo_dto> duoUpdate(duo_dto duo) { // TODO Auto-generated
	 * method stub return null; }
	 * 
	 * public List<duo_dto> duoDelete(duo_dto duo) { // TODO Auto-generated
	 * method stub return null; }
	 * 
	 */	
//	public int duoWriteTest(duo_dto duo) {
//		int a = checkDB(duo);
//		System.out.println("프리베이트 찍히나요~?:"+a);
//		if (a == 1) {
//			System.out.println("MM실패 탔어요~");
//			System.out.println("if문안의 코드에용"+duo);
//			return 0;
//		}else {
//			System.out.println("MM성공 탔어요~");
//			System.out.println("if문안의 코드에용"+duo);
//			return ddao.duoWriteTest(duo);
//		}
//	}
//		
//		
//	private int checkDB (duo_dto duo) {
//		return ddao.cheackDB(duo);
//	}
	

}
