package adServer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageServlet
 */
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    public static int getRandomNumberFrom(int min, int max) {
        Random foo = new Random();
        int randomNumber = foo.nextInt((max + 1) - min) + min;

        return randomNumber;

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext sc = getServletContext();
	    String filename = sc.getRealPath("/adverts/image.gif");
	    String spaceID = request.getParameter("id");
	    boolean isSpaceIdValid = false;
	    sc.log("ID = "+ spaceID);
	    
	    
	    try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance() ;
	    Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mynewdb","root","") ;
	    Statement stmt = conn.createStatement() ;
	    if(!conn.isClosed())
	        sc.log("Successfully connected to MySQL server");
	    
	    ResultSet rs = stmt.executeQuery( "SELECT id FROM space;" ) ;
	    
	    while( rs.next() )
	         if(rs.getString("id").equals(spaceID))
	        	 isSpaceIdValid = true;

	    // Close the result set, statement and the connection
	     rs.close() ;
	      stmt.close() ;
	      conn.close() ;
	    }catch(Exception e){
	    	sc.log(e.getMessage());
	    }
	    
	    if(isSpaceIdValid){
	    try{
		    Class.forName("com.mysql.jdbc.Driver").newInstance() ;
		    Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mynewdb","root","") ;
		    Statement stmt = conn.createStatement() ;
		    if(!conn.isClosed())
		        sc.log("Successfully connected to MySQL server");
		    
		    ResultSet rs = stmt.executeQuery( "SELECT count(id) FROM advertisement;" ) ;
		    rs.next();
		    int sizeRow = rs.getInt(1);
		    sc.log(Integer.toString(sizeRow));
		    int selectedID = getRandomNumberFrom(2,sizeRow);
		    rs = stmt.executeQuery( "SELECT image_url FROM advertisement WHERE id=\"" + Integer.toString(selectedID) + "\";") ;
		    sc.log("SELECT image_url FROM advertisement WHERE id=\"" + Integer.toString(selectedID) + "\";");
		    rs.next();
		    filename = sc.getRealPath(rs.getString(1));
		    
		    
		    // Close the result set, statement and the connection
		     rs.close() ;
		      stmt.close() ;
		      conn.close() ;
		    }catch(Exception e){
		    	sc.log(e.getMessage());
		    }
	    }
	    
	    sc.log("Filename : " + filename);
	    
	    // Get the MIME type of the image
	    String mimeType = sc.getMimeType(filename);
	    if (mimeType == null) {
	        sc.log("Could not get MIME type of "+filename);
	        resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        return;
	    }
	
	    // Set content type
	    resp.setContentType(mimeType);

	    // Set content size
	    File file = new File(filename);
	    resp.setContentLength((int)file.length());

	    // Open the file and output streams
	    FileInputStream in = new FileInputStream(file);
	    OutputStream out = resp.getOutputStream();

	    // Copy the contents of the file to the output stream
	    byte[] buf = new byte[1024];
	    int count = 0;
	    while ((count = in.read(buf)) >= 0) {
	        out.write(buf, 0, count);
	    }
	    in.close();
	    out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
