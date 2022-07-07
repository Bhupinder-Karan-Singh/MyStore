
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout_admin")
public class Logout_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String session_email = (String) session.getAttribute("session_email");
		String session_name = (String) session.getAttribute("session_name");
		try {
			ResultSet rs = DBLoader.executeStatement("select * from admin where email = '" + session_email + "'");

			if (rs.next()) {
				session.setAttribute("session_email", session_email);
				session.setAttribute("session_name", session_name);
				session.setAttribute("session_email", null);
				session.setAttribute("session_name", null);
				response.sendRedirect("./admin/login.jsp?msg2=You have been logged out successfully !!!");
			} else {
				response.sendRedirect("./admin/login.jsp?msg=Error occured !!! Please login again");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
