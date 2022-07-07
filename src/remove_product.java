

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/remove_product")
public class remove_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 String session_email = (String) session.getAttribute("session_email");
		 String product_id = request.getParameter("product_id");
         System.out.println("Inside remove product" +product_id);
		 response.setContentType("text/html"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 try {
		 
		 ResultSet rs = DBLoader.executeStatement("Select * from cart where email = \'" + session_email+ "\' and product_id = \'"+product_id+"\'");
		 if(rs.next()) {
					    rs.deleteRow();
						response.sendRedirect("cart.jsp?msg=Product Removed");
				 }
		 }catch(Exception ex) {
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
