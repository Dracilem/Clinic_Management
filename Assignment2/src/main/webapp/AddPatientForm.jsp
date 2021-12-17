<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Add New Patient</h1>

<form onsubmit="return validate();" action="AddPatient.jsp" method="post">
	<table>
		<tr>
			<td>IC No.:</td>
			<td><input type="text" name="IC" id="IC"></td>
		</tr>
		<tr>
			<td>Gender:</td>
			<td><input type="radio" name="gender" value="Male">Male</td>
			<td><input type="radio" name="gender" value="Female">Female</td>
		</tr>
		
		<tr>
			<td>Date:</td>
			<td><input type="date" name="date" id="date"></td>
		</tr>
		
		<tr>
			<td>Name:</td>
			<td><input type="text" name="pname" id="pname"></td>
		</tr>


		<tr>
			<td>PhoneNo.:</td>
			<td><input type="tel" name="number" id="number"></td>
		</tr>
		<tr>
			<td>Birthday:</td>
			<td><input type="date" name="birthday" id="birthday"></td>
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
			<td><input type="submit" value="Add Patient"/></td>
		</tr>	
	</table>
</form>
<a type="button" href="ViewPatients.jsp"><input type=button value="Back to view"></a>
<script src="AddPatient.js"></script>

</body>
</html>