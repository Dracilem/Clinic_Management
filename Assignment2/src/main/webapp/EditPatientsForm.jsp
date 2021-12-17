<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.dao.PatientDao, com.dao.bean.Patient" %>

<%
String pid = request.getParameter("pid");
Patient p = PatientDao.getPatientByPatientId(Integer.parseInt(pid));
%>
<h1>Edit Patient Information</h1>

<form onsubmit="return validate();" action="EditPatients.jsp" method="post">
	<input type="hidden" name="pid" value="<%=p.getPid()%>">
	<table>
		<tr>
			<td>IC No.:</td>
			<td><input type="text" name="IC" value="<%=p.getIC()%>" id="IC"></td>
		</tr>
		<tr>
			<td>Gender:</td>
			<td><input type="radio" name="gender" value="Male" <%if(p.getGender().equals("Male")) out.print("checked");%>>Male</td>
			<td><input type="radio" name="gender" value="Female" <%if(p.getGender().equals("Female")) out.print("checked");%>>Female</td>
		</tr>
		<tr>
			<td>Name:</td>
			<td><input type="text" name="pname" value="<%=p.getPname()%>" id="pname"/></td>
		</tr>

		<tr>
			<td>Birthday:</td>
			<td><input type="date" name="birthday" value="<%=p.getBirthday()%>" id="birthday"></td>
		</tr>
		<tr>
			<td>Phone No.:</td>
			<td><input type="tel" name="number" value="<%=p.getNumber()%>" id="number"></td>
		</tr>
		<tr>
			<td>Date:</td>
			<td><input type="date" name="date" value="<%=p.getDate()%>" id="date"></td>
		</tr>
		<tr>
			<td>Prescriptions:</td>
			<td>
			<select name="prescriptions" style="width:200px">
				<option>Not Tested</option>
				<option>Positive</option>
				<option>Negative</option>
			</select>
			</td>
		</tr>
				
		<tr>
			<td><input type="submit" value="Edit Patient"/></td>
		</tr>	
		
	</table>
</form>

<a type="button" href="ViewPatients.jsp"><input type=button value="Back to view"></a>
<script src="EditPatients.js"></script>
</body>
</html>