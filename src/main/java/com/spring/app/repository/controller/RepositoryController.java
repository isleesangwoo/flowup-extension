package com.spring.app.repository.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.repository.service.RepositoryService;

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

}
