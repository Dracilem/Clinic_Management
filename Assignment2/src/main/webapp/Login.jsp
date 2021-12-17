<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.dao.UserDao, com.dao.bean.User, java.util.*" %>
<jsp:useBean id="u" class="com.dao.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
User user = UserDao.getUser(u.getUsername(), u.getPassword());
if(user == null){
	response.sendRedirect("Login-Null.jsp");
}
else if(user.getUsername().equals(u.getUsername()) && user.getPassword().equals(u.getPassword())){
	
	response.sendRedirect("ViewPatients.jsp");
}else{
	response.sendRedirect("Login-Error.jsp");
}
%>





</body>
</html>