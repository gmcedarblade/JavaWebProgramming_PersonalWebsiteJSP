<%@page import="edu.cvtc.web.model.Person"%>
<%@page import="java.util.List"%>
<%@page import="edu.cvtc.web.dao.impl.PersonDaoImpl"%>
<%@page import="edu.cvtc.web.dao.PersonDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>The Personal Website of Greg Cedarblade: Contact List</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="description" content="This page displays all of the contacts that have signed up using our form.">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Contact List</h1>
		</div>
		<%@ include file="includes/navigation.jsp" %>
		<div class="container">
			<p>Below is a list of everyone who has signed up using my form.</p>
			
			<%
			
			final PersonDao personDao = new PersonDaoImpl();
			final List<Person> people = personDao.retrievePeople();
			
			if (people.isEmpty()) {
			
				%>
				<p>There is no contacts yet. Please use the contact page to connect with me.</p>
				<%
				
			} else {
				
				for (final Person person : people) {
					%>
					<p class="person">Contact: <%=person.getFirstName() %> <%=person.getLastName() %> <br>
					Email: <%=person.getEmailAddress() %></p>					
					<%
				}
				
			}
			
			%>
			
		</div>
	</div>
	<hr>
	<div class="hero-unit">&copy; Copyright 2016 Greg Cedarblade</div>
</body>
</html>