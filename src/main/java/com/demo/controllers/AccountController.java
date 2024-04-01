package com.demo.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.models.Account;
import com.demo.services.AccountService;
import com.demo.services.CategoryService;



@Controller
@RequestMapping({"account"})
public class AccountController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private AccountService accountService;

	@RequestMapping(value = {"index"} , method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("accounts",accountService.findAll());
		return "admin/account/index";
	} 

	@RequestMapping(value = {"add"} , method = RequestMethod.GET)
	public String add(ModelMap modelMap) {	
		Account account = new Account();
		account.setBirthday(new Date());
		account.setGender("male");
		modelMap.put("account", account);
		return "admin/account/add";
	}
	@RequestMapping(value = {"add"} , method = RequestMethod.POST)
	public String add(@ModelAttribute("account") Account account, RedirectAttributes redirectAttributes) {
		try {
			accountService.save(account);
			redirectAttributes.addFlashAttribute("msg","Success");
			return "redirect:/account/index";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","Fail");
			return "redirect:/account/add";
		}

	} 
	@RequestMapping(value = {"edit/{username}"} , method = RequestMethod.GET)
	public String edit(@PathVariable("username") String username, ModelMap modelMap) {	
		modelMap.put("account",accountService.findOne(username));
		return "admin/account/edit";
	}
	@RequestMapping(value = {"edit"} , method = RequestMethod.POST)
	public String edit(@ModelAttribute("account") Account account,RedirectAttributes redirectAttributes) {

		try {

			accountService.save(account);
			redirectAttributes.addFlashAttribute("msg","Success");
			return "redirect:/admin/account/index";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","Fail");
			return "redirect:/admin/account/edit/"+account.getUsername();
		}
	} 
	@RequestMapping(value = "delete/{username}" , method = RequestMethod.GET)
	public String delete(@PathVariable("username") String username,RedirectAttributes redirectAttributes) {
		try {
			accountService.delete(username);
			redirectAttributes.addFlashAttribute("msg","success");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","failed");
		}
		return "redirect:/account/index";
	}
	@RequestMapping(value = "login" , method = RequestMethod.GET)
	public String login() {	
		return "admin/account/login";
	}
	
	@RequestMapping(value = "login" , method = RequestMethod.POST)
	public String login(@RequestParam("username")String username, @RequestParam("password")String password,
			HttpSession session,RedirectAttributes redirectAttributes) {
		if(accountService.login(username, password)!=null) {
			session.setAttribute("username",username);
			return "redirect:/account/welcome";
		}else {
			redirectAttributes.addFlashAttribute("msg","Invalid");
			return "redirect:/account/login";
		}
		
	}
	@RequestMapping(value = "welcome" , method = RequestMethod.GET)
	public String welcome(ModelMap modelMap) {	
		modelMap.put("categorys",categoryService.findAll());
		return "admin/account/welcome";
	}
	
	
	

}
