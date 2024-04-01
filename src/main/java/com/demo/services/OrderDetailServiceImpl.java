package com.demo.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Ordersdetail;
import com.demo.repositories.OrderDetailRepository;

@Transactional
@Service
public class OrderDetailServiceImpl implements OrderDetailService{
	
	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Override
	public Ordersdetail create(Ordersdetail ordersdetail) {
		return this.orderDetailRepository.save(ordersdetail);
	}

	@Override
	public Iterable<Ordersdetail> findAll() {
		return orderDetailRepository.findAll();
	}






	
	


}
