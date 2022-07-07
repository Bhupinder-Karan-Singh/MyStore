import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showproducts")
public class showproducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws ServletException, IOException {
		 String queryString1 = request.getParameter("product_name");
		 String queryString2 = request.getParameter("category");
		 System.out.println("a"+queryString1);
		 System.out.println("b"+queryString2);
		 if(queryString1.equals("default") && queryString2.equals("men")){
			 response.setContentType("application/json"); 
			 PrintWriter outPrintWriter = response.getWriter();
			 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_id, product_photo, price from products where category =\'" + queryString2+ "\'");
			 outPrintWriter.println(jsonString);	
		 }else if(queryString1.equals("default") && queryString2.equals("women")){
			 response.setContentType("application/json"); 
			 PrintWriter outPrintWriter = response.getWriter();
			 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_id, product_photo, price from products where category =\'" + queryString2+ "\'");
			 outPrintWriter.println(jsonString);	
		 }else if(queryString1.equals("") && queryString2.equals("")){
			 response.setContentType("application/json"); 
			 PrintWriter outPrintWriter = response.getWriter();
			 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_id, product_photo, price from products");
			 outPrintWriter.println(jsonString);	
		 }else{
			 response.setContentType("application/json"); 
			 PrintWriter outPrintWriter = response.getWriter();
			 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_id, product_photo, price from products where product_name =\'" + queryString1 + "\' and category = \'" +queryString2+"\'");
			 outPrintWriter.println(jsonString);
		    } 
         }
	// Post method request
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		 response.setContentType("application/json"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 
		 String jsonString = new RDBMS_TO_JSON().generateJSON("Select product_id,  product_photo, price from products");
		 outPrintWriter.println(jsonString);
	}

}
