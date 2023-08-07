package com.project.harubang.userFriend;

import java.util.List;

public interface UserFriendService {
	
	UserFriendVO friendCheck(UserFriendVO vo);

	int friendRequest(UserFriendVO vo);

	void requestCancel(UserFriendVO vo);

	List<UserFriendVO> friendRequesting(UserFriendVO vo);

	List<UserFriendVO> friendRecive(UserFriendVO vo);

	List<UserFriendVO> friendList(UserFriendVO vo);

	List<UserFriendVO> friendList2(UserFriendVO vo);

	void friendCencle(UserFriendVO vo);

	void friendCencle2(UserFriendVO vo);

	void acceptFriend(UserFriendVO vo);

	void refuseFriend(UserFriendVO vo);

}
