<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<jsp:include page="basic.jsp" flush="true"></jsp:include>

<body>
	<div id="content">
		<div id="section">
			<div>
				<h1>AdFly</h1>
				<p>This website is a space to add advertisements to various sites and also to make sites available for advertisement.</p>
				<% if (session.getAttribute("userName")==null) {%>
				
				<span>
					<a class="first" href="login.jsp">Login</a>
					<a href="register.jsp">Register</a>
				</span> 
				<% } %>
			</div>
			<div id="figure">
				<a href="index.html"><img src="adflylogo.jpg" alt="Image" /></a>
				<span></span>
			</div>
			<span class="background"></span>
		</div>
	</div>
<jsp:include page="basicf.jsp" flush="true"></jsp:include>	
</body>
</html>