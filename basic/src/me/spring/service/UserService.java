package me.spring.service;

import java.util.List;

import me.spring.entity.SystemTable;
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

	/**
	 * des: 查找所有的用户
	 * @return
	 */
	public List<User> listAll();

	/**
	 * des: 根据id 获取user 对象
	 * @param user
	 * @return
	 */
	public User getById(User user);

	/**
	 * 根据id 删除数据库中的数据
	 * @param user
	 * @return
	 */
	public int delete(User user);

	/**
	 * des：根据用户名 登录名 电话进行模糊查询
	 * @param user 
	 * @return
	 */
	public List<User> getByFuzzyQuery(User user);

	/**
	 * 更新数据表中的内容
	 * @param user
	 * @return
	 */
	public int update(User user);

	/**
	 * 管理员添加用户
	 * @param user
	 * @return
	 */
	public int adminAddUser(User user);

	/**
	 * 获取userView 的list 对象
	 * @param loginname
	 * @return
	 */
	public List<UserView> getUserView(User user);
	
	
	/**
	 * 获取系统表信息
	 * @param tableName
	 * @return
	 */
	public List<SystemTable> getInfo(String tableName);

	/**
	 * 获取装修系统表信息
	 * @return
	 */
	List<SystemTable> getDecorateInfo();

	/**
	 * 获取用户权限信息
	 * @return
	 */
	List<UserView> fuzzyQueryUV(UserView userView);

	/**
	 * 修改用户个人信息
	 * @param user
	 * @return
	 */
	public int updateUserInfo(User user);

	/**
	 * 根据code 查询系统表的信息
	 * @param systemtable 
	 * @param tableName 
	 * @return
	 */

	public SystemTable getByCode(SystemTable systemtable);

	/**
	 * 更新系统表
	 * @param systemtable
	 * @return
	 */
	public int updateSystemTable(SystemTable systemtable);

	/**
	 * 系统表添加数据
	 * @param systemtable
	 */
	public int addSystemTable(SystemTable systemtable);

	/**
	 * 系统表删除数据
	 * @param systemtable
	 * @return
	 */
	public int deleteSystemTable(SystemTable systemtable);
}
