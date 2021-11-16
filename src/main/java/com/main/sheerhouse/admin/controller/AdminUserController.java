package com.main.sheerhouse.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.sheerhouse.admin.service.AdminUserService;
import com.main.sheerhouse.admin.util.PagingVO;
import com.main.sheerhouse.user.domain.UserVO;

@Controller
public class AdminUserController {
	
	@Autowired
	private  AdminUserService adminUserServiceImpl;
	
	@GetMapping("/userTable.mdo")
	public String userTable(Model model){
		List<UserVO> userList = new ArrayList<UserVO>();
		userList = adminUserServiceImpl.userListAll();
		model.addAttribute("userList", userList);		
		return "admin/tables/userTable";
	}
/*	
	@GetMapping("/hostTable.mdo")
	public String hostTable(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value = "result", required = false)String result) {
		
		List<UserVO> hostList = new ArrayList<UserVO>();
					
			int total = adminUserServiceImpl.hostCountBoard();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), result);
			model.addAttribute("paging", vo);
			model.addAttribute("hostList", adminUserServiceImpl.selectHostListAll(vo));
			
			System.out.println("컨트롤러" +adminUserServiceImpl.selectHostListAll(vo));
		
		return "admin/tables/hostTable";
	}
*/
	
	@RequestMapping(value="userCheckResult.mdo", method=RequestMethod.GET)
	@ResponseBody
	public String updateStopStatus(UserVO vo, Model model,
			@RequestParam String emailList, @RequestParam String flag) {
			String[] emails = emailList.split(",");
			UserVO emailVO = null;
			if(flag.equals("stop")) {
				for(String t : emails) {
					System.out.println(t);
					emailVO = new UserVO();
					emailVO.setEmail(t);
					adminUserServiceImpl.updateStopStatus(emailVO);
				}

			}else {
				for(String t : emails) {
					System.out.println(t);
					emailVO = new UserVO();
					emailVO.setEmail(t);
					adminUserServiceImpl.updateCancleStatus(emailVO);
				}
			}
			
			
	
		
		return "redirect:/userTable.mdo";
	}
	

/*	
	@GetMapping("/userResultTable.mdo")
	public String userResultTable(Model model, String result) {
		List<UserVO> userList = new ArrayList<UserVO>();
		userList = service.userResultList(result);
		model.addAttribute("userList", userList);
		return "admin/tables/userTable";
	}
*/
}
