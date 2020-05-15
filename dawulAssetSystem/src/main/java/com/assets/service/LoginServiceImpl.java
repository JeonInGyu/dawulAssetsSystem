package com.assets.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.assets.dao.LoginDAO;
import com.assets.domain.LoginVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO dao;
	
	@Override
	public LoginVO login(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

}
