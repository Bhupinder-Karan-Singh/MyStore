
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/add_new_product")
@MultipartConfig
public class add_new_product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	     throws ServletException, IOException {
        
		 response.setContentType("text/html"); 
		 PrintWriter outPrintWriter = response.getWriter();
		 
		 try {
		 String category = request.getParameter("select1");
		 String product_name = request.getParameter("select2");
		 String price = request.getParameter("price");
		 
		 ResultSet rs = DBLoader.executeStatement("Select * from products");
		 System.out.println(rs);
		 if(rs.next()) {
			 System.out.println(rs);
			// creating user folders in drive
				//fetch photo
				Part photo = request.getPart("file1");
				//fetch path to upload
				String relpath = "images/"+category+"/"+product_name;
				String abspath = getServletContext().getRealPath("/"+relpath);
				// change file name on server to avoid same name conflict
				String newfilenameString1 = System.currentTimeMillis() + "-" + photo.getName();
			    // upload file to server
			    String file = FileUploader.savefileonserver(photo, abspath, newfilenameString1);
			    System.out.println(file);
				outPrintWriter.println("File saved on server: " + file);				
				// database entry
				rs.moveToInsertRow();
				rs.updateString("product_name", product_name);
				rs.updateString("category", category);
				rs.updateString("price", price);
				rs.updateString("product_photo", relpath + "/" + newfilenameString1);
				rs.insertRow();
				
				response.sendRedirect("./admin/add_products.jsp?msg2=Product Added Successfully");
		    } else {
			 response.sendRedirect("./admin/add_products.jsp?msg=Error occured");
		    }
		 }catch(Exception ex) {
			 outPrintWriter.println(ex.toString());
		 }
	}

}

