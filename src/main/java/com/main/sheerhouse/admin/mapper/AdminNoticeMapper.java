package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.util.PagingVO;

public interface AdminNoticeMapper {
	
	public List<NoticeVO> selectNotice(NoticeVO vo);
	
	public List<NoticeVO> selectNoticeIndex(NoticeVO vo);
	
	public void insertNotice(NoticeVO vo);
	
	public void updateNotice(NoticeVO vo);
	
	public NoticeVO getNotice(int notice_seq);
	
	public List<NoticeVO> selectNoticePage(PagingVO vo);
	
	public int countNotice();

}
