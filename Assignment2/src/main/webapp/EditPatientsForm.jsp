<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="BSS/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/FormStyle.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.dao.PatientDao, com.dao.bean.Patient" %>

<%
String pid = request.getParameter("pid");
Patient p = PatientDao.getPatientByPatientId(Integer.parseInt(pid));
%>
<div class="Content-Main">
	<form onsubmit="return validate();" action="EditPatients.jsp" method="post">
	<h1>Edit Patient</h1>
 	<input type="hidden" name="pid" value="<%=p.getPid()%>">
 	<table>
 	 <tr>
   <td>&nbsp; IC No.:</td>
   <td><input type="text" name="IC" value="<%=p.getIC()%>" id="IC"></td>
   </tr>
  <tr>
   <td>&nbsp; Gender:</td>
   <td><input type="radio" name="gender" value="Male" <%if(p.getGender().equals("Male")) out.print("checked");%>>Male</td>
   <td><input type="radio" name="gender" value="Female" <%if(p.getGender().equals("Female")) out.print("checked");%>>Female</td>
  </tr>
  <tr>
   <td>&nbsp; Name:</td>
   <td><input type="text" name="pname" value="<%=p.getPname()%>" id="pname"/></td>
  </tr>

  <tr>
   <td>&nbsp; Birthday:</td>
   <td><input type="date" name="birthday" value="<%=p.getBirthday()%>" id="birthday"></td>
  </tr>
  <tr>
   <td>&nbsp; Phone No.:</td>
   <td><input type="text" name="number" value="<%=p.getNumber()%>" id="number"></td>
  </tr>
  <tr>
   <td>&nbsp; Date:</td>
   <td>  
   <select name="date" style="width:200px" class="form-control input-sm">
    <option><%=p.getDate()%></option>
    <option><%=new java.sql.Date(System.currentTimeMillis())%></option>
   </select>
   </td>
  </tr>
  <tr>
   <td>&nbsp; Prescriptions:</td>
   <td>
   <select name="prescriptions" style="width:200px" class="form-control input-sm">
    <option>Not Tested</option>
    <option>Positive</option>
    <option>Negative</option>
   </select>
   </td>
  </tr>
    
  <tr>
   <td><input type="submit" class="btn btn-success" value="Edit Patient"/></td>
  </tr> 
 </table>
</form>
<a type="button" href="ViewPatients.jsp"><input type=button class="btn btn-secondary" value="Back to view"></a>
	</div>


<script src="EditPatients.js"></script>
</body>
</html>