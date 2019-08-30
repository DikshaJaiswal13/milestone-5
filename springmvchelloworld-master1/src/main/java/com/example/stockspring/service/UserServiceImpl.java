package com.example.stockspring.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.stockspring.dao.UserDao;

import com.example.stockspring.model.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;


	@Override
	public boolean insertUser(User user) throws SQLException {
		 if(userDao.save(user)!=null)
			 return true;
		 else
			 return false;
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		
		return userDao.findByUsername(username);
	}			 

}
