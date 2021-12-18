<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.dao.TestInfoDao, java.util.*" %>
<jsp:useBean id="t" class="com.dao.bean.TestInfo"></jsp:useBean>
<jsp:setProperty property="*" name="t"/>

<%
String[] symptomlist;
symptomlist =request.getParameterValues("symptoms");
String s=Arrays.toString(symptomlist).replace("[","").replace("]","");
int i=TestInfoDao.update(t,s);

if(i>0){
	out.println("A test form is edited.");
	response.sendRedirect("ViewPatients.jsp");
}else{
	response.sendRedirect("ViewPatients.jsp");
}
%>
</body>
</html>