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
		<p> 
		see you in brazil!!!! <br>
		Keep is secret
		</p>
		<p>
		<a href="${pageContext.request.contextPath}/">Back to home page</a>
		</p>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</body>
</html>