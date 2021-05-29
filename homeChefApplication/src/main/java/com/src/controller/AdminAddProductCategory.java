package com.src.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.src.dao.CategoryDAO;
import com.src.entity.CategoryEntity;
import com.src.helper.FactoryProvider;

/**
 * Servlet implementation class AdminAddProductCategory
 */
public class AdminAddProductCategory extends HttpServlet {
	private static final long serialVersionUID = 7030505073819262105L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String operation = request.getParameter("operation");
		if (operation.trim().equals("addCategory")) {
			// FETCH ADD CATEGORY
			String categoryTitle = request.getParameter("category_title");
			String categoryDesc = request.getParameter("category_desc");

			CategoryEntity categoryEntity = new CategoryEntity();
			categoryEntity.setCategoryTitle(categoryTitle);
			categoryEntity.setCategoryDesc(categoryDesc);

			CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
			int catId = categoryDAO.saveCategory(categoryEntity);
			out.println("Category SAVED !!" +catId);
			
			HttpSession session = request.getSession();
			session.setAttribute("message", "Category added Successfully. Category ID: " +catId);
			response.sendRedirect("admin.jsp");
			return;

		} else if (operation.trim().equals("addProduct")) {
			// FETCH ADD CATEGORY
			String productName = request.getParameter("product_name");
			String productDesc = request.getParameter("product_desc");
			String productPrice = request.getParameter("product_price");
			String productDiscount = request.getParameter("product_discount");
			String productQuantity = request.getParameter("product_quantity");
			String chooseCategory = request.getParameter("choose_category");
			String productPhoto = request.getParameter("product_photo");

			CategoryEntity categoryEntity = new CategoryEntity();
			//categoryEntity.setCategoryTitle(categoryTitle);
			//categoryEntity.setCategoryDesc(categoryDesc);

			CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
			int catId = categoryDAO.saveCategory(categoryEntity);
			out.println("Category SAVED !!" +catId);
			
			HttpSession session = request.getSession();
			session.setAttribute("message", "Category added Successfully. Category ID: " +catId);
			response.sendRedirect("admin.jsp");
			return;

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
