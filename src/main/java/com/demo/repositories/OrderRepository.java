package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Category;
import com.demo.models.Orders;
import com.demo.models.Product;


@Repository
public interface OrderRepository extends CrudRepository<Orders, Integer>{
	
}





