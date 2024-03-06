package Controllers;

import DAOs.AdminDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Models.Staff;
import Utils.JwtUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Duy
 */
public class ManagerLoginController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try ( PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet ManagerLogin</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ManagerLogin at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		Cookie loginCookie = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("manager")) {
				loginCookie = cookie;
			}
		}

		if (loginCookie != null) {
			String username = JwtUtils.getContentFromToken(loginCookie.getValue());
			AdminDAO adminDAO = new AdminDAO();
			Admin admin = adminDAO.getAdminByUsername(username);

			StaffDAO staffDAO = new StaffDAO();
			Staff staff = staffDAO.getStaffByUsername(username);

			if (admin != null || staff != null) {
				// to manager page
				response.sendRedirect("/");
			} else {

				request.getRequestDispatcher("/managerLogin.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("/managerLogin.jsp").forward(request, response);
		}

	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnManagerLogin") != null) {
			String username = request.getParameter("username").toLowerCase();
			String password = request.getParameter("password");
			StaffDAO staffDAO = new StaffDAO();
			Staff staff = staffDAO.checkLogin(username, password);
			if (staff != null) {
				String token = JwtUtils.generateToken(username);
				Cookie cookie = new Cookie("manager", token);
				cookie.setMaxAge(3 * 24 * 60 * 60);
				cookie.setPath("/");
				response.addCookie(cookie);
				response.sendRedirect("/staffManager");
				return;
			}

			AdminDAO adminDAO = new AdminDAO();
			Admin admin = adminDAO.checkLogin(username, password);
			if (admin != null) {
				String token = JwtUtils.generateToken(username);
				Cookie cookie = new Cookie("manager", token);
				cookie.setMaxAge(3 * 24 * 60 * 60);
				cookie.setPath("/");
				response.addCookie(cookie);
				response.sendRedirect("/adminmanager");
				return;
			}

			request.getSession().setAttribute("error", "Username and password incorrect");
			response.sendRedirect("/managerLogin");
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
