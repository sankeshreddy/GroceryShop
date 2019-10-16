package com.shop.service;

import java.util.List;

import com.shop.dao.CustomerDao;
import com.shop.dao.ItemDao;
import com.shop.dao.OrderDetailsDao;
import com.shop.dao.OrdersDao;
import com.shop.model.Customer;
import com.shop.model.Item;
import com.shop.model.OrderDetails;
import com.shop.model.Orders;

public class GroceryService {
	public static List<String> getCategories() {
		return ItemDao.getCategories();
	}

	public boolean register(Customer customer) {
		return CustomerDao.register(customer);
	}

	public static boolean isCustomerExists(Customer customer) {
		return CustomerDao.isCustomerExists(customer);
	}

	public static Customer getCustomerByEmail(String email) {
		return CustomerDao.getCustomerByEmail(email);
	}

	public static Customer getCustomerByName(String name) {
		return CustomerDao.getCustomerByName(name);
	}

	public static List<Item> getAllItems() {
		return ItemDao.getAllItems();
	}

	public static List<Item> getItemsByCategory(String category) {
		return ItemDao.getItemsByCategory(category);
	}

	public static Item getItemById(int id) {
		return ItemDao.getItemById(id);
	}

	public static void generateOrder(Orders o) {
		OrdersDao.generateOrder(o);
	}

	public static int getOrderIdByCustomer(Orders o) {
		return OrdersDao.getOrderIdByCustomer(o);
	}

	public static void insertPurchasedProduct(OrderDetails od) {
			OrderDetailsDao.insertPurchasedProduct(od);
	}

}
