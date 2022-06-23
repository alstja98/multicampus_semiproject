package com.team.dog.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dog.model.dto.LoginDto;
import com.team.dog.model.mapper.LoginMapper;

@Service
public class LoginService {
	@Autowired
	private LoginMapper loginMapper;
	
	public int register(LoginDto dto) {
		return loginMapper.register(dto);
	}
	
	public LoginDto loginchk(LoginDto dto) {
		return loginMapper.loginchk(dto);
	}
}
