package com.spring.dto.user;

import lombok.Data;

@Data
public class User_BankDto {
	private String user_id; // 아이디
	private String user_bank; // 은행
	private String user_account_number; // 계좌번호
}