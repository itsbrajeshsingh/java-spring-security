<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Custom login form</title>
		<style>
			.failed{
				color:red;
				background: black;
			}
		</style>
	</head>
	<body>
		<h3>Custome login form</h3>
		<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
		<c:if test="${param.error != null}" >
			<h2><i class="failed">Sorry! you have entered invalid username or password.</i></h2>
		</c:if>
			<p>
				User name: <input type="text" name="username" />
			</p>
			<p>
				Password: <input type="password" name="password" />
			</p>
			<input type="submit" value="Login" />
		</form:form>
	</body>
</html>