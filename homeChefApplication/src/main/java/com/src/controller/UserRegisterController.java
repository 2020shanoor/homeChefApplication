package com.src.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.src.entity.UserEntity;
import com.src.helper.FactoryProvider;

public class UserRegisterController extends HttpServlet {
	private static final long serialVersionUID = -5569811913972021237L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");
			String userType = request.getParameter("user_type");

			// Validations for the fields
			if (userName.isEmpty()) {
				out.println("User Name is Blank.");
				return;
			}

			// Creating Object to store data
			UserEntity userEntity = new UserEntity(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, userType);
			Session hibernateSession = FactoryProvider.getFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			int userId = (Integer) hibernateSession.save(userEntity);

			tx.commit();
			hibernateSession.close();
			out.print("Successfully Saved !!");
			out.print("<br/>User Id is" + userId);
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
