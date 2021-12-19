<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link href="BSS/css/bootstrap.min.css" rel="stylesheet">
 <script src="BSS/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>

<body>
<%@page import="com.dao.PatientDao, com.dao.bean.Patient, java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
List<Patient>list = PatientDao.getAllPatients();
request.setAttribute("list", list);
%>

<nav class="navbar navbar-expand-md bg-secondary navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#"">Clinic Management System</a>
 
  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
 
  <!-- Welcome -->
  <div class="collapse navbar-collapse justify-content-end"
			id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link">Welcome, Admin</a></li>
			</ul>
		</div>
</nav>

<form action="SearchPatient.jsp" method="post" style="margin-top:30px;">
	<input type="search" name="iC" style="height:38px" id="test" placeholder="Input Patient IC"/>
	<input type="submit" class="btn btn-outline-secondary" value="Search"/>
	<a  href="ViewPatients.jsp">
	<input type=button class="btn btn-outline-secondary" value="View All">
	</a>
	<a href="AddPatientForm.jsp">
	<input style="float:right" type=button class="btn btn-outline-success" value="Add Patient">
</a>
</form>

<table border="1" width="100%">
	<tr>
		<th>Patient ID</th>
		<th>IC No.</th>
		<th>Gender</th>
		<th>Date</th>
		<th>Name</th>
		<th>PhoneNo.</th>
		<th>Birthday</th>
		<th>Prescriptions</th>
		<th>Covid-19 Test</th>
		<th >Action</th>

	</tr>

<c:forEach items="${list}" var="p">
	<tr>
		<td>${p.getPid()}</td>
		<td>${p.getIC()}</td>
		<td>${p.getGender()}</td>
		<td>${p.getDate()}</td>
		<td>${p.getPname()}</td>
		<td>${p.getNumber()}</td>
		<td>${p.getBirthday()}</td>
		<td>${p.getPrescriptions()}</td>
		<td><a href="CheckTest.jsp?pid=${p.getPid()}&iC=${p.getIC()}">Click here</a>
		</td>
		<td><a type="button" href="EditPatientsForm.jsp?pid=${p.getPid()}"><input type=button class="btn btn-primary" value="Edit"></a>
		
		<a type="button" href="DeletePatients.jsp?pid=${p.getPid()}"><input type=button class="btn btn-danger" value="Delete"></a>
		</td>
	</tr>
</c:forEach>
</table>


</body>
</html>