package com.assets.domain;

public class LoginVO {
    private int seq;
    private String id;
    private String pwd;
    private String employee_Code;
    private int authority_Code;
    private String assets_Code;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmployee_Code() {
		return employee_Code;
	}
	public void setEmployee_Code(String employee_Code) {
		this.employee_Code = employee_Code;
	}
	public int getAuthority_Code() {
		return authority_Code;
	}
	public void setAuthority_Code(int authority_Code) {
		this.authority_Code = authority_Code;
	}
	public String getAssets_Code() {
		return assets_Code;
	}
	public void setAssets_Code(String assets_Code) {
		this.assets_Code = assets_Code;
	}
    
    
}
