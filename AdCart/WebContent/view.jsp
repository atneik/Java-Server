
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%> 
<%@ page import="java.sql.*"%>


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
		<h1>Your Spaces</h1>
        
        <%
	
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance() ;
	Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mynewdb","root","") ;
	
	Statement stmt = conn.createStatement() ;
	String qry = "Select site_name,site_description,price,category from space where id = " + session.getAttribute("uid").toString();
	sc.log(qry);
	ResultSet rs = stmt.executeQuery(qry);
	while(rs.next()){
		String name=rs.getString(1);
		String desc=rs.getString(2);
		sc.log(name);
		
		%>
		<jsp:useBean id="spBeanID" class="adflyBeans.SpBeans">
			
		</jsp:useBean>
		<OL>
		<jsp:setProperty name="spBeanID" property="site_name" value="<%= rs.getString(1) %>"/>
		<jsp:getProperty name="spBeanID" property="site_name" />
		
		<jsp:setProperty name="spBeanID" property="site_description" value="<%= rs.getString(2) %>"/>
		<jsp:getProperty name="spBeanID" property="site_description" />
		
		<jsp:setProperty name="spBeanID" property="price" value="<%= rs.getDouble(3) %>"/>
		<jsp:getProperty name="spBeanID" property="price" />	
		
		<jsp:setProperty name="spBeanID" property="category" value="<%= rs.getString(4) %>"/>
		<jsp:getProperty name="spBeanID" property="category" />	
		
	
	</OL>
	<%
		
		
	}
	
	rs.close();
	conn.close();
	}catch(Exception e){
		sc.log(e.getMessage());
	}

%>
        
        
        
        
        
		</div></div></div>
		<jsp:include page="basicf.jsp" flush="true"></jsp:include>	
    </body>
</html>
