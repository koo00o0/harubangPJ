package com.project.harubang.info;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InfoMapper {

	ArrayList<InfoResultVO> infoList();
	
	ArrayList<InfoResultVO> itemIdCheck(String id);

	InfoHeartCheck heartCheck(InfoHeartCheck vo);

	int heartSuccess(InfoHeartCheck vo);

	int heartUpdate(InfoHeartCheck vo);

	ArrayList<InfoHeartCheck> getHeart(InfoHeartCheck vo);

}
