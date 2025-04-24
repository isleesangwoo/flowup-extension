package com.spring.app.repository.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.app.repository.domain.FolderVO;
import com.spring.app.repository.domain.RepositoryVO;


@Mapper
public interface RepositoryDAO {

	List<RepositoryVO> selectRepositoryList(String loginEmpNo);



}
