<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%> 
<%@ page import="java.sql.*"%>

<%
ServletContext sc = getServletContext();
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance() ;
	 Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mynewdb","root","") ;
	 
	Statement st = conn.createStatement();
	sc.log("INSERT INTO users (name,password,email)  values(\"" + request.getParameter("userName") + "\" , \"" + request.getParameter("password") + "\",\"" + request.getParameter("email") + "\");" );
	
	st.executeUpdate("INSERT INTO users (name,password,email)  values(\"" + request.getParameter("userName") + "\" , \"" + request.getParameter("password") + "\",\"" + request.getParameter("email") + "\");" );
	
	st.close();
	conn.close();
}catch(Exception e){
	sc.log(e.getMessage());
}

response.sendRedirect("index.jsp");
%>