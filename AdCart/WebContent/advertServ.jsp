<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%> 
<%@ page import="java.sql.*"%>

<%
ServletContext sc = getServletContext();
try{

Class.forName("com.mysql.jdbc.Driver").newInstance() ;
		 Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mynewdb","root","") ;
		
		 
		 
		 PreparedStatement insertStmt = null;
			
			String insertString = "INSERT INTO advertisement (product_name,description,category,image_url,uid) values(?,?,?,?,?);";
			insertStmt = conn.prepareStatement(insertString);
			
			insertStmt.setString(1, request.getParameter("productName"));
			insertStmt.setString(2, request.getParameter("description"));
			insertStmt.setString(3, request.getParameter("category"));
			insertStmt.setString(4, request.getParameter("imageURL"));
			//insertStmt.setInt(5,2);
			
			insertStmt.setInt(5, Integer.parseInt(session.getAttribute("uid").toString()));
			
			insertStmt.executeUpdate();		 
	
		insertStmt.close();
	conn.close();
}catch(Exception e){
	sc.log(e.getMessage());
}
response.sendRedirect("index.jsp");
%>
