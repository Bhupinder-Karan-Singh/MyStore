

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Signup_user")
public class Signup_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 response.setContentType("text/html"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 try {
		 String email = request.getParameter("email");
		 String name = request.getParameter("name");
		 String password = request.getParameter("password");
		 String phone = request.getParameter("phone");
		 
		 ResultSet rs = DBLoader.executeStatement("Select * from user where email =\'" + email+ "\'");
		 if(rs.next()) {
			 response.sendRedirect("signup.jsp?msg=Email already exists");
		 }
		 else {			
				// database entry
				rs.moveToInsertRow();
				rs.updateString("email", email);
				rs.updateString("password", password);
				rs.updateString("name", name);
				rs.updateString("phone", phone);
				rs.insertRow();
				response.sendRedirect("login.jsp?msg2=Signup Success");
		    } 
		 }catch(Exception ex) {
			 outPrintWriter.println(ex.toString());
		 }
	}

}
