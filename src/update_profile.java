

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class update_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 response.setContentType("text/html"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 try {
			 HttpSession session = request.getSession();
             String session_email = (String) session.getAttribute("session_email");
             
		 String name = request.getParameter("name");
		 String phone = request.getParameter("phone");
		 
		 ResultSet rs = DBLoader.executeStatement("Select * from user where email =\'" + session_email+ "\'");
		 if(rs.next()) {		
				// database entry
				rs.updateString("name", name);
				rs.updateString("phone", phone);
				rs.updateRow();
				response.sendRedirect("edit_profile.jsp?msg2=profile updated successfully");
		    } else {
		    	response.sendRedirect("edit_profile.jsp?msg=Error occured !!! Please try again");
		    }
		 }catch(Exception ex) {
			 outPrintWriter.println(ex.toString());
		 }
	}

}
