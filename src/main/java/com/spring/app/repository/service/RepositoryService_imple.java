package com.spring.app.repository.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.repository.domain.FolderVO;
import com.spring.app.repository.domain.RepositoryVO;
import com.spring.app.repository.model.RepositoryDAO;

@Service
public class RepositoryService_imple implements RepositoryService {
	
	@Autowired
	private RepositoryDAO dao;

	@Override
	public List<RepositoryVO> selectRepositoryList(String loginEmpNo) {
		List<RepositoryVO> repositoryList = dao.selectRepositoryList(loginEmpNo);
		return repositoryList;
	}



}
