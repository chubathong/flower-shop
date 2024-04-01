package com.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.services.ProductService;

@Controller
@RequestMapping({"admin",""})
public class AdminController {
	
	@Autowired
	private ProductService ProductService;

	@RequestMapping(value = {"index",""} , method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products",ProductService.findAll());
		return "admin/index";
	} 



}
