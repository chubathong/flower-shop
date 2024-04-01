package com.demo.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.models.Orders;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.OrderRepository;



@Transactional
@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderRepository orderRepository;

	@Override
	public Orders create(Orders orders) {
		return this.orderRepository.save(orders);
	}



	
	


}
