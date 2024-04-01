package com.demo.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Item;
import com.demo.models.Product;
import com.demo.repositories.ProductRepository;


@Service
public class ProductServiceImpl implements ProductService{
	private List<Product>products;
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public Iterable<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product find(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	

//	@Override
//	public List<Product> search(String keyword) {
//		return productRepository.search(keyword);
//	}

	@Override
	public List<Product> findFeatured(boolean status,int limit) {
		return productRepository.findFeatured(status,limit);
	}

	@Override
	public List<Product> findLastest(int limit) {
		return productRepository.findLastest(limit);
	}

	@Override
	public int exists(int id, List<Item> items) {
		for(int i=0;i<items.size();i++) {
			if(items.get(i).getProduct().getId().equals(id)) {
				return i;
			}
		}
		return  -1;
	}

	@Override
	public List<Product> findbyFeatured(boolean status) {
		return productRepository.findbyFeatured(status);
	}

	@Override
	public List<Product> findRelated(int id) {
		Product product = productRepository.findById(id).get();
		return productRepository.findRelated(product.getCategory().getId(), id);
	}

	@Override
	public void delete(int id) {
		productRepository.deleteById(id);
		
	}





}
