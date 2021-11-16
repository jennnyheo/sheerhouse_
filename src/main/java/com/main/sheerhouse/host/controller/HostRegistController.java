package com.main.sheerhouse.host.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.main.sheerhouse.commons.AwsS3;
import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.service.HostRegistServiceImpl;
import com.main.sheerhouse.user.domain.UserVO;

@Controller
public class HostRegistController {

	@Autowired
	private HostRegistServiceImpl service;
	
	@PostMapping("/fileSend.host")
	public void fileSend(MultipartHttpServletRequest imgForm, HttpServletRequest request, String title) {
		System.out.println("진입");
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		List<MultipartFile> fileList = imgForm.getFiles("file");
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String contentType ="";
		long contentLength = 0L;
		String path ="";
		
		for (MultipartFile file : fileList) {
			try {
				InputStream is = file.getInputStream();
				String fileName = file.getOriginalFilename();
				path ="home/" + user.getEmail() + "/" + title + "/" + fileName;
				contentType = file.getContentType();
				contentLength = file.getSize();
				awsS3.upload(is, path, contentType, contentLength);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}
	@PostMapping("/homeRegist.host")
	public String homeRegist(HomeVO home, HttpServletRequest request) {
		System.out.println("숙소");
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		AwsS3 awsS3 = AwsS3.getInstance();
		
		String key = "home/"+ user.getEmail() + "/" + home.getTitle();
		List<String> getList = awsS3.getUrl(key);
		
		home.setUrl(getList.toString());
		//home.setHost(user.getEmail());
		user.setRole("host");
		
		boolean result = service.hostCheck(user.getEmail());
		System.out.println(result);
		if(!result) {
			service.userRoleSet(user);
			service.hostRegist(user);
			
		}
		service.homeRegist(home, user.getEmail());
		HostVO host = service.hostSelect(user.getEmail());
		session.setAttribute("host", host);
		
		return "redirect:/hostPage.host";
	}
	
}
