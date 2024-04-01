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

import com.demo.models.Category;
import com.demo.services.CategoryService;


@Controller
@RequestMapping({"category"})
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = {"index"} , method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("categorys",categoryService.findAll());
		return "admin/category/index";
	} 

	@RequestMapping(value = {"add"} , method = RequestMethod.GET)
	public String add(ModelMap modelMap) {	
		Category category = new Category();
		modelMap.put("category", category);
		return "admin/category/add";
	}
	@RequestMapping(value = {"add"} , method = RequestMethod.POST)
	public String add(@ModelAttribute("category") Category category, RedirectAttributes redirectAttributes) {
		try {
			categoryService.save(category);
			redirectAttributes.addFlashAttribute("msg","Success");
			return "redirect:/category/index";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","Fail");
			return "redirect:/category/add";
		}

	} 
	@RequestMapping(value = {"edit/{id}"} , method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {	
		modelMap.put("category",categoryService.find(id));
		return "admin/category/edit";
	}
	@RequestMapping(value = {"edit"} , method = RequestMethod.POST)
	public String edit(@ModelAttribute("category") Category category,RedirectAttributes redirectAttributes) {

		try {

			categoryService.save(category);
			redirectAttributes.addFlashAttribute("msg","Success");
			return "redirect:/category/index";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","Fail");
			return "redirect:/category/edit/"+category.getId();
		}
	} 
	@RequestMapping(value = "delete/{id}" , method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id,RedirectAttributes redirectAttributes) {
		try {
			categoryService.delete(id);
			redirectAttributes.addFlashAttribute("msg","success");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","failed");
		}
		return "redirect:/category/index";
	}

	

}
