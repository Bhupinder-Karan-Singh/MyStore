

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/orders")
public class orders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {
		 System.out.println("in orders servlet");
		 response.setContentType("text/html"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 try {
	     HttpSession session = request.getSession();
		 String session_email = (String) session.getAttribute("session_email");
		 String total_price = request.getParameter("total_price");
		 System.out.println(total_price);
		 ResultSet rs = DBLoader.executeStatement("select * from orders where order_id = \'"+null+"\'");
		 if (rs.next()) {
				response.sendRedirect("orders.jsp?msg=error occured");
				System.out.println("error occured");
		 } else {
					    rs.moveToInsertRow();
					    rs.updateString("email", session_email);
						rs.updateString("total_price", total_price);
						rs.insertRow();
						
						ResultSet rs2 = DBLoader.executeStatement("select * from cart where email = \'"+session_email+"\'");
						while(rs2.next()) {
						    rs2.deleteRow();
					     }
						response.sendRedirect("orders.jsp");
				 }
		 } catch(Exception ex) {
			 outPrintWriter.println(ex.toString());
		 }
		 
      }

	// Post method request
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		 response.setContentType("application/json"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 
		 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_id,  product_photo, price from products");
		 outPrintWriter.println(jsonString);
	}

}
