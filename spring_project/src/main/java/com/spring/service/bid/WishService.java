package com.spring.service.bid;

import java.util.List;

import com.spring.dto.bid.WishDto;
import com.spring.dto.bid.WishReadDto;

public interface WishService {
	public void wishCreate(WishDto dto) throws Exception;
	
	public List<WishReadDto> wishReadAll(String user_id);
	
	public int wishDelete(int wish_code);
	
	public Integer wishchk(WishDto dto);
	
	public List<Integer> wishsizechk(WishDto dto);
}
