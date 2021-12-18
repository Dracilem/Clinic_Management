<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%@page import="com.dao.PatientDao, com.dao.bean.Patient, java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 align="center">Clinic Management System</h1>
<%
List<Patient>list = PatientDao.getAllPatients();
request.setAttribute("list", list);
%>
<form action="SearchPatient.jsp" method="post">
	<input type="search" name="iC" id="test" placeholder="Input Patient IC"/>
	<input type="submit" value="Search"/>
	<a  href="ViewPatients.jsp">
	<input type=button value="View All">
	</a>
</form>

<a href="AddPatientForm.jsp">
<input style="float:right" type=button value="Add Patient">
</a>


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
		<td><a type="button" href="EditPatientsForm.jsp?pid=${p.getPid()}"><input type=button value="Edit"></a>
		
		<a type="button" href="DeletePatients.jsp?pid=${p.getPid()}"><input type=button value="Delete"></a>
		</td>
	</tr>
</c:forEach>
</table>

</body>
</html>