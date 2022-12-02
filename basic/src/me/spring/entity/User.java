package me.spring.entity;


public class User extends IdEntity {
    private static final long serialVersionUID = 1L;
    private String username;
    private String loginname;
    private String password;
    private String phone;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", loginname=" + loginname + ", password=" + password + ", phone=" + phone
				+ "]";
	}
    
    
}