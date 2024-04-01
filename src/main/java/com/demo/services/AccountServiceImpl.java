package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.repositories.AccountRepository;




@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public Account findOne(String username) {
		return this.accountRepository.findById(username).get();
	}

	@Override
	public Account save(Account account) {
		return accountRepository.save(account);
	}

	@Override
	public void delete(String username) {
		accountRepository.deleteById(username);
		
	}

	@Override
	public Account login(String username, String password) {
		return accountRepository.login(username, password);
	}


	


	
	


}
