package com.shop.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;


import com.shop.model.Customer;
import com.shop.model.Item;

public class ItemDao {
	public static List<String> getCategories() {
		System.out.println("itemdao reached");
		Session session = HibernateUtil.getSession();
		System.out.println(session + "session in itemdao");
		List<String> l = null;
		List<String> list = null;
		try {

			Query qry = session.createQuery("SELECT distinct(E.category) FROM Item E");
			System.out.println("after query class in itemdao");

			l = qry.getResultList();
			System.out.println("Total Number Of Records : " + l.size());
			Iterator<String> it = l.iterator();
			list = new ArrayList<String>();
			while (it.hasNext()) {
				Object o = it.next();
				list.add((String) o);
				System.out.println("category Name : " + o);
				System.out.println("----------------");
			}

		} catch (Exception ex) {
			System.out.println("exception in itemdao" + ex);
		} finally {
			session.close();
		}
		return list;

	}

	public static List<Item> getAllItems() {
		List<Item> itemList = null;
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Item");
		itemList = q.getResultList();
		session.getTransaction().commit();
		return itemList;

	}

	public static List<Item> getItemsByCategory(String category) {
		List<Item> itemList = null;
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Item p where p.category= :category_name");
		q.setParameter("category_name", category);
		itemList = q.getResultList();
		session.getTransaction().commit();
		return itemList;

	}

	public static Item getItemById(int id) {
		Item item = null;
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Item p where p.id= :item_id");
		q.setParameter("item_id", id);
		item = (Item) q.getSingleResult();
		session.getTransaction().commit();
		return item;

	}

}