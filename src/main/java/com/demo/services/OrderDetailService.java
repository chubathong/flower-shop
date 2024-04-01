package com.demo.services;

import com.demo.models.Category;
import com.demo.models.Ordersdetail;

public interface OrderDetailService {

	public Ordersdetail create(Ordersdetail ordersdetail);
	
	public Iterable<Ordersdetail> findAll();

	
}
