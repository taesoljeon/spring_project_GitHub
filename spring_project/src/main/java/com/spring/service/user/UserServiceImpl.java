package com.spring.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.user.UserDao;
import com.spring.dto.user.TotalDto;
import com.spring.dto.user.UserDto;
import com.spring.dto.user.User_BankDto;
import com.spring.dto.user.sns_infoDto;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired UserDao dao;

	//태솔 추가
	
	@Override
	public Integer sns_getNaver_code(String sns_id) { 
		return dao.sns_getNaver_code(sns_id);
	}
	@Override
	public Integer user_getNaver_code(int sns_naver_code) {
		return dao.user_getNaver_code(sns_naver_code);
	}
	
	@Override
	public int sns_infoInsert(sns_infoDto dto) {
		
		return dao.sns_infoInsert(dto);
	}
	@Override
	public int user_insert_naver(UserDto dto) {
		return dao.user_insert_naver(dto);
	}
	@Override
	public String user_getID(int user_naver_code) {
		
		return dao.user_getID(user_naver_code);
	}
	//
	
	
	@Override public int user_insert(UserDto dto) { // 회원가입 (유저)
		return dao.user_insert(dto);
	}
	
	@Override public int user_insert_kakao(UserDto dto) { // 회원가입 (유저)
		return dao.user_insert_kakao(dto);
	}

	@Override public int user_bank_insert(User_BankDto dto) { // 회원가입 (유저)
		return dao.user_bank_insert(dto);
	}

	@Override public String user_id_check_ajax(String id) { // 아이디 중복 검사 (ajax)
		return dao.user_id_check_ajax(id);
	}

	@Override public String user_telephone_check_ajax(String telephone) { // 휴대폰번호 중복 검사 (ajax)
		return dao.user_telephone_check_ajax(telephone);
	}

	@Override public UserDto user_find_id(UserDto dto) { // 아이디 찾기
		return dao.user_find_id(dto);
	}

	@Override public UserDto user_find_password(UserDto dto) { // 비밀번호 찾기
		return dao.user_find_password(dto);
	}

	@Override public UserDto user_mydetail(String id) { // 내 정보 조회 / 해당 정보 상세보기
		return dao.user_mydetail(id);
	}

	@Override public int user_change_password(UserDto dto) { // 비밀번호 변경
		return dao.user_change_password(dto);
	}

	@Override public int user_change_name(UserDto dto) { // 이름 변경
		return dao.user_change_name(dto);
	}

	@Override public int user_change_telephone(UserDto dto) { // 휴대폰번호 변경
		return dao.user_change_telephone(dto);
	}

	@Override public int user_change_address(UserDto dto) { // 주소 변경
		return dao.user_change_address(dto);
	}

	@Override public int user_change_bank(User_BankDto dto) { // 주소 변경
		return dao.user_change_bank(dto);
	}

	@Override public int user_delete_user(UserDto dto) { // 회원 탈퇴 (비활성화)
		return dao.user_delete_user(dto);
	}

	@Override public int user_yes_user(UserDto dto) { // 관리자, 회원 활성화 변경
		return dao.user_yes_user(dto);
	}

	@Override public int user_no_user(UserDto dto) { // 관리자, 회원 비활성화 변경
		return dao.user_no_user(dto);
	}
	
	@Override public int user_insert_sub(UserDto dto) { // 서브관리자 등록
		return dao.user_insert_sub(dto);
	}

	@Override public List<UserDto> user_read_admin(Map<String, Integer> para) { // 관리자 관리 (등급순) - paging
		return dao.user_read_admin(para);
	}

	@Override public List<UserDto> user_read_admin_id_ajax(Map<String, Integer> para) { // 관리자 관리 (아이디순) ajax // 관리자 관리 - paging
		return dao.user_read_admin_id_ajax(para);
	}

	@Override public List<UserDto> user_read_admin_name_ajax(Map<String, Integer> para) { // 관리자 관리 (이름순) ajax // 관리자 관리 - paging
		return dao.user_read_admin_name_ajax(para);
	}
	
	@Override public int admin_listcnt() { // 어드민 전용 페이징
		return dao.admin_listcnt();
	}

	@Override public List<UserDto> user_read_user(Map<String, Integer> para) { // 회원 관리 (생성일자순) - paging
		return dao.user_read_user(para);
	}

	@Override public List<UserDto> user_read_user_id_ajax(Map<String, Integer> para) { // 회원 관리 (아이디순) ajax - paging
		return dao.user_read_user_id_ajax(para);
	}

	@Override public List<UserDto> user_read_user_name_ajax(Map<String, Integer> para) { // 회원 관리 (이름순) ajax - paging
		return dao.user_read_user_name_ajax(para);
	}
	
	@Override public int user_listcnt() { // 어드민 전용 페이징
		return dao.user_listcnt();
	}	
	
	@Override public UserDto user_login(UserDto dto) { // 로그인 (일반)
		return dao.user_login(dto);
	}
	
	@Override public UserDto user_login_kakao(UserDto dto) { // 로그인 (카카오)
		return dao.user_login_kakao(dto);
	}

	@Override public int user_delete_user_out(UserDto dto) { // 회원 및 관리자 삭제
		return dao.user_delete_user_out(dto);
	}

	@Override
	public int role_check(String check) { // 컨트롤러 - 등급 체크
		return dao.role_check(check);
	}

	@Override
	public int condition_check(String check) { // 컨트롤러 - 등급 체크
		return dao.condition_check(check);
	}
	
	@Override public List<TotalDto> total_check() { // 매출 현황 { // 매출 현황
		return dao.total_check();
	}

		
}