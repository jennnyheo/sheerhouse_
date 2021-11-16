package com.main.sheerhouse.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.List;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.main.sheerhouse.commons.CoolSmsAPI;
import com.main.sheerhouse.commons.ImportAPI;
import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.domain.TermVO;
import com.main.sheerhouse.admin.service.NoticeImpl;
import com.main.sheerhouse.admin.service.TermServiceImpl;
import com.main.sheerhouse.commons.Sha256;
import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.service.UserLoginService;

//濡쒓렇�씤, �쉶�썝媛��엯 �럹�씠吏�
@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService service;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	NoticeImpl noticeim;

	@Autowired
	private TermServiceImpl termim;

	//硫붿씤�럹�씠吏�
	@GetMapping("/index.do")
	public void index() {
		System.out.println("진입");
	}

	//留덉씠�럹�씠吏�
	/*
	 * @GetMapping("/mypage.do") public String mypage() { return "user/mypage"; }
	 */

	@PostMapping("/kakaoUserInfo.do")
	public String naverLoginAndRegist(UserVO user, HttpServletRequest request, HttpSession session) {
		if(user.getEmail() == null ) return "index"; 
		//�씠硫붿씪濡� �쉶�썝媛��엯 �뿬遺� 泥댄겕
		boolean check = service.emailCheck(user.getEmail());
		if(!check) { //以묐났 �씠硫붿씪�씠 �뾾�쑝硫� �쉶�썝媛��엯 �꽦怨�
			service.insertUser(user);
		}
		user = service.selectUserInfo(user);

		//�꽭�뀡�뿉 �쉶�썝�젙蹂� ���옣
		session = request.getSession();
		session.setAttribute("user", user);
		return "index";
	}



	@PostMapping("/facebookUserInfo.do")
	public String facebookLoginAndRegist(UserVO user,HttpServletRequest request, HttpSession session) {
		if(user.getEmail() == null ) return "index"; 
		//�씠硫붿씪濡� �쉶�썝媛��엯 �뿬遺� 泥댄겕
		boolean check = service.emailCheck(user.getEmail());

		if(!check) { //以묐났 �씠硫붿씪�씠 �뾾�쑝硫� �쉶�썝媛��엯 �꽦怨�
			service.insertUser(user);
		}
		user = service.selectUserInfo(user);

		//�꽭�뀡�뿉 �쉶�썝�젙蹂� ���옣
		session = request.getSession();
		session.setAttribute("user", user);

		return "index";
	}


	@PostMapping("/googleUserInfo.do")
	public String googleLoginAndRegist(UserVO user, HttpServletRequest request, HttpSession session) {
		if(user.getEmail() == null ) return "index"; 
		//�씠硫붿씪濡� �쉶�썝媛��엯 �뿬遺� 泥댄겕
		boolean check = service.emailCheck(user.getEmail());

		if(!check) { //以묐났 �씠硫붿씪�씠 �뾾�쑝硫� �쉶�썝媛��엯 �꽦怨�
			service.insertUser(user);
		}
		user = service.selectUserInfo(user);

		//�꽭�뀡�뿉 �쉶�썝�젙蹂� ���옣
		session = request.getSession();
		session.setAttribute("user", user);

		return "index";
	}

	@PostMapping("/sendEmail.do")
	public String emailSend(String email, String code) {
		final MimeMessagePreparator pre = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = 
						new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("sheerhouse25@gmail.com");
				helper.setTo(email);
				helper.setSubject("sheerhouse 인증번호");
				helper.setText("인증번호 : "+ code);
			}
		};
		mailSender.send(pre);

		return "forward:/index.do";
	}

	@PostMapping("/emailUserInfo.do")
	public String emailLoginAndRegist(UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		boolean emailCheck = service.emailCheck(user.getEmail());
		user.setPassword(Sha256.encrypt(user.getPassword()));

		if(!emailCheck) { //이메일이 없을경우
			user.setEmailConfirm(true);
			service.insertUser(user);
		}else {//이메일이 있을경우
			int status = service.getUserStatus(user.getEmail());
			boolean passwordCheck= service.passwordCheck(user);
			if(status == 2) {
				if(!passwordCheck) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('로그인에 실패하였습니다.');location.href='index.do'</script>");
					out.flush();
					return "index.do";
				}
				user = service.selectUserInfo(user);
				if(user.getRole().equals("host")) {
					service.updateStatus(user.getEmail());
					service.updateHostStatus(user.getEmail());
				}else if(user.getRole().equals("user")) {
					service.updateStatus(user.getEmail());
				}
				
				session = request.getSession();
				session.setAttribute("user", user);

				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('휴면계정입니다. 마이페이지에서 회원정보를 확인하고 수정해주세요.');location.href='mypage.do'</script>");
				out.flush();
				

			}else if(status == 3){
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('정지된 사용자입니다.');location.href='index.do';</script>");
				out.flush();
			}else { //일반 사용자
				if(!passwordCheck) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('로그인에 실패하였습니다.');location.href='index.do'</script>");
					out.flush();
					return "index.do";
				}
					user = service.selectUserInfo(user);

					session = request.getSession();
					session.setAttribute("user", user);
					return "redirect:/index.do";
					
			}
		}
		return "";
	}


	@PostMapping("/userLoginHeader.do")
	public String HeaderLogin(UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		boolean emailCheck = service.emailCheck(user.getEmail());
		user.setPassword(Sha256.encrypt(user.getPassword()));

		if(!emailCheck) { //이메일이 없을경우
			user.setEmailConfirm(true);
			service.insertUser(user);
		}else {//이메일이 있을경우
			int status = service.getUserStatus(user.getEmail());
			boolean passwordCheck= service.passwordCheck(user);
			if(status == 2) {
				if(!passwordCheck) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('로그인에 실패하였습니다.');location.href=document.referrer</script>");
					out.flush();
					return "index.do";
				}
				user = service.selectUserInfo(user);
				if(user.getRole().equals("host")) {
					service.updateStatus(user.getEmail());
					service.updateHostStatus(user.getEmail());
				}else if(user.getRole().equals("user")) {
					service.updateStatus(user.getEmail());
				}
				
				session = request.getSession();
				session.setAttribute("user", user);

				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('휴면계정입니다. 마이페이지에서 회원정보를 확인하고 수정해주세요.');location.href='mypage.do'</script>");
				out.flush();
				

			}else if(status == 3){
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('정지된 사용자입니다.');location.href=document.referrer;</script>");
				out.flush();
			}else { //일반 사용자
				if(!passwordCheck) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('로그인에 실패하였습니다.');location.href=document.referrer</script>");
					out.flush();
					return "index.do";
				}
					user = service.selectUserInfo(user);

					session = request.getSession();
					session.setAttribute("user", user);
					
					String referer = request.getHeader("Referer");
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('로그인 되었습니다.');location.href=document.referrer</script>");
					out.flush();				    
					return "";
					
			}
		}
		return "";
	}

	@RequestMapping("/searchEmail.do")
	public String searchEmail(UserVO user,  HttpServletResponse response)  throws IOException{
		boolean emailCheck = service.emailCheck(user.getEmail());
		//以묐났�씠硫붿씪怨� �긽�깭媛� 1�씪寃곗슦 true
		if(!emailCheck) { //以묐났 �씠硫붿씪 �뾾�쑝硫� �쉶�썝媛��엯 �꽦怨�
			int status = service.getUserStatus(user.getEmail()); //2, 3 諛섑솚
			if(status == 3) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('정지된 사용자입니다.');location.href='index.do'</script>");
				out.flush();
				return "index";
			}
		}
		String result = String.valueOf(emailCheck);

		return result;
	}

	@PostMapping("/passwordUpdate.do")
	public String passwordUpdate(UserVO user, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException{
		user.setPassword(Sha256.encrypt(user.getPassword()));
		boolean result = service.passwordUpdate(user);

		if(result) {
			user = service.selectUserInfo(user);
			session = request.getSession();
			session.setAttribute("user", user);
			return "redirect:/index.do";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('패스워드 변경에 실패하였습니다. 다시 시도해주세요.');location.href='index.do'</script>");
		out.flush();
		return "index";
	}

	@GetMapping("/logout.do")
	public void logout(HttpSession session,HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String path = (String)request.getHeader("referer");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('로그아웃 되었습니다.');location.href = 'index.do';</script>");
		out.close();
		session.invalidate();

	}

}	
