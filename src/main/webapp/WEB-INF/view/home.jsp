<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
	<head>
		<title>Bks company home page</title>
		
	</head>
	<body>
		<h2>Bks company</h2>
		<hr>
		<p>
		User: <security:authentication property="principal.username" /> <br><br>
		Role: <security:authentication property="principal.authorities" />
		</p>
		<hr>
		welcome to Bks company home page<br><br>
		<security:authorize access="hasRole('MANAGER')">
		<p>
		<a href="${pageContext.request.contextPath}/leaders">Leaders meetings</a>
		(only for manager peeps)
		</p>
		</security:authorize>
		<security:authorize access="hasRole('ADMIN')">
		<p>
		<a href="${pageContext.request.contextPath}/systems">It System</a>
		(IT Admin manager)
		</p>
		</security:authorize>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</body>
</html>