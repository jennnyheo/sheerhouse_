package com.main.sheerhouse.admin.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.main.sheerhouse.admin.domain.BannerVO;
import com.main.sheerhouse.admin.mapper.AdminBannerMapper;
import com.main.sheerhouse.commons.AwsS3;

@Service("uploadService")
public class UploadServiceImpl implements UploadService {

	@Autowired
	private AdminBannerMapper mapper;
	
	//mySql DB에 올리는 메서드
	@Override
	public void insertUploadImg(BannerVO vo) {
		System.out.println("[Service] DB에 넣을 데이터 받고 insert 수행할 것");
		System.out.println("받은 값: " + vo.toString());
		mapper.insertUploadImg(vo);
		System.out.println("[Service] 값 잘 들어감");
	}

	//수동 시퀀스 (banner num count)
	@Override
	public int getBannerNum() {
		System.out.println("[Service] DB에 데이터 넣기 전에, banenr num 할거 조회하기");
		int result = mapper.getBannerNum();
		System.out.println("출력되는 값" + result);
		return result;
	}
	
	//S3서버 업로드 메서드
	public String uploadFile(MultipartHttpServletRequest request, int bannerNum, String url)
	{
		List<MultipartFile> fileList = request.getFiles("bannerImg"); //file 파라미터

		String uploadPath = "https://sheerhouse2.s3.ap-northeast-2.amazonaws.com/";
		String rst = "";
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String key = ""; //파일 경로 + 명
		String contentType=""; //파일 타입
		long contentLength=0l; //파일 크기
		
		int i = 1;
		
		for(MultipartFile mf : fileList) {
			
			try {
				
				InputStream is = mf.getInputStream();
				
				String originalFileName = mf.getOriginalFilename();
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				//s3 서버에 업로드 될 경로
				key = "banner/" + bannerNum + "/" + i + "." + ext;
				rst = uploadPath + key + " ";
				contentType = mf.getContentType();
				contentLength = mf.getSize();
				
				awsS3.upload(is, key, contentType, contentLength);
				
				BannerVO vo = new BannerVO();
				vo.setBannerNum(bannerNum);
				vo.setOriginalFileName(originalFileName);
				vo.setS3FileName(key);
				vo.setBannerUrl(url);
				
				mapper.insertUploadImg(vo);
				i++;
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		return "upload done";
	}

}
