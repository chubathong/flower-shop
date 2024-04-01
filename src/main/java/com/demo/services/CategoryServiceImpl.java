package com.demo.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Category;
import com.demo.models.Product;
import com.demo.repositories.CategoryRepository;
import com.demo.repositories.ProductRepository;


@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public Iterable<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Category find(int id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public void delete(int id) {
		 categoryRepository.deleteById(id);
		
	}

//	@Override
//	public Category findOne(int id) {
//		return categoryRepository.findOne(id);
//	}

}
