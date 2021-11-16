package com.main.sheerhouse.admin.mapper;

import java.util.List;

import com.main.sheerhouse.admin.util.PagingVO;
import com.main.sheerhouse.user.domain.UserVO;

public interface AdminUserMapper {
	
	public List<UserVO> userListAll();
	
	
	
		// 게시물 총 갯수
	public int countBoard();

	public int countBoardKey(String result);
	// 페이징 처리 게시글 조회
	public List<UserVO> selectBoard(PagingVO vo);

	public List<UserVO> userResultList(String result);
	
	public List<UserVO> selectBoardList(PagingVO vo);
	
	public List<UserVO> selectHostListAll(PagingVO vo);
	
	public List<UserVO> selectHostWaitList(PagingVO vo);
	
	public int hostCountBoard();
	
	public int hostCountBoardKey();
	
	public void updateStopStatus(UserVO vo);
	
	public void updateCancleStatus(UserVO vo);
}
