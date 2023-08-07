package com.project.harubang.user;

import java.util.List;

public interface UserService {

	UserVO joinIdCheck(UserVO vo, String id);

	int join(UserVO vo);

	UserVO login(UserVO vo);
	
	UserVO idFind(UserVO vo);
	
	UserVO pwFind(UserVO vo);
	
	int pwFindChange(UserVO vo);

	UserVO myPage(UserVO vo);

	int myPwInfo(UserVO vo);
	
	int myEmInfo(UserVO vo);

	int myPhInfo(UserVO vo);
	
}
