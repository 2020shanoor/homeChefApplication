package com.src.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.src.dao.CategoryDAO;
import com.src.dao.ProductDAO;
import com.src.entity.CategoryEntity;
import com.src.entity.ProductEntity;
import com.src.helper.FactoryProvider;

/**
 * Servlet implementation class AdminAddProductCategory
 */

@MultipartConfig // this mean it will accept images.
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

			HttpSession session = request.getSession();
			session.setAttribute("message", "Category added Successfully. Your Category Id is " + catId);
			response.sendRedirect("admin.jsp");
			return;

		} else if (operation.trim().equals("addproduct")) {
			// FETCH ADD CATEGORY
			String productName = request.getParameter("product_name");
			String productDesc = request.getParameter("product_desc");
			int productPrice = Integer.parseInt(request.getParameter("product_price"));
			int productDiscount = Integer.parseInt(request.getParameter("product_discount"));
			int productQuantity = Integer.parseInt(request.getParameter("product_quantity"));
			int chooseCategory = Integer.parseInt(request.getParameter("choose_category"));
			Part part = request.getPart("product_photo");

			ProductEntity productEntity = new ProductEntity();
			productEntity.setProductName(productName);
			productEntity.setProductDesc(productDesc);
			productEntity.setProductPrice(productPrice);
			productEntity.setProductDiscount(productDiscount);
			productEntity.setProductPhoto(part.getSubmittedFileName());

			CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getFactory());
			CategoryEntity catt = categoryDAO.getCategoryEntity(chooseCategory);
			productEntity.setCategoryEntity(catt);
			
			// Uploading the photo in folder.
			// productPics
			String path = request.getRealPath("image") + File.separator + "productPics" + File.separator
					+ part.getSubmittedFileName();
			System.out.println(path);

			try {
				// uploading photo to the temp folder
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				// Reading Data
				byte[] data = new byte[is.available()];
				is.read(data);
				// Writing the Data
				fos.write(data);
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			ProductDAO productDAO = new ProductDAO(FactoryProvider.getFactory());
			 productDAO.saveProduct(productEntity);

			HttpSession session = request.getSession();
			session.setAttribute("message", "Product added Successfully.");
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
