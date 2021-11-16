package com.main.sheerhouse.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.admin.domain.NoticeVO;
import com.main.sheerhouse.admin.mapper.AdminMapper;
import com.main.sheerhouse.admin.util.PagingVO;
import com.main.sheerhouse.admin.mapper.AdminNoticeMapper;

@Service
@Repository
public class NoticeImpl implements Notice{
	@Autowired
	AdminNoticeMapper mapper;
		
	@Override
	public List<NoticeVO> selectNotice(NoticeVO notice){
		List<NoticeVO> list = null;
		list= mapper.selectNotice(notice);
		System.out.println(list);
		return list;
	}
	
	@Override
	public List<NoticeVO> selectNoticeIndex(NoticeVO vo){
		List<NoticeVO> list = mapper.selectNoticeIndex(vo);
		return list;
	}
	
	@Override
	public void insertNotice(NoticeVO vo) {
		mapper.insertNotice(vo);
	}
	
	@Override
	public void updateNotice(NoticeVO vo) {
		System.out.println("업데이트 서비스 진입");
		mapper.updateNotice(vo);
	}

	@Override
	public NoticeVO getNotice(int notice_num) {
		return mapper.getNotice(notice_num);
	}
	

	@Override
	public List<NoticeVO> selectNoticePage(PagingVO vo){
		return mapper.selectNoticePage(vo);
	}
	
	@Override
	public int countNotice() {
		return mapper.countNotice();
	}

}

