package com.spring.dao.sell;

import java.util.List;
import java.util.Map;

import com.spring.dto.sell.SellVO;

public interface SellDao {
	
	/* public List<SellVO> sell_readAll(SellVO vo, Map<String, Integer> para); */
	public List<SellVO> sell_readAll(Map<String, Object> para);
	public  int          listcnt();
	// detail 테이블에서 출력되는 list가 있음
	public SellVO sell_read(SellVO vo);
	public int sell_insert(SellVO vo);
	public int sell_update(SellVO vo);
	public int sell_delete(SellVO vo);
	
}
