<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<jsp:include page="basic.jsp" flush="true"></jsp:include>

	<body>
<%session.invalidate();%>



	
		<div id="content">
		<div id="section">
			<div>
				<ul>
				<li> You have logged out.</li>
				<i><a href="login.jsp"><b>Login</b></a></i>
				</ul>
		
		
		</div></div></div>
		<jsp:include page="basicf.jsp" flush="true"></jsp:include>	
    </body>
</html>
