package com.assets.dao;

import com.assets.domain.LoginVO;

public interface LoginDAO {
	
	// 로그인
	public LoginVO login(LoginVO vo) throws Exception;
}
