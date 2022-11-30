<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<title>Bks company home page</title>
		
	</head>
	<body>
		<h2>Bks company</h2>
		<hr>
		welcome to Bks company home page<br><br>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</body>
</html>