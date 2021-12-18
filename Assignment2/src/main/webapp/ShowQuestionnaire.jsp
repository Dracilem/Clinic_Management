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
String s = ti.getSymptoms();//Read the record from the database
String[] symptoms = s.split(",| ");//Press "," to split multiple strings to generate an array of strings

%>

		<div class="index">
			<h1>Covid-19 Test Form</h1>
			<hr color="orange" width="700px" />
			<form action="EditTest.jsp" method="post">
				<ol>
					<li>Choice of your swab test for COVID-19:</li>
					<label><input type="radio" name="testType" value="Antigen Rapid Test Kit (RTK)" <%if(ti.getTestType().equals("Antigen Rapid Test Kit (RTK)")) out.print("checked");%>/>
					Antigen Rapid Test Kit (RTK)
					</label>
					<label><input type="radio" name="testType" value="Polymerase Chain Reaction Test (PCR)" <%if(ti.getTestType().equals("Polymerase Chain Reaction Test (PCR)")) out.print("checked");%>/>
					Polymerase Chain Reaction Test (PCR) 
					</label>
	
					<li>Are you vaccinated?</li>
					<label><input type="radio" name="vaccinationInfo" value="Fully Vaccinated" required <%if(ti.getVaccinationInfo().equals("Fully Vaccinated")) out.print("checked");%>/>
					Fully Vaccinated
					</label>
					<label><input type="radio" name="vaccinationInfo" value="Partially Vaccinated" <%if(ti.getVaccinationInfo().equals("Partially Vaccinated")) out.print("checked");%> />
					Partially Vaccinated
					</label>
					<label><input type="radio" name="vaccinationInfo" value="None" <%if(ti.getVaccinationInfo().equals("None")) out.print("checked");%>/>
					None
					</label>
		
					<li>Are you exhibiting two or more symptoms as listed:</li>
					<label><input type="checkbox" name="symptoms" value="Fever"
					<%for (int i = 0; i < symptoms.length; i++) {
						if (symptoms[i].equals("Fever")) {
  						out.print("checked");
 						break;
 						}
					}%>/>Fever</label><br />
					<label><input type="checkbox" name="symptoms" value="Cough"
					<%for (int i = 0; i < symptoms.length; i++) {
						if (symptoms[i].equals("Cough")) {
  						out.print("checked");
 						break;
 						}
					}%> />Cough</label><br />
					<label><input type="checkbox" name="symptoms" value="Bodyache" 
					<%for (int i = 0; i < symptoms.length; i++) {
						if (symptoms[i].equals("Bodyache")) {
  						out.print("checked");
 						break;
 						}
					}%>/>Bodyache</label><br />
					<label><input type="checkbox" name="symptoms" value="Headache" 
					<%for (int i = 0; i < symptoms.length; i++) {
						if (symptoms[i].equals("Headache")) {
  						out.print("checked");
 						break;
 						}
					}%>/>Headache</label><br />
					<label><input type="checkbox" name="symptoms" value="Sore throat" 
					<%for (int i = 0; i < symptoms.length; i++) {
						if (symptoms[i].equals("Sore throat")) {
  						out.print("checked");
 						break;
 						}
					}%>/>Sore throat</label><br />
					<label><input type="checkbox" name="symptoms" value="Fatigue" 
					<%for (int i = 0; i < symptoms.length; i++) {
						if (symptoms[i].equals("Fatigue")) {
  						out.print("checked");
 						break;
 						}
					}%>/>Fatigue</label><br />
					
					<li>Have you attended any areas associated with known COVID-19 clusters?</li>
					<label><input type="radio" name="attendCluster" value="Yes" <%if(ti.getAttendCluster().equals("Yes")) out.print("checked");%>/>
					Yes </label>
					<label><input type="radio" name="attendCluster" value="No" <%if(ti.getAttendCluster().equals("No")) out.print("checked");%> />No </label>
	
					<li>Do you have any close contact to confirmed or suspected case of COVID-19 case within 14
					days?</li>
					<label><input type="radio" name="contactPositive" value="Yes" <%if(ti.getContactPositive().equals("Yes")) out.print("checked");%>/>Yes </label>
					<label><input type="radio" name="contactPositive" value="No" <%if(ti.getContactPositive().equals("No")) out.print("checked");%>/>No </label>
	
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