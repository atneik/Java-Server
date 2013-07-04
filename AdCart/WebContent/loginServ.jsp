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

	sc.log("Select id,password from users where name= " + "\"" + request.getParameter("userName") + "\"" + ";");

	ResultSet res = st.executeQuery("Select id,password from users where name= " + "\"" + request.getParameter("userName") + "\"" + ";");

	

	if (res.next())
	{
		
		if (res.getString(2).equals(request.getParameter("password")))
		{
			
			Cookie c1 = new Cookie("userName",request.getParameter("userName"));
		    Cookie c2 = new Cookie("password",request.getParameter("password"));

			
		   sc.log("Accepted!!"+res.getString(2));

			response.addCookie(c1);
			response.addCookie(c2);
			session.setAttribute("userName", request.getParameter("userName"));
			session.setAttribute("uid", res.getInt(1));
			
		}
	}
	
	st.close();
	conn.close();
	
	
}catch(Exception e){
	
}
response.sendRedirect("index.jsp");
%>
