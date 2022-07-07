

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update_address")
public class update_address extends HttpServlet {
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
             
		 String house = request.getParameter("house");
		 String street = request.getParameter("street");
		 String city = request.getParameter("city");
		 String province = request.getParameter("province");
		 String country = request.getParameter("country");
		 String postal = request.getParameter("postal");
		 
		 ResultSet rs = DBLoader.executeStatement("Select * from user where email =\'" + session_email+ "\'");
		 if(rs.next()) {		
				// database entry
				rs.updateString("house", house);
				rs.updateString("street", street);
				rs.updateString("city", city);
				rs.updateString("province", province);
				rs.updateString("country", country);
				rs.updateString("postal", postal);
				rs.updateRow();
				response.sendRedirect("update_address.jsp?msg2=Address updated successfully");
		    } else {
		    	response.sendRedirect("update_address.jsp?msg=Error occured !!! Please try again");
		    }
		 }catch(Exception ex) {
			 outPrintWriter.println(ex.toString());
		 }
	}

}
