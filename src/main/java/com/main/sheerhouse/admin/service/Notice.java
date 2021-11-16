package com.main.sheerhouse.admin.service;

import java.util.List;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.util.PagingVO;



public interface Notice {
	public List<NoticeVO> selectNotice(NoticeVO notice);
	
	public List<NoticeVO> selectNoticeIndex(NoticeVO vo);
	
	public void insertNotice(NoticeVO vo);
	
	public void updateNotice(NoticeVO vo);
	
	public NoticeVO getNotice(int notice_num);
	
	public List<NoticeVO> selectNoticePage(PagingVO vo);
	
	public int countNotice();
	
}
