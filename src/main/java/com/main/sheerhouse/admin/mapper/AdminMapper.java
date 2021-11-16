package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.domain.TermVO;
import com.main.sheerhouse.admin.util.PagingVO;

public interface AdminMapper {
	public List<NoticeVO> selectNotice(NoticeVO notice);
		
	public NoticeVO getNotice(int notice_seq);
	

}

