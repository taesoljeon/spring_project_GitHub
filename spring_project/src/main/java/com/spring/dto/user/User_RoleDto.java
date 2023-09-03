package com.spring.dto.user;

import lombok.Data;

@Data
public class User_RoleDto {
	private int user_role_code; // 권한코드 (1-메인관리자, 2-유저, 3-서브관리자)
	private String user_role; // 권한
}