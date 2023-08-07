package com.project.harubang.userFriend;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserFriendServiceImpl implements UserFriendService {

	@Autowired
	private UserFriendMapper mapper;

	@Autowired
	private HttpSession session;

	@Override
	public UserFriendVO friendCheck(UserFriendVO vo) {

		return mapper.friendCheck(vo);
	}

	@Override
	public int friendRequest(UserFriendVO vo) {

		UserFriendVO result = mapper.friendListCheck(vo);
		UserFriendVO result1 = mapper.friendListCheck2(vo);
		System.out.println(result);
		if (result == null && result1 == null) {
			return mapper.friendRequest(vo);
		} else {
			return 0;
		}
	}

	@Override
	public List<UserFriendVO> friendRequesting(UserFriendVO vo) {

		return mapper.friendRequesting(vo);

	}

	@Override
	public void requestCancel(UserFriendVO vo) {
		mapper.requestCancel(vo);
	}

	@Override
	public List<UserFriendVO> friendRecive(UserFriendVO vo) {

		return mapper.friendRecive(vo);
	}

	@Override
	public List<UserFriendVO> friendList(UserFriendVO vo) {

		return mapper.friendList(vo);
	}

	@Override
	public List<UserFriendVO> friendList2(UserFriendVO vo) {

		return mapper.friendList2(vo);
	}

	@Override
	public void friendCencle(UserFriendVO vo) {

		mapper.friendCencle(vo);
	}

	@Override
	public void friendCencle2(UserFriendVO vo) {

		mapper.friendCencle2(vo);

	}

	@Override
	public void acceptFriend(UserFriendVO vo) {

		mapper.acceptFriend(vo);
	}

	@Override
	public void refuseFriend(UserFriendVO vo) {

		mapper.refuseFriend(vo);

	}

}
