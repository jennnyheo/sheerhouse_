package com.main.sheerhouse.host.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.service.HostRegistService;
import com.main.sheerhouse.user.domain.UserVO;

@Controller
public class HostController {
	
	@Autowired
	private HostRegistService service;
	
	@GetMapping("/homes.host")
	public String homes() {
		return "host/host";
	}
	
	@GetMapping("/hostRegulation.host")
	public String regulation() {
		return "host/hostRegulation";
	}

	@GetMapping("/register.host")
	public String register() {
		return "host/hostregister";
	}
	
	@GetMapping("/dateset.host")
	public String setDate() {
		return "host/hostDateSetting";
	}
}
