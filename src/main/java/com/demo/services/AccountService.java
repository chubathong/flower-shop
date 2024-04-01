package com.demo.services;

import com.demo.models.Account;




public interface AccountService {
	public Iterable<Account> findAll();
	public Account findOne(String username);
	public Account save(Account account);
	public void delete(String username);
	public Account login(String username,String password);
	

}
