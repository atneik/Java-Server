<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<jsp:include page="basic.jsp" flush="true"></jsp:include>

	<body>


		<div id="content">
		<div id="section">
			<div>
		<h1>Login</h1><br><br>
				<form action="loginServ.jsp" >
					User Name: <input type="text" name="userName" value="" /><br>
					Password:&nbsp;&nbsp; <input type="password" name="password" value="" /><br>
					<input type="submit" value="Login" name="submit" />
				</form>
		</div></div></div>
		<jsp:include page="basicf.jsp" flush="true"></jsp:include>	
    </body>
</html>
