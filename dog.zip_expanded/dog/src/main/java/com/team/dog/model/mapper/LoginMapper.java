package com.team.dog.model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.team.dog.model.dto.LoginDto;

@Mapper
public interface LoginMapper {

	@Insert(" insert into login values(null, #{id}, #{name}, #{pw}, #{email}, #{phone} ) ")
	int register(LoginDto dto);

	@Select(" select * from login where id=#{id} and pw=#{pw}  ")
	LoginDto loginchk(LoginDto dto);

}
