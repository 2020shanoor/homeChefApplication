package com.src.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		} else if (operation.trim().equals("addProduct")) {
			// FETCH ADD PRODUCT
			String categoryTitle = request.getParameter("category_title");
			String categoryDesc = request.getParameter("category_desc");
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
