package com.project.harubang.info;

import java.util.ArrayList;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoServiceImpl implements InfoService{

	@Autowired
	private InfoMapper mapper;
	
	
	@Override
	public ArrayList<InfoResultVO> infoList() {
		return mapper.infoList();
	}
	
	@Override
	public ArrayList<InfoResultVO> itemIdCheck(String id) {
		return mapper.itemIdCheck(id);
	}

	@Override
	public void heart(InfoHeartCheck vo,String id , String checkId) {
	    
		InfoHeartCheck vo1 = mapper.heartCheck(vo);	 

		if (vo1 == null) {

	    	vo.setId(id);
	    	vo.setCheckId(checkId);
	        int heartS = mapper.heartSuccess(vo);
	    } else {
	        // 존재하면 반대값
	        String wish = vo1.getWish();
	        if ("SUCCESS".equals(wish) ) {
	            wish = "FALSE";
	        } else {
	            wish = "SUCCESS";
	        }
	        vo.setId(id);
	    	vo.setCheckId(checkId);
	    	vo.setWish(wish);
	        int heartF = mapper.heartUpdate(vo);
	    }
	}

	@Override
	public ArrayList<InfoHeartCheck> getHeart(InfoHeartCheck vo) {
		
		
		return mapper.getHeart(vo);
	}
}
