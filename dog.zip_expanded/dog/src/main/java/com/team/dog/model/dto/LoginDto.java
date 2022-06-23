package com.team.dog.model.dto;

public class LoginDto {
	private int no;
	private String id;
	private String name;
	private String pw;
	private String email;
	private String phone;

	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginDto(int no, String id, String name, String pw, String email, String phone) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "LoginDto [no=" + no + ", id=" + id + ", name=" + name + ", pw=" + pw + ", email=" + email + ", phone="
				+ phone + "]";
	}

}
