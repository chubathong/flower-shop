<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@	taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Account</title>
<script>
	$(function() {
		$("#birthday").datepicker();
	});
</script>
</head>
<body>
	<h3>Edit Account</h3>
	<s:form method="post" modelAttribute="account"
		action="${pageContext.request.contextPath }/account/edit">
		<table>
			<tr>
				<td>Username</td>
				<td><s:input path="username" /></td>
			</tr>
			<tr>
				<td>password</td>
				<td><s:password path="password" /></td>
			</tr>
			<tr>
				<td>fullname</td>
				<td><s:input path="fullName" /></td>
			</tr>
			<tr>
				<td>gender</td>
				<td><s:radiobutton path="gender" value="female"/>Female
				<s:radiobutton path="gender" value="male"/>Male</td>

			</tr>
			<tr>
				<td>birthday</td>
				<td><s:input path="birthday" id="birthday"/></td>

			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Save">
					<s:hidden path="id"/> 
				</td>
	
			</tr>
		</table>
	</s:form>
</body>
</html>