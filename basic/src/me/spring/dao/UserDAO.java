package me.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import me.spring.entity.SystemTable;
import me.spring.entity.User;
import me.spring.entity.UserView;

@Repository
@Mapper
public interface UserDAO {

    
    @Insert("Insert into t_user(username,password) values(#{user.username},#{user.password})")
    public int insert(@Param("user") User user);
    
   
    

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
	
    @Select("Select * from t_user")
    public List<User> findAll();    
	
	@Select("Select * from t_user where loginname = #{user.loginname}")
	public User findByLoginname(String loginname);
	
	@Insert("Insert into t_user(loginname,username,password,phone) values(#{userView.loginname},#{userView.username},#{userView.password},#{userView.phone})")
	public int addUser(@Param("userView") UserView userView);

	@Insert("Insert into t_userrole(loginname,rolecode,caption) values(#{userView.loginname},#{userView.roleCode},#{userView.caption})")
	public int addUserRole(@Param("userView") UserView userView);
	
	@Select("Select * from t_user where id = #{user.id}")
	public User findById(@Param("user") User user);

    @Delete("Delete from t_user where id = #{user.id} ")
    public int deleteUser(@Param("user") User user);
    
    @Delete("Delete from t_userrole where id = #{user.id} ")
    public int deleteUserRole(@Param("user") User user);
    /*如果引号里面有内容需要将单引号变为双引号*/
    @Select("<script>select * from t_user <where>"+
            "   <if test=\"user.loginname != ''\">" +   
            "          loginname like concat('%',#{user.loginname},'%')" + 
            "   </if>" + 
            "   <if test=\"user.username != ''\">" + 
            "         or username like  concat('%',#{user.username},'%')" + 
            "   </if>" + 
            "   <if test=\"user.phone != ''\">" + 
            "          or phone ilke concat('%',#{user.phone},'%')" + 
            "   </if></where>" +   
            "</script>")
	public List<User> fuzzyQuery(@Param("user") User user);
    
    @Update("Update t_user set username = #{user.username},password = #{user.password},phone = #{user.phone} where id = #{user.id} ")
    public int update(@Param("user") User user);

	@Insert("Insert into t_user(loginname,username,password,phone) values(#{user.loginname},#{user.username},#{user.password},#{user.phone})")
	public int adminAddUser(@Param("user") User user);
	@Select("SELECT u.id, u.loginname, username,password, phone, rolecode, caption FROM `t_userrole` ur, `t_user` u where u.id = ur.id and u.loginname = #{user.loginname}")
	public List<UserView> getUserView(@Param("user") User User);
	
	
	
	@Select("<script>select u.id, u.loginname, username,password, phone, rolecode, caption from t_user u,`t_userrole` ur  <where>"+
            "   <if test=\"userView.loginname != ''\">" +   
            "          u.loginname like concat('%',#{userView.loginname},'%')" + 
            "   </if>" + 
            "   <if test=\"userView.caption != ''\">" + 
            "          or phone ilke concat('%',#{userView.caption},'%')" + 
            "   </if></where>" +   
            "</script>")
	public List<UserView> fuzzyQueryUV(@Param("userView") UserView userView);



	@Select("Select * from ${tableName}")
    public List<SystemTable> getInfo(String tableName);

	@Select("Select * from t_decorateclass")
	public List<SystemTable> getDecorateInfo();
	
	@Select("Select * from ${systemtable.tableName} where code = #{systemtable.code}")
	public SystemTable getByCode(@Param("systemtable") SystemTable systemtable);



    @Update("Update ${systemtable.tableName} set caption = #{systemtable.caption} where code = ${systemtable.code}")
	public int updateSystemTable(@Param("systemtable") SystemTable systemtable);



    @Insert("Insert into ${systemtable.tableName}(code,caption) values(#{systemtable.code},#{systemtable.caption})")
	public int addSystemTable(@Param("systemtable") SystemTable systemtable);



    @Delete("Delete from ${systemtable.tableName} where id = #{systemtable.id} ")
	public int deleteSystemTable(@Param("systemtable")SystemTable systemtable);
}