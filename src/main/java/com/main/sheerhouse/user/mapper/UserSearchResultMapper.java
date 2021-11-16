package com.main.sheerhouse.user.mapper;

import java.util.List;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;

public interface UserSearchResultMapper {

	public List<HomeVO> getResult(SearchVO search);
	
	public HomeVO getDetail(String home_seq);
	
	public List<CommentVO> getComment(String home_seq);
	
	public String searchHostEmail(String home_seq);
}
