<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%> 
<%@ page import="java.sql.*"%>

<head>
	<meta charset="UTF-8" />
	<title>AdFly</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<!--[if IE 9]>
		<link rel="stylesheet" type="text/css" href="css/ie9.css" />
	<![endif]-->
	<!--[if IE 8]>
		<link rel="stylesheet" type="text/css" href="css/ie8.css" />
	<![endif]-->
	<!--[if IE 7]>
		<link rel="stylesheet" type="text/css" href="css/ie7.css" />
	<![endif]-->
</head>
<body>
<div id="header">
		<div>
			<div id="logo">
				<a href="index.html"><img src="adflylogo.jpg" alt="Logo" /></a>
			</div>
				
				
				
				<% 
    if(session.getAttribute("userName")!=null)
	{
	  %>
	<br />Logged in	<%out.println(session.getAttribute("userName"));%>
		  
		  <br><a href="logout.jsp"><font color="#FF0000"> Signout</font></a>
	<%	
		}
		else
		{
			Cookie []cookies = request.getCookies();
			if (cookies != null)
			{
				Class.forName("com.mysql.jdbc.Driver").newInstance() ;
				 Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mynewdb","root","") ;
				
				
				
				Statement st = conn.createStatement();
				ResultSet res = st.executeQuery("SELECT id FROM users");
				while (res.next()) 
				{
					for (int i=0;i<cookies.length;i++)
					{
						if (cookies[i].getName().equals(res.getInt(1)))
						{
							session.setAttribute("uid",res.getInt(1));
							break;
						}
					}
				}
			}
			
			%>
			
			<%
		}
	%>
				
				
				
				
			<div id="navigation">
				<div>
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="advertisement.jsp">Add Advertisement</a></li>
						<li><a href="space.jsp">Add Space</a></li>
						<li><a href="view.jsp">View orders</a></li>
					</ul>
				</div>
			
			</div>
		</div>
	</div>
<div id="content">
</div>

</body>
</html>