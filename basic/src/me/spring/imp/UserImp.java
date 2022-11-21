package me.spring.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.spring.dao.UserDAO;
import me.spring.entity.User;
import me.spring.entity.UserView;
import me.spring.service.UserService;

@Service
public class UserImp implements UserService{
	@Autowired
    UserDAO userDAO;

	@Override
	public User findByLoginname(String loginname) {
		return userDAO.findByLoginname(loginname);
	}

	@Override
	public int add(UserView userView) {
		int i1 = userDAO.addUser(userView);
		int i2 = userDAO.addUserRole(userView);
		return i1 + i2;
	}

	@Override
	public List<User> listAll() {
		return userDAO.findAll();
	}
	
}
