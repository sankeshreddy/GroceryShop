package com.shop.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import com.shop.model.Customer;

public class CustomerDao {
	public static boolean register(Customer customer) {
		Session session = HibernateUtil.getSession();
		if (isCustomerExists(customer))
			return false;
		try {
			session.beginTransaction();
			session.save(customer);
			System.out.println("Inserted Successfully");
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("exception in customerdao " + e);
		} finally {
			session.close();
		}
		return true;
	}

	public static boolean isCustomerExists(Customer customer) {
		Session session = HibernateUtil.getSession();
		boolean result = false;
		List results = null;
		try {
			System.out.println(customer.getName());

			Query query = session.createQuery("FROM Customer WHERE name = :cust_name");
			query.setParameter("cust_name", customer.getName());
			results = query.getResultList();
			System.out.println(results + " query result");
			if (!results.isEmpty())
				result = true;
		} catch (Exception ex) {
			System.out.println("exception in customerdao " + ex);
		} finally {
			session.close();
		}
		return result;
	}

	public static Customer getCustomerByEmail(String email) {
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		Query query = session.createQuery("FROM Customer c WHERE c.email = :cust_email");
		query.setParameter("cust_email", email);
		Customer value = (Customer) query.getSingleResult();
		session.getTransaction().commit();
		return value;

	}

	public static Customer getCustomerByName(String name) {
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		Query query = session.createQuery("FROM Customer c WHERE c.name = :cust_name");
		query.setParameter("cust_name", name);
		Customer value = (Customer) query.getSingleResult();
		session.getTransaction().commit();
		return value;

	}

}