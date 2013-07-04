<%		ServletContext sc = getServletContext();
			
				if(session.getAttribute("userName")==null) {%>
				<jsp:forward page="login.jsp"/>
			<% }
			%>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<jsp:include page="basic.jsp" flush="true"></jsp:include>

	<body>
	
		<div id="content">
		<div id="section">
			<div>
		<h1>Advertise your Space</h1>
        <form action="spaceServ.jsp">
            Site Name: <input type="text" name="siteName" value="" /><br>
            Site Description:<br>&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="siteDescription" rows="7" cols="20">
            </textarea><br>
            Price: <input type="text" name="price" value="qoute a price" /><br>
            Category: 
            <select name="category">
                <option value="banking">banking</option>
                <option value="educational">educational/tutorial</option>
                <option value="food">food and eating</option>
                <option value="merchant">online merchant/online retailing</option>
                <option value="health">health and lifestyle</option>
                <option value="fashion">fashion (hobby)</option>
                <option value="sports">sports (hobby)</option>
                <option value="mail">mail service</option>
                <option value="others">others</option>
            </select><br>
            <br>
            <input type="submit" value="Add Space" name="submit" />
        </form>
		</div></div></div>
		<jsp:include page="basicf.jsp" flush="true"></jsp:include>	
    </body>
</html>
