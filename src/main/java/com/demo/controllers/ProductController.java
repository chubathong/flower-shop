package com.demo.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Parameter;
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

import com.demo.models.Category;
import com.demo.models.Product;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;
import com.demo.services.ProductService;

@Controller
@RequestMapping({"product"})
public class ProductController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService ProductService;
	

	@RequestMapping(value = {"index"} , method = RequestMethod.GET)
	public String index(ModelMap modelMap,@Param("keyword") String keyword) {
		modelMap.put("products",ProductService.findAll());
//		modelMap.put("products",ProductService.search(keyword));
		return "/admin/product/index";
	} 

	@RequestMapping(value = {"add"} , method = RequestMethod.GET)
	public String add(ModelMap modelMap) {	
		Product product = new Product();
		modelMap.put("product", product);
		modelMap.put("categorys",categoryService.findAll());
		return "/admin/product/add";
	}
	@RequestMapping(value = {"add"} , method = RequestMethod.POST)
	public String add(@ModelAttribute("product") Product product, RedirectAttributes redirectAttributes) {
		try {
			Category category=new Category();
			category.setId(7);
			product.setCategory(category);
			product.setCreated(new Date());
			product.setStatus(true);
			ProductService.save(product);
			redirectAttributes.addFlashAttribute("msg","Success");
			return "redirect:/product/index";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","Fail");
			return "redirect:/product/add";
		}

	} 
	@RequestMapping(value = {"edit/{id}"} , method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {	
		modelMap.put("categorys",categoryService.findAll());
		modelMap.put("product",ProductService.find(id));
		return "admin/product/edit";
	}
	@RequestMapping(value = {"edit"} , method = RequestMethod.POST)
	public String edit(@ModelAttribute("product") Product product,RedirectAttributes redirectAttributes) {

		try {
			Category category=new Category();
			product.setCreated(new Date());
			ProductService.save(product);
			redirectAttributes.addFlashAttribute("msg","Success");
			return "redirect:/product/index";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","Fail");
			return "redirect:/product/edit/"+product.getId();
		}
	} 
	@RequestMapping(value = "delete/{id}" , method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id,RedirectAttributes redirectAttributes) {
		try {
			ProductService.delete(id);
			redirectAttributes.addFlashAttribute("msg","success");
		} catch (Exception e) {
			System.out.println("error: " + e);
			redirectAttributes.addFlashAttribute("msg","failed");
		}
		return "redirect:/product/index";
	}
	


	

}
