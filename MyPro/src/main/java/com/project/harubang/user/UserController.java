package com.project.harubang.user;

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
public class UserController {

	@Autowired
	private UserService service;

	// 회원가입 페이지
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String joinPage() {
		return "/user/join";
	}

	// 로그인 페이지
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String userLogin() {
		return "/user/login";
	}

	// id 찾기 페이지
	@RequestMapping(value = "/user/idFind", method = RequestMethod.GET)
	public String idFind() {
		return "/user/idFind";
	}

	// id 찾기 페이지
	@RequestMapping(value = "/user/idFindPage", method = RequestMethod.GET)
	public String idFindPage() {
		return "/user/idFindPage";
	}

	// pw 찾기 페이지
	@RequestMapping(value = "/user/pwFind", method = RequestMethod.GET)
	public String pwFind() {
		return "/user/pwFind";
	}

	// pw 찾기 페이지
	@RequestMapping(value = "/user/pwFindPage", method = RequestMethod.GET)
	public String pwFindPage() {
		return "/user/pwFindPage";
	}

	// 마이페이지 이동
	@RequestMapping(value = "user/mypage", method = RequestMethod.GET)
	public String Mypage() {
		return "user/mypage";
	}

	// 마이페이지
	@PostMapping("/mypage")
	public String myPwInfo() {
		return "user/modify";
	}

	// 비밀번호 수정페이지 이동
	@RequestMapping(value = "user/modify", method = RequestMethod.GET)
	public String modify() {
		return "user/modify";
	}

	// 이메일 수정페이지 이동
	@RequestMapping(value = "user/modifyEmail", method = RequestMethod.GET)
	public String modifyEmail() {
		return "user/modifyEmail";
	}

	// 전화번호 수정페이지 이동
	@RequestMapping(value = "user/modifyPhone", method = RequestMethod.GET)
	public String modifyPhone() {
		return "user/modifyPhone";
	}

	// 
	@RequestMapping(value = "/user/include/mypageInfoChange", method = RequestMethod.GET)
	public String mypageinfoChange() {
		return "/user/include/mypageInfoChange";
	}

	// 
	@RequestMapping(value = "/user/include/mypageFriendAdd", method = RequestMethod.GET)
	public String mypageFriendAdd() {
		return "/user/include/mypageFriendAdd";
	}
	
	// 
	//**** 여기 까지 페이지 불러오는 로직	*****
	
	// ↓ 기능 구현 로직 

	// 회원가입 (id중복체크)  
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	@ResponseBody
	public String joinIdCheck(UserVO vo, @RequestParam String id, RedirectAttributes rttr) {
		
		UserVO result = service.joinIdCheck(vo, id);

		if (result == null) {
			rttr.addFlashAttribute("fail2", "fail");
			return "F";
		} else {
			return "T";
		}
	}
	
	// 회원가입
	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public String join(UserVO vo) {
		
		int num = service.join(vo);
		if (num == 1) {
			return "user/login";
		} else {
			return "user/join";
		}
	}

	// 로그인
	@PostMapping(value = "/login", produces = "application/json;charset=UTF-8")
	public String login(UserVO vo, Model model, RedirectAttributes rttr, HttpSession session) {
		
		UserVO resultVO = service.login(vo);

		if (resultVO == null || resultVO.equals("")) {
			rttr.addFlashAttribute("Loginfalse", "fail");
			return "redirect:/user/login";
		} else {
			model.addAttribute("vo", resultVO);
			session.setAttribute("id", resultVO.getId());
			session.setAttribute("pw", resultVO.getPw());
			session.setAttribute("email", resultVO.getEmail());
			session.setAttribute("phone", resultVO.getPhone());
			session.setAttribute("name", resultVO.getName());
			return "home";
		}
	}

	// id 찾기 페이지
	@RequestMapping(value = "/idFind", method = RequestMethod.POST)
	public String idFind(UserVO vo, HttpSession session, Model model) {

		UserVO result = service.idFind(vo);

		if (result == null) {
			return "/user/idFind";
		} else {
			model.addAttribute("id", result.getId());
			return "/user/idFindPage";
		}
	}

	// pw 찾기 페이지
	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public String pwFind(UserVO vo, HttpSession session, Model model) {

		UserVO result = service.pwFind(vo);

		if (result == null) {
			return "/user/pwFind";
		} else {
			session.setAttribute("vo", result);
			session.setAttribute("id", result.getId());
			session.setAttribute("pw", result.getPw());
			return "/user/pwFindPage";
		}
	}

	// 비밀번호 찾기 (새비밀번호 변경)
	@RequestMapping(value = "/pwFindChange", method = RequestMethod.POST)
	@ResponseBody
	public String pwFindChange(UserVO vo, HttpSession session) {

		UserVO UserVo = (UserVO) session.getAttribute("vo");
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		vo.setPw(vo.getPw());
		int VO = service.pwFindChange(vo);
		if (VO == 1) {
			session.invalidate();
			return "T";
		} else {
			return "F";
		}
	}

	// 로그아웃
	@PostMapping(value = "/logout", produces = "application/json;charset=UTF-8")
	public String logout(HttpSession session) {

		session.invalidate();
		return "user/login";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String pwModify(UserVO vo, HttpSession session) {

		UserVO UserVo = (UserVO) session.getAttribute("vo");
		String id = (String) session.getAttribute("id");
		
		vo.setId(id);
		vo.setPw(vo.getPw());
		
		int VO = service.myPwInfo(vo);
		
		if (VO == 1) {
			session.invalidate();
			return "user/login";
		} else {
			return "user/mypage";
		}
	}

	// email 변경
	@RequestMapping(value = "/modifyEmail", method = RequestMethod.POST)
	public String EmModify(UserVO vo, HttpSession session) {

		UserVO UserVo = (UserVO) session.getAttribute("vo");
		String id = (String) session.getAttribute("id");

		vo.setId(id);
		vo.setEmail(vo.getEmail());
		
		int VO = service.myEmInfo(vo);
		
		if (VO == 1) {
			session.invalidate();
			return "user/login";
		} else {
			return "user/mypage";
		}
	}

	// 전화번호 변경
	@RequestMapping(value = "/modifyPhone", method = RequestMethod.POST)
	public String PhModify(UserVO vo, HttpSession session) {

		UserVO UserVo = (UserVO) session.getAttribute("vo");
		String id = (String) session.getAttribute("id");

		vo.setId(id);
		vo.setPhone(vo.getPhone());

		int VO = service.myPhInfo(vo);
		if (VO == 1) {
			session.invalidate();
			return "user/login";
		} else {
			return "user/mypage";
		}
	}
}