package com.spring.dao.bid;

import java.util.List;

import com.spring.dto.bid.WishDto;
import com.spring.dto.bid.WishReadDto;

public interface Wish {
	
	public int wishCreate(WishDto dto);
	
	public List<WishReadDto> wishReadAll(String user_id);
	
	public int wishDelete(int wish_code);
	
	public List<Integer> wishsizechk(WishDto dto);
	
	public Integer wishchk(WishDto dto);
	
}