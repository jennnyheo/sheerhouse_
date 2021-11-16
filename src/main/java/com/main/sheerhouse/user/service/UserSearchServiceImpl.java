package com.main.sheerhouse.user.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.sheerhouse.commons.StartDateBetweenEndDate;
import com.main.sheerhouse.host.domain.HomeVO;
import com.main.sheerhouse.user.domain.CommentVO;
import com.main.sheerhouse.user.domain.ResultVO;
import com.main.sheerhouse.user.domain.SearchVO;
import com.main.sheerhouse.user.mapper.UserSearchResultMapper;

@Service
public class UserSearchServiceImpl implements UserSearchService {

	@Autowired
	private UserSearchResultMapper mapper;

	@Override
	public HomeVO searchDetailList(String home_seq) {
		return mapper.getDetail(home_seq); 
	}

	@Override
	public List<HomeVO> searchResultList(SearchVO search) {

		List<HomeVO> resultList = mapper.getResult(search);
		List<HomeVO> homeList = new ArrayList<HomeVO>();
		List<String> date = StartDateBetweenEndDate.getStartAndEnd(search.getCheckin(), search.getCheckout());
		for(HomeVO home : resultList) {
			if(date == null) { //체크인아웃 날짜가 지정되지 않은경우
				homeList.add(home);
			}else if(home.getUnused_date().equals("")){ //사용불가 날짜가 지정되지 않은경우
				homeList.add(home);
			}else {
				String[] unused = home.getUnused_date().split(",");
				List<String> ud = new ArrayList<String>(Arrays.asList(unused));
				boolean check = true;
				for(String d : date) {
					if(ud.contains(d)) {
						check = false;
						break;
					}
				}
				if(check) {
					homeList.add(home);
				}
			}
		}
		return homeList;
	}


	@Override
	public List<CommentVO> getCommentList(String home_seq) {
		return mapper.getComment(home_seq);
	}

	@Override
	public String searchHostEmail(String home_seq) {
		return mapper.searchHostEmail(home_seq);
	}

	
	
	

}
