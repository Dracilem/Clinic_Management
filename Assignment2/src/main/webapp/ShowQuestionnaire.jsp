<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>Questionnaire</title>
</head>
<body>

<%@page import="com.dao.TestInfoDao, com.dao.bean.TestInfo" %>

<%
String IC = request.getParameter("iC");
TestInfo ti = TestInfoDao.getInfoByIC(IC);
%>

		<div class="index">
			<h1>Covid-19 Test Form</h1>
			<hr color="orange" width="700px" />
			<form action="AddTest.jsp" method="post">
				<ol>
					<li>Choice of your swab test for COVID-19:</li>
					<label><input type="radio" name="testType" value="Antigen Rapid Test Kit (RTK)" <%if(ti.getTestType().equals("Antigen Rapid Test Kit (RTK)")) out.print("checked");%>/>
					Antigen Rapid Test Kit (RTK)
					</label>
					<label><input type="radio" name="testType" value="Polymerase Chain Reaction Test (PCR)" />Polymerase Chain Reaction Test (PCR) </label>
	
					<li>Are you vaccinated?</li>
					<label><input type="radio" name="vaccinationInfo" value="Fully Vaccinated" required />Fully Vaccinated</label>
					<label><input type="radio" name="vaccinationInfo" value="Partially Vaccinated" />Partially Vaccinated</label>
					<label><input type="radio" name="vaccinationInfo" value="None" />None</label>
		
					<li>Are you exhibiting two or more symptoms as listed:</li>
					<label><input type="checkbox" name="symptoms" value="Fever" />Fever</label><br />
					<label><input type="checkbox" name="symptoms" value="Cough" />Cough</label><br />
					<label><input type="checkbox" name="symptoms" value="Bodyache" />Bodyache</label><br />
					<label><input type="checkbox" name="symptoms" value="Headache" />Headache</label><br />
					<label><input type="checkbox" name="symptoms" value="Sore throat" />Sore throat</label><br />
					<label><input type="checkbox" name="symptoms" value="Fatigue" />Fatigue</label><br />
					
					<li>Have you attended any areas associated with known COVID-19 clusters?</li>
					<label><input type="radio" name="attendCluster" value="Yes" />Yes </label>
					<label><input type="radio" name="attendCluster" value="No" />No </label>
	
					<li>Do you have any close contact to confirmed or suspected case of COVID-19 case within 14
					days?</li>
					<label><input type="radio" name="contactPositive" value="Yes" />Yes </label>
					<label><input type="radio" name="contactPositive" value="No" />No </label>
	
				</ol>
				Name: <input type="text" name="pname" value="<%=ti.getPname()%>" />
				IC NO.:<input type="text" name="IC" value="<%=ti.getIC()%>" />
				Phone: <input type="tel" name="phone" value="<%=ti.getPhone()%>" />
				<br />
				<input id="btn" type="submit" value="Submit">
				
			</form>
		</div>

</body>
</html>