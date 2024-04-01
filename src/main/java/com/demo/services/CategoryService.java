package com.demo.services;

import java.util.Date;
import java.util.List;

import com.demo.models.Category;
import com.demo.models.Product;


public interface CategoryService {
	public Iterable<Category> findAll();
	public Category find(int id);
	public Category save(Category category);
	public void delete(int id);
	
//	public Category findOne(int id);
	
}

