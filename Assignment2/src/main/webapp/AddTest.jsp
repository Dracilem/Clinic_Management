<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.dao.TestInfoDao" %>
<jsp:useBean id="t" class="com.dao.bean.TestInfo"></jsp:useBean>
<jsp:setProperty property="*" name="t"/>

<%
int i=TestInfoDao.save(t);
%>
Add success!
</body>
</html>