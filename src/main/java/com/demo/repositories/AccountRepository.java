package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;

@Repository
public interface AccountRepository extends CrudRepository<Account, String>{
	

	
	@Query("from Account where username = :username and password = :password")
	public Account login(@Param("username") String username, @Param("password") String password);

//	@Query("from Account where id = :account_id")
//	public Account findOne(@Param("account_id")int account_id);
	
//	@Query("from Account where username = :username")
//	public Account findOne(@Param("username")String username);
}
