package me.spring.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.spring.dao.UserDAO;
import me.spring.entity.SystemTable;
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

	@Override
	public User getById(User user) {
		return userDAO.findById(user);
	}

	@Override
	public int delete(User user) {
		int i1 = userDAO.deleteUser(user);
		int i2 = userDAO.deleteUserRole(user);
		return i1 + i2;
	}

	@Override
	public List<User> getByFuzzyQuery(User user) {
		return userDAO.fuzzyQuery(user);
	}

	@Override
	public int update(User user) {
		return userDAO.update(user);
	}

	@Override
	public int adminAddUser(User user) {
		
		return userDAO.adminAddUser(user);
	}

	@Override
	public List<UserView> getUserView(User user) {
		return userDAO.getUserView(user);
	}

	@Override
	public List<SystemTable> getInfo(String tableName) {
		return userDAO.getInfo(tableName);
	}
	
	@Override
	public List<SystemTable> getDecorateInfo() {
		return userDAO.getDecorateInfo();
	}
	
	@Override
	public List<UserView> fuzzyQueryUV(UserView userView) {
		return userDAO.fuzzyQueryUV(userView);
	}

	@Override
	public int updateUserInfo(User user) {
		return userDAO.update(user);
	}

	@Override public SystemTable getByCode(SystemTable systemtable) { 
		return userDAO.getByCode(systemtable); 
	}

	@Override
	public int updateSystemTable(SystemTable systemtable) {
		return userDAO.updateSystemTable(systemtable);
	}

	@Override
	public int addSystemTable(SystemTable systemtable) {
		return userDAO.addSystemTable(systemtable);
	}

	@Override
	public int deleteSystemTable(SystemTable systemtable) {
		return userDAO.deleteSystemTable(systemtable);
	}

}
