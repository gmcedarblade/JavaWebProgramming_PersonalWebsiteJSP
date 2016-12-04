<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>The Personal Website of Greg Cedarblade: Contact</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="description" content="This page provides a way to connect with Greg Cedarblade.">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Contact Me</h1>
		</div>
		<ul class="nav nav-tabs">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="about.jsp">About</a></li>
			<li><a href="contact.jsp">Contact</a></li>
		</ul>
		<div class="container">
		<%
		
		if (null != request.getParameter("submit")) {
			
			final String firstName = request.getParameter("firstName");
			final String lastName = request.getParameter("lastName");
			final String emailAddress = request.getParameter("emailAddress");
			
			if (null != firstName && !firstName.isEmpty() 
					&& null != lastName && !lastName.isEmpty()
					&& null != emailAddress && !emailAddress.isEmpty()) {
				%>
				<p>Thank you <%=firstName %> <%=lastName %>, I will contact you soon at <%=emailAddress %></p>
				<%
				
			} else {
				
				%>
				<p>Sorry, you must complete all of the fields before submitting the contact form.</p>
				<%
				
			}
			
			
		} else {
			
			%>
			<p>You can contact me by filling out this short form. I will use this information to contact you shortly.</p>
				<form method="post">
					<div class="form-group">
						<label for="firstName"><strong>First Name:</strong></label>
						<input name="firstName">
						
						<label for="lastName"><strong>Last Name:</strong></label>
						<input name="lastName">
						
						<label for="emailAddress"><strong>Email Address:</strong></label>
						<input name="emailAddress">
						
						<input class="btn btn-primary btn-lg" name="submit" type="submit" value="Connect!">
					</div>
				</form>
			<%
			
			
		}
		
		%>
			
		</div>
	</div>
	<hr>
	<div class="hero-unit">&copy; Copyright 2016 Greg Cedarblade</div>
</body>
</html>