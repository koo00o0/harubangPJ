package com.project.harubang.user;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface UserMapper {

	public UserVO joinIdCheck(String id);

	public int join(UserVO vo);

	public UserVO login(UserVO vo);
	
	public UserVO idFind(UserVO vo);
	
	public UserVO pwFind(UserVO vo);
	
	public int pwFindChange(UserVO vo);

	public UserVO myPage(UserVO vo);

	public int myPwInfo(UserVO vo);
	
	public int myEmInfo(UserVO vo);
	
	public int myPhInfo(UserVO vo);

}
