package com.spring.app.repository.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.employee.domain.EmployeeVO;
import com.spring.app.repository.domain.FolderVO;
import com.spring.app.repository.domain.RepositoryVO;
import com.spring.app.repository.service.RepositoryService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/repository/*")
public class RepositoryController {
	
	@Autowired
	private RepositoryService service;
	
	@GetMapping("")
	public ModelAndView repository(ModelAndView mav) {
		
		mav.setViewName("mycontent/repository/repository");
		return mav;
	}
	
	// 자료실 조회하기
	@GetMapping("selectRepositoryList")
	@ResponseBody
	public List<RepositoryVO> selectRepositoryList(HttpSession session) {
		
		String loginEmpNo = ((EmployeeVO) session.getAttribute("loginuser")).getEmployeeNo();
		System.out.println(loginEmpNo);
		
		List<RepositoryVO> repositoryList = service.selectRepositoryList(loginEmpNo); // 전사/개인 자료실 두 개 조회
		System.out.println("repositoryList : " + repositoryList);
		
		return repositoryList;
	}
	
	
	

}
