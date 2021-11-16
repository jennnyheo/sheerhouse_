package com.main.sheerhouse.host.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.Request;
import com.main.sheerhouse.commons.AwsS3;
import com.main.sheerhouse.commons.CoolSmsAPI;
import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.host.domain.HostReservationInfoVO;
import com.main.sheerhouse.host.domain.HostVO;
import com.main.sheerhouse.host.domain.SettlementCalcVO;
import com.main.sheerhouse.host.domain.SettlementHistotyVO;
import com.main.sheerhouse.host.service.HostPageService;
import com.main.sheerhouse.host.service.HostRegistService;
import com.main.sheerhouse.user.domain.UserVO;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

@Controller
public class HostPageController {

	@Autowired
	private HostPageService service;

	@Autowired
	private HostRegistService regService;

	//임시 smsAPI 컨트롤러 추가
	@Autowired
	private CoolSmsAPI api;


	@GetMapping("/hostSms.host")
	public void test() {}

	@PostMapping("/hostSms.host")
	public @ResponseBody String testPost(String tel, Model model){

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





	@GetMapping("/hostPage.host")
	public String hostPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		HostVO host = regService.hostSelect(user.getEmail());
		List<HomeVO> homeList = service.selectHome(host);
		List<HostReservationInfoVO> resInfo = service.selectResInfo(host.getHost_seq());
		List<HostReservationInfoVO> hisInfo = service.selectHisInfo(host.getHost_seq());
		List<SettlementHistotyVO> setList = service.selectSetList("all", host.getHost_seq());
		SettlementCalcVO setCalc = service.setCalc(host.getHost_seq());
		SettlementCalcVO resCalc = service.resCalc(host.getHost_seq());
		String [][] res = resCalc.getChartData();
		String [][] set = setCalc.getChartData();
		for(int i=0; i<12;i++) {
			set[i+1][2] = res[i][2];
		}
		setCalc.setChartData(set);
		setCalc.setRes_total_count(resCalc.getRes_total_count());
		setCalc.setRes_failed_per(resCalc.getRes_failed_per());
		setCalc.setRes_paid_per(resCalc.getRes_paid_per());
		setCalc.setChartArray(Arrays.deepToString(setCalc.getChartData()));
		session.setAttribute("host", host);
		model.addAttribute("homeList", homeList);
		model.addAttribute("resInfo", resInfo);
		model.addAttribute("hisInfo", hisInfo);
		model.addAttribute("setList", setList);
		model.addAttribute("setCalc", setCalc);
		return "host/hostPage";
	}

	@PostMapping("/hostUpdate.host")
	public String hostUpdate(HostVO host, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();

		service.hostUpdate(host);
		List<HomeVO> homeList = service.selectHome(host);
		session.setAttribute("host", host);
		model.addAttribute("homeList", homeList);
		return "redirect:/hostPage.host";
	}

	@GetMapping("/hostSettingPage.host")
	public String hostSettingPage() {
		return "host/hostSettingPage";
	}

	@PostMapping("/uploadHostAccount.host")
	@ResponseBody
	public void uploadHostAccount(MultipartHttpServletRequest filedata, HttpServletRequest request) {
		System.out.println("진입");
		HttpSession session = request.getSession();
		HostVO host = (HostVO)session.getAttribute("host");

		MultipartFile img = filedata.getFile("img");

		System.out.println(img);
		System.out.println(img.toString());
		System.out.println(host.getEmail());

		AwsS3 awsS3 = AwsS3.getInstance();
		String contentType ="";
		long contentLength = 0L;
		String path ="";
		String urlPath = "";
		String account= "";
		try {
			String getKey = "account/" + host.getEmail();
			if(!host.getAccount_url().equals("")) {
				String[] url = host.getAccount_url().split("/");
				String imgName = url[url.length-1];
				String deleteKey = "account/" + host.getEmail() +"/"+ imgName;
				awsS3.delete(deleteKey);
			}

			InputStream is = img.getInputStream();
			String fileName = img.getOriginalFilename();
			path ="account/" + host.getEmail() + "/" + fileName;
			contentType = img.getContentType();
			contentLength = img.getSize();
			awsS3.upload(is, path, contentType, contentLength);

			urlPath = awsS3.getUrl(getKey, account);

		} catch (Exception e) {
			e.printStackTrace();
		}
		service.updateHostAccountUrl(urlPath, host.getHost_seq());
		host.setAccount_url(urlPath);
		session.setAttribute("host", host);
	}
	
	@GetMapping("/searchSetKeyword.host")
	@ResponseBody
	public List<SettlementHistotyVO> searchSetKeyword(String keyword, HttpServletRequest request) {
		HttpSession session = request.getSession();
		HostVO host = (HostVO)session.getAttribute("host");
		
		List<SettlementHistotyVO> result = new ArrayList<SettlementHistotyVO>();
		if(keyword.equals("all") || keyword.equals("")) {
			keyword = "all";
		}
		
		result = service.selectSetList(keyword, host.getHost_seq());
		return result;
	}

	@GetMapping("hostDateSetting.host")
	public String hostDateSetting(int home_seq,HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		HostVO host = (HostVO)session.getAttribute("host");
		HomeVO home = service.getHome(home_seq);
		model.addAttribute("home", home);
		
		return "host/hostDateSetting";
	}
	
	@PostMapping("/updateHome.host")
	public String updateHome(HomeVO home, HttpServletRequest request) {
		AwsS3 awsS3 = AwsS3.getInstance();
		HttpSession session = request.getSession();
		HostVO host = (HostVO)session.getAttribute("host");
		HomeVO selectHome = service.getHome(home.getHome_seq());
		System.out.println("변경될 숙소 정보: "+ home.toString());
		System.out.println("변경할 숙소 정보: " + selectHome.toString());
		String key = "home/"+ host.getEmail() + "/" + home.getTitle();
		//url값
		List<String> getList = awsS3.getUrl(key);
		
		selectHome.setTitle(home.getTitle());
		selectHome.setStatus(home.getStatus());
		selectHome.setType(home.getType());
		selectHome.setAddress(home.getAddress());
		selectHome.setPrice(home.getPrice());
		selectHome.setUrl(getList.toString());
		selectHome.setInfo(home.getInfo());
		String unused;
		if(selectHome.getUnused_date().equals("")) {
			unused = home.getUnused_date();
		}else {
			unused = selectHome.getUnused_date() +","+ home.getUnused_date();
		
		}
		selectHome.setUnused_date(unused);
		service.updateHome(selectHome);
		System.out.println("수정된 숙소 정보: "+ selectHome.toString());
		return "redirect:/hostPage.host";
	}
	
	@PostMapping("/updateHomeImg.host")
	public void fileSend(MultipartHttpServletRequest imgForm, HttpServletRequest request, String saveTitle, String title) {
		HttpSession session = request.getSession();
		HostVO host = (HostVO) session.getAttribute("host");
		List<MultipartFile> fileList = imgForm.getFiles("file");
		System.out.println();
		AwsS3 awsS3 = AwsS3.getInstance();
		String contentType ="";
		long contentLength = 0L;
		String path ="";
		
		for (MultipartFile file : fileList) {
			try {
				//삭제 먼저
				String selectKey = "home/" + host.getEmail() +"/"+ saveTitle;
				
				List<String> urlList = awsS3.getUrl(selectKey);
				String[] nameList = new String[urlList.size()];
				for(int i=0; i < urlList.size();i++) {
					String[] url = urlList.get(i).split("/");
			 		String fileName = url[url.length-1];
			 		nameList[i] = fileName;
				}
				
				for(int i=0; i < nameList.length; i++) {
					String deleteKey = selectKey +"/"+ nameList[i];
					awsS3.delete(deleteKey);
				}
				awsS3.delete(selectKey+"/");
				
				InputStream is = file.getInputStream();
				String fileName = file.getOriginalFilename();
				path ="home/" + host.getEmail() + "/" + title + "/" + fileName;
				contentType = file.getContentType();
				contentLength = file.getSize();
				awsS3.upload(is, path, contentType, contentLength);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}
	
}
