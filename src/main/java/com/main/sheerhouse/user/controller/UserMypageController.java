package com.main.sheerhouse.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.sheerhouse.commons.CoolSmsAPI;
import com.main.sheerhouse.commons.Sha256;
import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.PayInfoVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.domain.WishListVO;
import com.main.sheerhouse.user.mapper.UserSearchResultMapper;
import com.main.sheerhouse.user.service.UserMypageService;
import com.main.sheerhouse.user.service.UserSearchService;

@Controller
public class UserMypageController {

	@Autowired
	private CoolSmsAPI api;
	
	@Autowired
	private UserMypageService service;
	
	@Autowired
	private UserSearchService userService;
	
	@Autowired
	private UserSearchResultMapper resultMapper;
	
	@GetMapping("/mypage.do")
	public String showWishlist(WishListVO wish, ResultVO result, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		session.setAttribute("user", user);
		System.out.println(wish);
		String email = user.getEmail();
		System.out.println(email);
		model.addAttribute("wishList", service.showWishLists(email));
		System.out.println("wishList" + service.showWishLists(email));
		model.addAttribute("reservationlist", service.showReservationInfo(email));
		System.out.println("reservation" + service.showReservationInfo(email));
		model.addAttribute("payList", service.selectPayInfo(email));
		System.out.println("payList: "+service.selectPayInfo(email));
			return "user/mypage";
		}
	
	
	
	
	
	@RequestMapping("/mypageBookingInfo.do")
	public String showBookingDetail(Model model, ResultVO result, @RequestParam("home_seq") String home_seq ,@RequestParam("apply_num") int apply_num){
		
		model.addAttribute("bookingDetail",service.reservationDetail(apply_num));
		model.addAttribute("hostEmail", userService.searchHostEmail(home_seq));
		System.out.println("show detail reservation " +service.reservationDetail(apply_num));
		System.out.println(userService.searchHostEmail(home_seq));
		return "user/mypageBookingDetail";
	}
	
	@RequestMapping("/mypageReview.do")
	public String showandWriteReview(HttpServletRequest request, Model model, ResultVO result, @RequestParam("home_seq") String home_seq ,@RequestParam("apply_num") int apply_num){
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		session.setAttribute("user", user);
		
		model.addAttribute("bookingDetail",service.reservationDetail(apply_num));
		model.addAttribute("hostEmail", userService.searchHostEmail(home_seq));
		model.addAttribute("CommentInfo", resultMapper.getComment(home_seq));
		
		System.out.println("show detail reservation " +service.reservationDetail(apply_num));
		System.out.println(userService.searchHostEmail(home_seq));
		System.out.println("CommentInfo" + resultMapper.getComment(home_seq)); 	
		return "user/mypageReview";
	}

	

	@PostMapping("/mypageReviewInsert.do")
	public String insertReview(CommentVO comment) {
		String result = service.insertComment(comment);
		return result;
	}
	
	@RequestMapping("/mypageReviewDelete.do")
	public String deleteReview(CommentVO comment) {
		String result = service.deleteComment(comment);
		return result;
	}
	
	@PostMapping("/sendSms.do")
	public @ResponseBody String sendSms(String tel, Model model){

		String result = "";
		String confirmNumber = "";
		Random rand = new Random();
		for(int i=0; i<6; i++) {
			String random = Integer.toString(rand.nextInt(10));
			confirmNumber+=random;
		}

		api.certifiedSMS(tel, confirmNumber);

		result = confirmNumber;

		return result;
	}
	
	@GetMapping("/userRoleSet.do")
	public String setRole(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		//유저의 role 확인후 호스트일땐 host의 status도 2로 변경한다.
		
		if(user.getRole().equals("host")) {
			service.setStatus(user.getEmail());
			service.setHostStatus(user.getEmail());
		}else if(user.getRole().equals("user")) {
			service.setStatus(user.getEmail());
		}
		session.invalidate();
		
		return"redirect:/index.do";
	}

	@GetMapping("/searchSetKeyword.do")
	@ResponseBody
	public List<PayInfoVO> searchSetKeyword(String keyword, HttpServletRequest request){
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("키워드값: "+ keyword);
		System.out.println("email"+ user.getEmail());
		List<PayInfoVO> result = service.selectKeyPayInfo(keyword, user.getEmail());
		
		if(keyword.equals("all") || keyword.equals("")) {
			keyword = "all";
		}
		System.out.println("검색결과: "+result.toString());
		return result;
	}
	
	@PostMapping("/refundApply.do")
	public String refundApply(int apply_num, String cancel_reason) {
		System.out.println(apply_num);
		System.out.println(cancel_reason);
		
		service.refundApply(apply_num, cancel_reason);
		service.deleteSettlement(apply_num);
		
		return "redirect:/mypage.do";
	}
	
	//이름, 비밀번호, 이메일, 생년월일, 전화번호
	@PostMapping("/updateUser.do")
	public String updateUser(UserVO user, HttpServletResponse response, HttpServletRequest request) throws IOException {
		System.out.println(user.toString());
		user.setPassword(Sha256.encrypt(user.getPassword()));
		boolean passCheck = service.passwordCheck(user);
		
		if(passCheck) {
			service.userUpdate(user);
		}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('회원정보 변경에 실패하였습니다.');location.href='mypage.do'</script>");
				out.flush();
				return "mypage.do";
		}
		
		HttpSession session = request.getSession();
		UserVO updateUser = service.selectUserInfo(user);
		session.setAttribute("user", updateUser);
		
		return "redirect:/mypage.do";
	}
}