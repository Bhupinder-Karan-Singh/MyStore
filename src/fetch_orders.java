

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/fetch_orders")
public class fetch_orders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {
             HttpSession session = request.getSession();
             String session_email = (String) session.getAttribute("session_email");
             
			 response.setContentType("application/json"); 
			 PrintWriter outPrintWriter = response.getWriter();
			 String jsonString = new RDBMS_TO_JSON().generateJSON("Select order_id, total_price from orders where email = \'" + session_email + "\'");
			 outPrintWriter.println(jsonString);
         }

	// Post method request
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
	}

}
