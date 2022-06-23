package com.team.dog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.dog.model.dto.DogDto;
import com.team.dog.model.mapper.DogMapper;

@Service
public class DogService {

   @Autowired
   private DogMapper dogMapper;
   
   public List<DogDto> selectList() {
      return dogMapper.selectList();
   }
   
   public List<DogDto> selectSearchList(String hospitalname){
      return dogMapper.selectSearchList(hospitalname);
   }
}