package com.spring.app.repository.service;

import java.util.List;

import com.spring.app.repository.domain.FolderVO;
import com.spring.app.repository.domain.RepositoryVO;

public interface RepositoryService {

	List<RepositoryVO> selectRepositoryList(String loginEmpNo);

}
