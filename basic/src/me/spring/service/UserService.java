package me.spring.service;

import me.spring.entity.User;
import me.spring.entity.UserView;

public interface UserService {
	/**
	 * des: 根据login名查找用户
	 * @return
	 */
	public User findByLoginname(String loginname);
	
	/**
	 * des: 添加user 数据至数据库
	 * @param userView
	 * @return
	 */
	public int add(UserView userView);
}
