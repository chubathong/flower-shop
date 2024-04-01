<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@	taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

</head>
<body>
	<h1>Login</h1>

	${msg }
	<form method="post" action="${pageContext.request.contextPath }/account/login">
		
		Username: <input type="text" name="username"><br>
		Password <input type="password" name="password"><br> 
		<input type="submit" value="Confirm">

	</form>
</body>
</html>