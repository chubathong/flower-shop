package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Product;


@Repository("productepository")
public interface ProductRepository extends CrudRepository<Product, Integer>{
//	@Query("from Product where name like %:keyword%	")
//	public List<Product> search(@Param("keyword") String keyword );
	
	//sắp xếp tăng dần
	@Query(value = "select * from product where status = :status order by id limit :limit",nativeQuery = true)
	public List<Product> findFeatured(@Param("status") boolean status, @Param("limit") int limit);
	
	@Query(value = "select * from product order by id limit :limit",nativeQuery = true)
	public List<Product> findLastest(@Param("limit") int limit);
	
	@Query(value = "select * from product where status = :status",nativeQuery = true)
	public List<Product> findbyFeatured(boolean status);
	
	@Query(value = "from Product where category.id = :categoryId and id != :id")
	public List<Product> findRelated(@Param("categoryId") int categoryId, @Param("id") int id);
}





