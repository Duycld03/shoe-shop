package Controllers.Common;

import DAOs.AdminDAO;
import DAOs.CustomerDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Models.Customer;
import Models.Staff;
import Utils.JwtUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Duy
 */
public class ResetPasswordController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet ResetPasswordController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ResetPasswordController at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String token = request.getParameter("token");
		String otp = JwtUtils.getContentFromToken(token);
		HttpSession session = request.getSession();
		try {
			String resetOtp = (String) session.getAttribute("resetOtp");
			String resetEmail = (String) session.getAttribute("resetEmail");

			CustomerDAO customerDAO = new CustomerDAO();
			StaffDAO staffDAO = new StaffDAO();
			AdminDAO adminDAO = new AdminDAO();

			Customer customer = customerDAO.getByEmail(resetEmail);
			Staff staff = staffDAO.getStaffByEmail(resetEmail);
			Admin admin = adminDAO.getAdminByEmail(resetEmail);
			if (customer == null && staff == null && admin == null) {
				response.sendRedirect("/");
				return;
			}

			if (resetOtp.equals(otp)) {
				request.getRequestDispatcher("/Common/resetPassword.jsp").forward(request, response);
			} else {
				response.sendRedirect("/");
			}
		} catch (Exception e) {
			response.sendRedirect("/");
		}
		session.removeAttribute("resetOtp");
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("btnReset") != null) {
			String newPassword = request.getParameter("newPassword");

			HttpSession session = request.getSession();
			try {
				String resetEmail = (String) session.getAttribute("resetEmail");

				CustomerDAO customerDAO = new CustomerDAO();
				Customer customer = customerDAO.getByEmail(resetEmail);
				if (customer != null) {
					customer.setPassword(newPassword);
					int result = customerDAO.update(customer);
					if (result >= 1) {
						session.removeAttribute("resetEmail");
						session.setAttribute("success", "Reset Password successful!");
						response.sendRedirect("/customerLogin");
					} else {
						session.setAttribute("error", "Reset Password failed!");
						response.sendRedirect("/customerLogin");
					}
					return;
				}

				StaffDAO staffDAO = new StaffDAO();
				Staff staff = staffDAO.getStaffByEmail(resetEmail);
				if (staff != null) {
					staff.setPassword(newPassword);
					int result = staffDAO.updateStaff(staff);
					if (result >= 1) {
						session.removeAttribute("resetEmail");
						session.setAttribute("success", "Reset Password successful!");
						response.sendRedirect("/managerLogin");
					} else {
						session.setAttribute("error", "Reset Password failed!");
						response.sendRedirect("/managerLogin");
					}
					return;
				}

				AdminDAO adminDAO = new AdminDAO();
				Admin admin = adminDAO.getAdminByEmail(resetEmail);
				if (admin != null) {
					admin.setPassword(newPassword);
					int result = adminDAO.updateAdmin(admin);
					if (result >= 1) {
						session.removeAttribute("resetEmail");
						session.setAttribute("success", "Reset Password successful!");
						response.sendRedirect("/managerLogin");
					} else {
						session.setAttribute("error", "Reset Password failed!");
						response.sendRedirect("/managerLogin");
					}
				}
			} catch (Exception e) {
				response.sendRedirect("/");
			}

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
