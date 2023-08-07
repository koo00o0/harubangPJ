package com.project.harubang.userFriend;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.api.Session;

@Controller
public class UserFriendController {

	@Autowired
	private UserFriendService service;

	// 模备格废 其捞瘤
	@RequestMapping(value = "user/friendPage", method = RequestMethod.GET)
	public String friend() {

		return "user/friendPage";
	}

	// 模备八祸
	@RequestMapping(value = "/friend", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String friendCheck(UserFriendVO vo, @RequestParam String id, HttpSession session) {

		UserFriendVO result = service.friendCheck(vo);
		if (result == null) {
			return "F";
		} else {
			vo.setId(result.getId());
			session.setAttribute("friendId", result.getId());
			return result.getId();
		}
	}

	// 模备夸没焊郴扁
	@RequestMapping(value = "/friendRequest", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String friendRequest(UserFriendVO vo, HttpSession session) {

		String id = (String) session.getAttribute("id");
		String RECIVE_id = (String) session.getAttribute("friendId");
		vo.setId(id);
		vo.setRECIVE_id(RECIVE_id);
		int result = service.friendRequest(vo);
		if (result == 1) {
			return "F";
		}
		return "T";
	}

	// 模备夸没吝牢 模备犬牢
	@RequestMapping(value = "/friendRequesting", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<UserFriendVO> friendRequesting(UserFriendVO vo, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		List<UserFriendVO> result = service.friendRequesting(vo);
		return result;
	}

	// 模备夸没吝 秒家
	@RequestMapping(value = "/requestCancel", method = RequestMethod.POST)
	@ResponseBody
	public void requestCancel(UserFriendVO vo, HttpSession session, @RequestParam String recive_id) {
		
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		vo.setRECIVE_id(recive_id);
		service.requestCancel(vo);
	}

	// 模备夸没捞 甸绢柯 模备
	@RequestMapping(value = "/friendRecive", method = RequestMethod.POST)
	@ResponseBody
	public List<UserFriendVO> friendRecive(UserFriendVO vo, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		List<UserFriendVO> result1 = service.friendRecive(vo);
		return result1;
	}

	// 模备格废 阂矾坷扁
	@RequestMapping(value = "/friendList", method = RequestMethod.POST)
	@ResponseBody
	public List<UserFriendVO> friendList(UserFriendVO vo, HttpSession session) {

		String id = (String) session.getAttribute("id");
		vo.setId(id);
		List<UserFriendVO> result2 = service.friendList(vo);
		return result2;
	}

	// 模备格废 阂矾坷扁
	@RequestMapping(value = "/friendList2", method = RequestMethod.POST)
	@ResponseBody
	public List<UserFriendVO> friendList2(UserFriendVO vo, HttpSession session) {

		String id = (String) session.getAttribute("id");
		vo.setId(id);
		List<UserFriendVO> result3 = service.friendList2(vo);
		return result3;
	}

	// 模备格废 模备昏力
	@RequestMapping(value = "/friendCencle", method = RequestMethod.POST)
	@ResponseBody
	public void friendCencle(UserFriendVO vo, HttpSession session, @RequestParam String recive_id) {

		String id = (String) session.getAttribute("id");
		vo.setId(id);
		vo.setRECIVE_id(recive_id);

		service.friendCencle(vo);
	}

	// 模备格废 模备昏力
	@RequestMapping(value = "/friendCencle2", method = RequestMethod.POST)
	@ResponseBody
	public void friendCencle2(UserFriendVO vo, HttpSession session, @RequestParam String send_id) {
	
		String id = (String) session.getAttribute("id");
		vo.setSend_id(send_id);
		vo.setId(id);

		service.friendCencle2(vo);
	}

	// 模备夸没 荐遏
	@RequestMapping(value = "/acceptFriend", method = RequestMethod.POST)
	@ResponseBody
	public void acceptFriend(UserFriendVO vo, HttpSession session, @RequestParam String send_id) {

		String id = (String) session.getAttribute("id");
		vo.setSend_id(send_id);
		vo.setId(id);
		service.acceptFriend(vo);
	}

	// 模备夸没 芭例
	@RequestMapping(value = "/refuseFriend", method = RequestMethod.POST)
	@ResponseBody
	public void refuseFriend(UserFriendVO vo, HttpSession session, @RequestParam String send_id) {

		String id = (String) session.getAttribute("id");
		vo.setSend_id(send_id);
		vo.setId(id);
		service.refuseFriend(vo);
	}
}