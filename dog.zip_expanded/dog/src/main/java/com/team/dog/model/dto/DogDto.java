package com.team.dog.model.dto;

import java.util.Date;

public class DogDto {
	
	private String addr;
	private int code;
	private Date created_at;
	private Double lat;
	private Double lng;
	private String name;
	private int type_num;
	private String phone;
	
	public DogDto() {
		super();
	}
	public DogDto(String addr, int code, Date created_at, Double lat, Double lng, String name, int type_num,
			String phone) {
		super();
		this.addr = addr;
		this.code = code;
		this.created_at = created_at;
		this.lat = lat;
		this.lng = lng;
		this.name = name;
		this.type_num = type_num;
		this.phone = phone;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType_num() {
		return type_num;
	}
	public void setType_num(int type_num) {
		this.type_num = type_num;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return "DogDto [addr=" + addr + ", code=" + code + ", created_at=" + created_at + ", lat=" + lat + ", lng="
				+ lng + ", name=" + name + ", type_num=" + type_num + ", phone=" + phone + "]";
	}
	
	
}
