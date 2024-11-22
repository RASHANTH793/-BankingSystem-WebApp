package com.model;

import java.util.Date;

public class Customer {
	private long accno;
	private String name;
	private long phone;
	private String mail;
	private double bal;
	private String pin;
	private Date date;
	
	
	public Customer(long accno, String name, long phone, String mail, double bal, String pin) {
		super();
		this.accno = accno;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.bal = bal;
		this.pin = pin;
	}
	public Customer() {
		super();
	}
	public long getAccno() {
		return accno;
	}
	public void setAccno(long accno) {
		this.accno = accno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public double getbal() {
		return bal;
	}
	public void setbal(double bal) {
		this.bal= bal;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
