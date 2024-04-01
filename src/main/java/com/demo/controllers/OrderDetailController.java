package com.demo.controllers;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.models.Account;
import com.demo.models.Ordersdetail;
import com.demo.services.AccountService;
import com.demo.services.CategoryService;
import com.demo.services.OrderDetailService;
import com.demo.services.ProductService;


@Controller
@RequestMapping({"orders"})
public class OrderDetailController {
	
	@Autowired
	private OrderDetailService ordersdetailDetailService;
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = {"index"} , method = RequestMethod.GET)
	public String index(HttpServletRequest request,ModelMap modelMap) {
		modelMap.put("orders",ordersdetailDetailService.findAll());
		return "admin/order/index";
	}
	

	

}
