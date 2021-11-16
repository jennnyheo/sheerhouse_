package com.main.sheerhouse.user.service;

import java.util.List;

import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;

public interface UserSearchService {
	
	List<HomeVO> searchResultList(SearchVO search);
	HomeVO searchDetailList(String home_seq);
	String searchHostEmail(String home_seq);
	List<CommentVO> getCommentList(String home_seq);
}
