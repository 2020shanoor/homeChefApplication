
<%
	String message = (String) session.getAttribute("message");
	if (message != null) {
%>
<div class="alert alert-success d-flex align-items-center" role="alert">
	<svg class="bi flex-shrink-0 me-1" width="20" height="20" role="img"
		aria-label="Success:">
		<use xlink:href="#exclamation-triangle-fill" /></svg>
	<div>
		<h4 class="alert-heading">Important Alert!</h4>
		<hr>
		<strong><%=message%></strong>
	</div>
</div>
<%
	session.removeAttribute("message");
	} else {

	}
%>