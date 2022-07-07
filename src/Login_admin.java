
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


@WebServlet("/Login_admin")
public class Login_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String session_email = (String) session.getAttribute("session_email");
		String session_name = (String) session.getAttribute("session_name");
		
		if (session_email != null) {
			try {
				ResultSet rs = DBLoader_admin.executeStatement("Select * from admin where email =\'" + session_email + "\'");
				if (rs.next()) {
					session.setAttribute("session_email", session_email);
					session.setAttribute("session_name", session_name);
					response.sendRedirect("./admin/adminhome.jsp");
				} else {
					response.sendRedirect("./admin/login.jsp?msg=Session expired");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			String email2 = request.getParameter("email");
			String password = request.getParameter("password");
			try {
				ResultSet rs2 = DBLoader.executeStatement("select * from admin where email='" + email2 + "'and password='" + password + "'");
				if (rs2.next()) {
					session.setAttribute("session_email", email2);
					String name = rs2.getString("name");
					session.setAttribute("session_name", name);
					response.sendRedirect("./admin/adminhome.jsp");
				}

				else {

					response.sendRedirect("./admin/login.jsp?msg=Invalid email or password");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
