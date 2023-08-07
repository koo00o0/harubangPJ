package com.project.harubang.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Autowired
	private HttpSession session;

	@Override
	public UserVO joinIdCheck(UserVO vo, String id) {
		return mapper.joinIdCheck(id);
	}

	@Override
	public int join(UserVO vo) {
		return mapper.join(vo);
	}
	
	@Override
	public UserVO idFind(UserVO vo) {
	
		return mapper.idFind(vo);
	}
	
	@Override
	public UserVO pwFind(UserVO vo) {

		return mapper.pwFind(vo);
	}
	
	@Override
	public int pwFindChange(UserVO vo) {

		return mapper.pwFindChange(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		return mapper.login(vo);
	}

	@Override
	public UserVO myPage(UserVO vo) {
		return mapper.myPage(vo);
	}

	@Override
	public int myPwInfo(UserVO vo) {
		return mapper.myPwInfo(vo);
	}

	@Override
	public int myEmInfo(UserVO vo) {

		return mapper.myEmInfo(vo);
	}

	@Override
	public int myPhInfo(UserVO vo) {

		return mapper.myPhInfo(vo);
	}
}
