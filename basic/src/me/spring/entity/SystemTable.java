package me.spring.entity;

public class SystemTable extends IdEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String tableName;
	private String code;
	private String caption;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	@Override
	public String toString() {
		return "SystemTable [id = " + id +" code=" + code + ", caption=" + caption + "]";
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	
}
