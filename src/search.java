import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {
			 response.setContentType("application/json"); 
			 PrintWriter outPrintWriter = response.getWriter();
			 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_photo, price from products");
			 outPrintWriter.println(jsonString);	
         }
	// Post method request
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("application/json"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_photo, price from products");
		 outPrintWriter.println(jsonString);
	}

}
