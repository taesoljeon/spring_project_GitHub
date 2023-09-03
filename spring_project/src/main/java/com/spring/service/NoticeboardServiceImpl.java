package com.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.noticeboard.NoticeboardDao;
import com.spring.dto.noticeboard.NoticeboardVO;

@Transactional
@Service
public class NoticeboardServiceImpl implements NoticeboardService {

	@Autowired NoticeboardDao dao;
	
	@Override
	public List<NoticeboardVO> notice_readAll(Map<String, Object> para) {
		return dao.notice_readAll(para);
	}

	@Override
	public int listcnt() {
		return dao.listcnt();
	}

	@Override
	public NoticeboardVO noticeboard_read(int noticeboard_code) {
		return dao.noticeboard_read(noticeboard_code);
	}

	@Override
	public int noticeboard_insert(NoticeboardVO vo) {
		
		return dao.noticeboard_insert(vo);
	}

	@Override
	public int noticeboard_update(NoticeboardVO vo) {
		
		return dao.noticeboard_update(vo);
	}

	@Override
	public int noticeboard_delete(NoticeboardVO vo) {
		
		return dao.noticeboard_delete(vo);
	}

	@Override
	public List<NoticeboardVO> test_readAll() {
		
		return dao.test_readAll();
	}

}
