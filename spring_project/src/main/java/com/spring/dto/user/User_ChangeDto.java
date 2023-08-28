package com.spring.dto.user;

import lombok.Data;

@Data
public class User_ChangeDto {
	private String user_id; // 아이디
	private String user_correction_date; // 변경일자
}