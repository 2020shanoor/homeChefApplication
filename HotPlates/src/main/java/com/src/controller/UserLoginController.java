package com.src.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.src.dao.UserLoginDAO;
import com.src.entity.UserEntity;
import com.src.helper.FactoryProvider;

/**
 * Servlet implementation class UserLoginController
 */
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 7214561698094697631L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");

			// Validations for the fields
			// Auth User
			UserLoginDAO userLoginDAO = new UserLoginDAO(FactoryProvider.getFactory());
			UserEntity user = userLoginDAO.getUserByEmailAndPassword(email, password);
			System.out.println("User: " + user);

			HttpSession httpSession =  request.getSession();
			
			if (user == null) {
				out.println("<h1> Invalid User, Record Not Found </h1>");
				httpSession.setAttribute("message", "Something went Wrong , Please check your Email or Password !! ");
				response.sendRedirect("login.jsp");
				return;
			} else {
				out.println("<h1> Welcome " + user.getUserName() + "</h1>");
				httpSession.setAttribute("current-user", user);
				
				if(user.getUserType().equals("admin")) {
					//Admin
					response.sendRedirect("admin.jsp");
				} else if(user.getUserType().equals("user")) {
					//Normal
					response.sendRedirect("normalUser.jsp");
				} else {
					out.println("We cannot identity the user type");
				}
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
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
