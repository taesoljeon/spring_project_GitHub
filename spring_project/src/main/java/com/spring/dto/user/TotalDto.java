package com.spring.dto.user;

import lombok.Data;

@Data
public class TotalDto {
	private String product_brand; // 브랜드명
	private int product_total; // 총 금액
}