package com.demo.person;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Person {
	private int id;
	private String name;
	private java.util.Date birthday;
	private String address;

	public Person(int id, String name, Date birthday, String address) {
		this.id = id;
		this.name = name;
		this.birthday = birthday;
		this.address = address;
	}

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

	public String getBirthday() {
		SimpleDateFormat formatBday = new SimpleDateFormat("yyyy-MM-dd");
		return formatBday.format(birthday);
	}

	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
