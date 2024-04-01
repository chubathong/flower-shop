package com.demo.services;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.models.Item;
import com.demo.models.Product;


public interface ProductService {
	public Iterable<Product> findAll();
	public Product find(int id);

	public int exists(int  id,List<Item> items);
	public Product save(Product product);
	
//	public List<Product> search( String keyword );
	
	public List<Product> findFeatured(boolean status,int limit );
	public List<Product> findLastest(int limit );
	public List<Product> findbyFeatured(boolean status);
	
	public List<Product> findRelated(int id);
	
	public void delete(int id);



	
}

