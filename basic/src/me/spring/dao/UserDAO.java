package me.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import me.spring.entity.User;
import me.spring.entity.UserView;

@Repository
@Mapper
public interface UserDAO {
	@Select("Select * from t_user where id = #{user.id}")
	public User findById(@Param("user") User user);
	
    @Select("Select * from t_user")
    public List<User> findAll();    
    
    @Insert("Insert into t_user(username,password) values(#{user.username},#{user.password})")
    public int insert(@Param("user") User user);
    
    @Update("Update t_user set username = #{user.username},password = #{user.password} where id = #{user.id} ")
    public int update(@Param("user") User user);
    
    @Delete("Delete from t_user where id = #{user.id} ")
    public int delete(@Param("user") User user);

	@Select("<script>update T_User "+
	            "<set>" + 
	            "   <if test=\"user.username != ''\">" +   /*如果引号里面有内容需要将单引号变为双引号*/
	            "          username = #{user.username}," + 
	            "   </if>" + 
	            "   <if test=\"user.caption != ''\">" + 
	            "          caption = #{user.caption}," + 
	            "   </if>" + 
	            "   <if test=\"user.password != ''\">" + 
	            "          password = #{user.password}," + 
	            "   </if>" + 
	            "</set>  " +           
	            " where id = #{user.id}" +     
	            "</script>")
	    public void updateSet(@Param("user") User user);
	
	@Select("Select * from t_user where loginname = #{user.loginname}")
	public User findByLoginname(String loginname);
	
	@Insert("Insert into t_user(loginname,username,password,phone) values(#{userView.loginname},#{userView.username},#{userView.password},#{userView.phone})")
	public int addUser(@Param("userView") UserView userView);

	@Insert("Insert into t_userrole(loginname,rolecode,caption) values(#{userView.loginname},#{userView.roleCode},#{userView.caption})")
	public int addUserRole(@Param("userView") UserView userView);
}