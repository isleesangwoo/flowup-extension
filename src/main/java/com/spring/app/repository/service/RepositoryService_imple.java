package com.spring.app.repository.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.repository.model.RepositoryDAO;

@Service
public class RepositoryService_imple implements RepositoryService {
	
	@Autowired
	private RepositoryDAO dao;

	@Override
	public int totaltest() {
		int total = dao.totaltest();
		return total;
	}

}
