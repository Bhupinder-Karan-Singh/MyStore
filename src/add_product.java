

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/add_product")
public class add_product extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {

		 response.setContentType("text/html"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 try {
	     HttpSession session = request.getSession();
		 String session_email = (String) session.getAttribute("session_email");
		 String product_id = request.getParameter("product_id");
		 ResultSet rs = DBLoader.executeStatement("Select * from products where product_id =\'" + product_id+ "\'");
		 if(rs.next()) {			
				String product_name = rs.getString("product_name");
				String product_price = rs.getString("price");
				String product_photo = rs.getString("product_photo");
				System.out.println(product_name+product_price+product_photo);
				ResultSet rs2 = DBLoader.executeStatement("Select * from cart where reference_number =\'" + null+ "\'");
				 if(rs2.next()) {
					 response.sendRedirect("cart.jsp?msg=Product already added");
					 System.out.println("Product already added");
				 }else {
					    rs2.moveToInsertRow();
					    rs2.updateString("email", session_email);
						rs2.updateString("product_id", product_id);
						rs2.updateString("product_name", product_name);
						rs2.updateString("product_price", product_price);
						rs2.updateString("product_photo", product_photo);
						rs2.insertRow();
						response.sendRedirect("cart.jsp?msg=Product Added");
				 }
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
