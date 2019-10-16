package com.shop.dao;

import org.hibernate.Session;

import com.shop.model.OrderDetails;

public class OrderDetailsDao {
	public static void insertPurchasedProduct(OrderDetails od) {
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		session.save(od);
		session.getTransaction().commit();
		session.close();
	}

}
