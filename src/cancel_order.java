

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cancel_order")
public class cancel_order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 String session_email = (String) session.getAttribute("session_email");
		 String order_id = request.getParameter("order_id");
         System.out.println("Inside cancel order" +order_id);
		 response.setContentType("text/html"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 try {
		 
		 ResultSet rs = DBLoader.executeStatement("Select * from orders where email = \'" + session_email+ "\' and order_id = \'"+order_id+"\'");
		 if(rs.next()) {
					    rs.deleteRow();
						response.sendRedirect("orders.jsp?msg=Product Removed");
				 }
		 }catch(Exception ex) {
			 outPrintWriter.println(ex.toString());
		 }
		 
      }

	// Post method request
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
