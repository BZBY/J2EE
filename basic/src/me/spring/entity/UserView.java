package me.spring.entity;
public class UserView extends IdEntity {
    private static final long serialVersionUID = 1L;
    private String username = "";
    private String loginname = "";
    private String password = "";
    private String roleCode = "";
    private String Caption = "";
    private String phone = "";
    
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
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getCaption() {
		return Caption;
	}
	public void setCaption(String caption) {
		Caption = caption;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "UserView [username=" + username + ", loginname=" + loginname + ", password=" + password + ", roleCode="
				+ roleCode + ", Caption=" + Caption + ", phone=" + phone + "]";
	}
	
	
}
