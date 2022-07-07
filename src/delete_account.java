

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete_account")
public class delete_account extends HttpServlet {
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
		     String password = request.getParameter("password");

		 
		 ResultSet rs = DBLoader.executeStatement("Select * from user where email =\'" + session_email + "\' and password = \'" +password+"\'");
		 if(rs.next()) {
			 rs.deleteRow();
			 session.setAttribute("session_email", null);
			 response.sendRedirect("login.jsp?msg2=Account Deleted");
			 System.out.println("Account deleted");
		 }
		 else {			
				response.sendRedirect("delete_account.jsp?msg=Invalid password");
				System.out.println("Account not deleted");
		    } 
		 }catch(Exception ex) {
			 response.sendRedirect("delete_account.jsp?msg=Action restricted !!! Orders yet to deliver");
		 }
	}

}
