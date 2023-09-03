package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.dto.noticeboard.NoticeboardVO;

public interface NoticeboardService {

	public List<NoticeboardVO> test_readAll();
	
	public List<NoticeboardVO> notice_readAll(Map<String, Object> para);
	public int		listcnt();

	public NoticeboardVO noticeboard_read(int noticeboard_code) ;
	public int noticeboard_insert(NoticeboardVO vo);
	public int noticeboard_update(NoticeboardVO vo);
	public int noticeboard_delete(NoticeboardVO vo);
	
}
