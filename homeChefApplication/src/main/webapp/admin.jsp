<%@page import="com.src.entity.UserEntity"%>
<%
	UserEntity user = (UserEntity) session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("message", "You are not loggedin yet. Login First!");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUserType().equals("user")) {
			session.setAttribute("message", "You are not Admin, You dont have access !!");
			response.sendRedirect("login.jsp");
		}
	}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Chef- ADMIN</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<h1>This is Admin Page.</h1>
</body>
</html>