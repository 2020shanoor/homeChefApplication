
<%
	String message = (String) session.getAttribute("message");
	if (message != null) {
%>
<div class="alert alert-success" role="alert">
	<h4 class="alert-heading">Well Done!</h4>
	<p>Welcome Buddy, you have successfully Register.
	<hr>
	<strong><%=message%></strong>
	<p class="mb-0">Now Go to Login and Enjoy the Experience.</p>
	<center>
		<button type="button" class="btn btn-success">
			<a href="login.jsp">Login</a>
		</button>
	</center>
</div>

<%
	session.removeAttribute("message");
	} else {

	}
%>