package com.shxt.module.record.model;

public class User1 {
	private int id;
    private String name;
    private int age;
    private String address;
    private String pic;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public User1(int id, String name, int age, String address, String pic) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.address = address;
		this.pic = pic;
	}
}
