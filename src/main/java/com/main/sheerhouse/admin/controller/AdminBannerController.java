package com.main.sheerhouse.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.main.sheerhouse.admin.domain.BannerVO;
import com.main.sheerhouse.admin.service.AdminBannerService;
import com.main.sheerhouse.admin.service.BannerUpdateService;
import com.main.sheerhouse.admin.service.UploadService;

@Controller
public class AdminBannerController {

	@Autowired
	private AdminBannerService adminBannerServiceImpl;
	
	@Autowired
	private UploadService uploadService;
	
	@Autowired
	private BannerUpdateService updateService;
	
	@GetMapping(value="/bannerControl.mdo")
	public String showForm(Model model)
	{
		System.out.println("[Controller] Banner Controller GET방식으로 호출");
		
//		List<BannerVO> list = banenrService.getBannerList(); ///DAO 나 Service ///
		List<BannerVO> list = adminBannerServiceImpl.getBannerList();
		model.addAttribute("bannerList", list);
		
		return "admin/tables/bannerControl";
	}
	
	@PostMapping(value="/uploadBannerImg.mdo")
	public String uploadBanner(MultipartHttpServletRequest mtfRequest, HttpServletRequest request)
	{
		int bannerNum = uploadService.getBannerNum();
		String url = request.getParameter("url");
		
		System.out.println("setting 할 번호: " + bannerNum);
		System.out.println("기재한 url " + url);
		
		
		uploadService.uploadFile(mtfRequest, bannerNum, url); //uploadFile 안에서 insertUploadImg 까지 처리
		
		return "redirect:bannerControl.mdo";
	}
	
	//배너 공개 페이지 호출
	@GetMapping(value="/applyBanner.mdo")
	public String ableBanner()
	{
		return "applyBanner";
	}
	
	//배너 공개 처리
	@PostMapping(value="/applyBanner.mdo")
	public String openBanner(@RequestParam("sendBannerName") String bannerNum)
	{
		System.out.println("[Controller] 배너 상태 : 공개로 전환");
		updateService.ableBanner(bannerNum);
		System.out.println("정상 처리되었습니다.");
		
		return "redirect:bannerControl.mdo";
	}
	
	//배너 비공개 페이지 호출
	@GetMapping(value="/nonapplyBanner.mdo")
	public String disableBanner()
	{
		return "nonapplyBanner";
	}
	
	//배너 비공개 처리
	@PostMapping(value="/nonapplyBanner.mdo")
	public String sendCoupon(@RequestParam("disableBannerName") String bannerNum)
	{
		System.out.println("[Controller] 비공개로 전환");
		updateService.disableBanner(bannerNum);
		System.out.println("정상 처리되었습니다.");
		
		return "redirect:bannerControl.mdo";
	}
	
}
