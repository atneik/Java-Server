<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<jsp:include page="basic.jsp" flush="true"></jsp:include>

	<body>
	
	

		<div id="content">
		<div id="section">
			<div>
		<h1>Signup</h1><br><br>
				<form action="registerServ.jsp" >
					User Name: <input type="text" name="userName" value="" /><br>
					Password:&nbsp;&nbsp; <input type="password" name="password" value="" /><br>
					Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" value="" /><br><br>
					<input type="submit" value="Register" name="submit" />
				</form>
		</div></div></div>
		<jsp:include page="basicf.jsp" flush="true"></jsp:include>	
    </body>
</html>
