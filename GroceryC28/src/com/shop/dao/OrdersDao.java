package com.shop.dao;


import javax.persistence.Query;

import org.hibernate.Session;

import com.shop.model.Customer;
import com.shop.model.Orders;

public class OrdersDao {
	public static void generateOrder(Orders o) {
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		session.save(o);
		session.getTransaction().commit();
		session.close();

	}

	public static int getOrderIdByCustomer(Orders o) {
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		Query query = session.createQuery("select c.id FROM Orders c WHERE c.order_date = :odate and total_amount=:ta and c.cust_id=:cid");
		query.setParameter("odate", o.getorder_date());
		query.setParameter("ta", o.gettotal_amount());
		query.setParameter("cid", o.getCust_id());
		int value = (Integer) query.getSingleResult();
		session.getTransaction().commit();
		return value;

	}

}
