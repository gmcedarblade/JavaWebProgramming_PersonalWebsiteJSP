<%@page import="edu.cvtc.web.dao.impl.PersonDaoImpl"%>
<%@page import="edu.cvtc.web.dao.PersonDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>The Personal Website of Greg Cedarblade: Create Database</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="description" content="This web page is used to create the Person database.">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Create Database</h1>
		</div>
		<jsp:include page="includes/navigation.jsp"></jsp:include>
		<div class="container">
		<%
		
		if(null != request.getParameter("create")) {
			try {
				final PersonDao personDao = new PersonDaoImpl();
				personDao.createDatabase();
				
				%>
				<p> Success! The database was created. </p>
				<%
			} catch (Exception e) {
				
				%>
				<p>Sorry, there was a problem creating the databasae.</p>
				<p>Error: <%=e.getMessage() %> </p>
				<%
				
			}
			
			
			
		} else {
			%>
			<p>To create the Person database use the form below.</p>
			<form method="post">
				<div class="form-group">
					<input type="submit" name="create" value="Create!">
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