package com.example.stockspring.service;

import java.sql.SQLException;


import com.example.stockspring.model.User;

public interface UserService {
	  public boolean insertUser(User user) throws SQLException;
	  
	public User login(String username, String password);

	
}
