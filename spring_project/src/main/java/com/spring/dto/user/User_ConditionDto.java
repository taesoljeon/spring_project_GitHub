package com.spring.dto.user;

import lombok.Data;

@Data
public class User_ConditionDto {
	private int user_condition_code; // 상태코드 (1-활성화, 2-비활성화)
	private String user_condition; // 상태
}