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

import com.demo.models.Account;
import com.demo.services.AccountService;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;


@Controller
@RequestMapping({"layout"})
public class HomeController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = {"home"} , method = RequestMethod.GET)
	public String index(HttpServletRequest request,ModelMap modelMap) {
		modelMap.put("categorys", categoryService.findAll());
		modelMap.put("products", productService.findbyFeatured(true));
		modelMap.put("featuredProducts", productService.findFeatured(true,6));
		modelMap.put("lastestProducts", productService.findLastest(4));
		request.setAttribute("p", "../home/index.jsp");
		
		return "user/layouts/user_layout";
	}
	@RequestMapping(value = {"about"} , method = RequestMethod.GET)
	public String index2(HttpServletRequest request,ModelMap modelMap) {
		modelMap.put("categorys", categoryService.findAll());
		request.setAttribute("p", "../about/index.jsp");
		
		return "user/layouts/user_layout";
	}

	@RequestMapping(value = {"specials"} , method = RequestMethod.GET)
	public String index4(HttpServletRequest request,ModelMap modelMap) {
		modelMap.put("categorys", categoryService.findAll());
		modelMap.put("products", productService.findbyFeatured(true));
		request.setAttribute("p", "../special/index.jsp");
		return "user/layouts/user_layout";	
//		List<Product> products=(List<Product>) productService.findbyFeatured(true);
//		PagedListHolder pagedListHolder=new PagedListHolder(products);
//		int page =ServletRequestUtils.getIntParameter(request, "p", 0);
//		pagedListHolder.setPage(page);
//		pagedListHolder.setPageSize(3);
//		modelMap.put("pagedListHolder", pagedListHolder);
	}
	@RequestMapping(value = {"myaccount"} , method = RequestMethod.GET)
	public String index5(HttpServletRequest request,ModelMap modelMap) {
		modelMap.put("categorys", categoryService.findAll());
		request.setAttribute("p", "../myaccount/index.jsp");
		
		return "user/layouts/user_layout";
	}
	@RequestMapping(value = {"myaccount"} , method = RequestMethod.POST)
	public String index6(@RequestParam("username")String username,@RequestParam("password")String password
			,HttpServletRequest request,ModelMap modelMap,HttpSession session) {
		 
		Account account= accountService.login(username, password);
		if(account == null) {
				modelMap.put("error", "Invalid");
				request.setAttribute("p", "../myaccount/index.jsp");
				return "user/layouts/user_layout";
		}else {
			session.setAttribute("username", username);
			return "redirect:/layout/welcome";
		}
		
	}
	@RequestMapping(value = {"register"} , method = RequestMethod.GET)
	public String register(HttpServletRequest request,ModelMap modelMap) {

		
		Account account = new Account();
		account.setBirthday(new Date());
		account.setGender("male");
		modelMap.put("account", account);
		modelMap.put("categorys", categoryService.findAll());
		request.setAttribute("p", "../register/index.jsp");
		return "user/layouts/user_layout";
	}
	@RequestMapping(value = {"register"} , method = RequestMethod.POST)
	public String register(@ModelAttribute("account") Account account,HttpServletRequest request,ModelMap modelMap) {
		accountService.save(account);
		return "redirect:/layout/myaccount";
	}
	@RequestMapping(value = {"category/{id}"} , method = RequestMethod.GET)
	public String index3(@PathVariable("id") int id,ModelMap modelMap,HttpServletRequest request) {
		modelMap.put("categorys", categoryService.findAll());
		modelMap.put("category", categoryService.find(id));
		request.setAttribute("p", "../category/index.jsp"); 	
		return "user/layouts/user_layout";
	}
	@RequestMapping(value = {"details/{id}"} , method = RequestMethod.GET)
	public String index7(@PathVariable("id") int id,HttpServletRequest request,ModelMap modelMap) {
		modelMap.put("categorys", categoryService.findAll());
		modelMap.put("product", productService.find(id));
		modelMap.put("products2", productService.findRelated(id));
		request.setAttribute("p", "../details/details.jsp");
		return "user/layouts/user_layout";
	}

	
	@RequestMapping(value = {"welcome"} , method = RequestMethod.GET)
	public String cart(HttpServletRequest request,ModelMap modelMap) {
		modelMap.put("categorys", categoryService.findAll());
		request.setAttribute("p", "../welcome/index.jsp");	
		return "user/layouts/user_layout";
	}
	
	@RequestMapping(value = {"logout"} , method = RequestMethod.GET)
	public String logout(HttpSession session,ModelMap modelMap) {
		modelMap.put("categorys", categoryService.findAll());
		session.removeAttribute("username");
		return "redirect:/layout/myaccount";
	}

}
