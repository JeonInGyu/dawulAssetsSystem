package com.assets.service;

import com.assets.domain.LoginVO;

public interface LoginService {
	
	// 로그인
	public LoginVO login(LoginVO vo) throws Exception;
}
