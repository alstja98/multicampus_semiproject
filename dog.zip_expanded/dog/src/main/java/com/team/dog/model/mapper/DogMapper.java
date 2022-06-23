package com.team.dog.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.team.dog.model.dto.DogDto;

@Mapper
public interface DogMapper {

   @Select(" SELECT * FROM DOG ")
   List<DogDto> selectList();
   
   @Select(" SELECT * FROM DOG WHERE NAME LIKE CONCAT('%', #{hospitalname}, '%')  ")
   List<DogDto> selectSearchList(String hospitalname);
}