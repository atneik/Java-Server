<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%> 
<%@ page import="java.sql.*"%>
	
<%		ServletContext sc = getServletContext();
			
				if(session.getAttribute("userName")==null) {%>
				<jsp:forward page="login.jsp"/>
			<% }
			%>
			
				
	<%
	
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance() ;
	Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mynewdb","root","") ;
		
	
	PreparedStatement insertStmt = null;
	
	String insertString = "INSERT INTO space (site_name,site_description,price,category,uid) values(?,?,?,?,?);";
	insertStmt = conn.prepareStatement(insertString);
	
	insertStmt.setString(1, request.getParameter("siteName"));
	insertStmt.setString(2, request.getParameter("siteDescription"));
	insertStmt.setDouble(3, Double.valueOf(request.getParameter("price")));
	insertStmt.setString(4, request.getParameter("category"));
	//insertStmt.setInt(5,3);
	
	insertStmt.setInt(5, Integer.parseInt(session.getAttribute("uid").toString()));
	
	//(4, request.getParameter("category"));
	insertStmt.executeUpdate();
	
	insertStmt.close();
	conn.close();
	}catch(Exception e){
		sc.log(e.getMessage());
	}
	
	response.sendRedirect("index.jsp");
%>