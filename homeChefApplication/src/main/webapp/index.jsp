<%@page import="com.src.helper.FactoryProvider"%>
<%@page import="org.hibernate.sql.ordering.antlr.Factory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Chef Application - HOME</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<center>Home Chef Service Welcomes You</center>
	<%
		out.println(FactoryProvider.getFactory());
	%>
</body>
</html>