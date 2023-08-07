package com.project.harubang.userFriend;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface UserFriendMapper {

	public UserFriendVO friendCheck(UserFriendVO vo);

	public int friendRequest(UserFriendVO vo);

	public UserFriendVO friendListCheck(UserFriendVO vo);
	
	public UserFriendVO friendListCheck2(UserFriendVO vo);

	public List<UserFriendVO> friendRequesting(UserFriendVO vo);

	public void requestCancel(UserFriendVO vo);

	public List<UserFriendVO> friendRecive(UserFriendVO vo);

	public List<UserFriendVO> friendList(UserFriendVO vo);

	public List<UserFriendVO> friendList2(UserFriendVO vo);

	public void friendCencle(UserFriendVO vo);

	public void friendCencle2(UserFriendVO vo);

	public void acceptFriend(UserFriendVO vo);

	public void refuseFriend(UserFriendVO vo);

}
