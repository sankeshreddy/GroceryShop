package com.shop.model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "orders")
public class Orders {
	@Id
	@GeneratedValue
	private int id;
	private int total_amount;
	private int cust_id;
	private Date order_date;

	public Orders() {
		super();
	}

	public Orders(int total_amount, int cust_id, Date order_date) {
		super();
		this.total_amount = total_amount;
		this.cust_id = cust_id;
		this.order_date = order_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int gettotal_amount() {
		return total_amount;
	}

	public void settotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public Date getorder_date() {
		return order_date;
	}

	public void setorder_date(Date order_date) {
		this.order_date = order_date;
	}

}