package com.project.harubang.info;

import java.util.ArrayList;

public interface InfoService {
	
	ArrayList<InfoResultVO> infoList();
	
	ArrayList<InfoResultVO> itemIdCheck(String id);

	void heart(InfoHeartCheck vo,String id,String checkId);

	ArrayList<InfoHeartCheck> getHeart(InfoHeartCheck vo);
}
