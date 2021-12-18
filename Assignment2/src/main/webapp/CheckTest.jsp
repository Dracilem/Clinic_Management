<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.dao.TestInfoDao, com.dao.bean.TestInfo" %>
<%@page import="com.dao.PatientDao, com.dao.bean.Patient" %>

<%
String pid = request.getParameter("pid");
Patient p = PatientDao.getPatientByPatientId(Integer.parseInt(pid));
%>

<%
String IC = request.getParameter("iC");
TestInfo t = TestInfoDao.getInfoByIC(IC);
if(t.getPname()==null)
{
	response.sendRedirect("Questionnaire.jsp?pid="+pid);
}
else
{
	response.sendRedirect("ShowQuestionnaire.jsp?iC="+IC);
}
%>

</body>
</html>