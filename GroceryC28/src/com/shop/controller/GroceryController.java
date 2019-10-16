package com.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.CustomerDao;
import com.shop.dao.ItemDao;
import com.shop.model.Customer;
import com.shop.model.Item;
import com.shop.model.OrderDetails;
import com.shop.model.Orders;
import com.shop.service.GroceryService;

public class GroceryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		System.out.println(action);
		try {
			if (action == null) {
				List<String> categoryList = GroceryService.getCategories();
				session.setAttribute("categoryList", categoryList);
				List<Item> itemList = GroceryService.getAllItems();
				session.setAttribute("itemList", itemList);
				rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String action = request.getParameter("action");
		
		if (action.equals("Go")) {
			String category = request.getParameter("category");
			List<Item> itemList = GroceryService.getItemsByCategory(category);
			System.out.println(itemList.size());
			request.setAttribute("itemList", itemList);
			request.getRequestDispatcher("login.jsp").forward(request, response);

		}
		if (action.equals("Go ")) {
			String category = request.getParameter("category");
			List<Item> itemList = GroceryService.getItemsByCategory(category);
			System.out.println(itemList.size());
			request.setAttribute("itemList", itemList);
			request.getRequestDispatcher("loginhome.jsp").forward(request, response);

		}

		if (action.equals("SignUp")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			Customer c = new Customer(name, email, pwd);
			
			if (CustomerDao.register(c)) {
				request.getRequestDispatcher("register.jsp").forward(request, response);
				System.out.println("Successfully Registered");
			} else {
				System.out.println("Already exists");
			}

		}
		if (action.equals("Login")) {
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			Customer c = GroceryService.getCustomerByEmail(email);
			if (c.getPassword().equals(pwd)) {
				out.println("Loginned Successfully");
			
				session.setAttribute("name", c.getName());

				List<String> categoryList = GroceryService.getCategories();
				session.setAttribute("categoryList", categoryList);
				request.getRequestDispatcher("loginhome.jsp").forward(request, response);
			} else {
				out.println("Invalid Email Or Password");

				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}

		if (action.equals("AddToCart")) {
			String[] quantities = request.getParameterValues("quantity");
			String[] itemId = request.getParameterValues("id");
			LinkedHashMap<Integer, Integer> itemDetails = new LinkedHashMap<Integer, Integer>();
			List<Item> itemList = new ArrayList<Item>();
			List<Integer> qtList = new ArrayList<Integer>();
			int qty = 0, id = 0, tp = 0, beforeqt = 0;
			Item item = null;
			if (session.getAttribute("selectedItemList") != null && session.getAttribute("qtList") != null) {
				System.out.println("entered if part");
				itemList = (List<Item>) session.getAttribute("selectedItemList");
				System.out.println("itemlist size" + itemList.size());
				qtList = (List<Integer>) session.getAttribute("qtList");
				beforeqt = qtList.size();
				tp = (Integer)(session.getAttribute("totalprice"));
				System.out.println(tp + " : tp");
				for (int i = 0; i < quantities.length; i++) {
					qty = Integer.parseInt(quantities[i]);
					id = Integer.parseInt(itemId[i]);
					itemDetails.put(id, qty);

				}
				for (Map.Entry<Integer, Integer> m : itemDetails.entrySet()) {
					int quantity = (int) m.getValue();
					if (quantity > 0) {
						item = GroceryService.getItemById((int) m.getKey());
						qtList.add(quantity);
						itemList.add(item);
						tp += (item.getPrice() * qtList.get(beforeqt));
						beforeqt++;

					}
				}

			} else {
				for (int i = 0; i < quantities.length; i++) {
					qty = Integer.parseInt(quantities[i]);
					id = Integer.parseInt(itemId[i]);
					itemDetails.put(id, qty);

				}
				for (Map.Entry<Integer, Integer> m : itemDetails.entrySet()) {
					int quantity = (int) m.getValue();
					if (quantity > 0) {
						item = GroceryService.getItemById((int) m.getKey());
						qtList.add(quantity);
						itemList.add(item);

					}
				}
				for (int i = 0; i < qtList.size(); i++) {
					tp += (qtList.get(i) * itemList.get(i).getPrice());
				}

			}
			session.setAttribute("selectedItemList", itemList);
			session.setAttribute("qtList", qtList);
			session.setAttribute("totalprice", tp);
			session.setAttribute("beforeqt", beforeqt);
			request.getRequestDispatcher("cart.jsp").forward(request, response);

		}

		if (action.equals("Continue")) {
			String cname = (String) session.getAttribute("name");
			System.out.println(cname);
			Customer c = GroceryService.getCustomerByName(cname);
			System.out.println(c);
			int tp1 = (Integer) session.getAttribute("totalprice");
			System.out.println(tp1);
			Date d = new Date();
			System.out.println(d.toString() + " date");
			Orders o = new Orders();
			o.settotal_amount(tp1);
			o.setorder_date(d);
			o.setCust_id(c.getId());
			GroceryService.generateOrder(o);
			int order_id = GroceryService.getOrderIdByCustomer(o);
			System.out.println(order_id);
			OrderDetails od;
			List<Item> iList = (List<Item>) session.getAttribute("selectedItemList");
			List<Integer> qtList = (List<Integer> ) session.getAttribute("qtList");
			for (int i = 0; i < iList.size(); i++) {
				od = new OrderDetails();
				od.setOrder_id(order_id);
				od.setItem_id(iList.get(i).getId());
				od.setQuantity(qtList.get(i));
				GroceryService.insertPurchasedProduct(od);
			}
			request.getRequestDispatcher("final.jsp").forward(request, response);

		}
	}

}