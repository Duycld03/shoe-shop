package Controllers;

import DAOs.AdminDAO;
import DAOs.CustomerDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Models.Customer;
import Models.Email;
import Models.Staff;
import Utils.EmailUtils;
import Utils.JwtUtils;
import VNPay.Config;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duy
 */
public class ForgotPasswordController extends HttpServlet {

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
			out.println("<title>Servlet ForgotPasswordController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ForgotPasswordController at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
		request.getRequestDispatcher("/forgotPassword.jsp").forward(request, response);
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
		HttpSession session = request.getSession();
		if (request.getParameter("btnForgot") != null) {
			String forgotEmail = request.getParameter("forgotEmail");

			CustomerDAO customerDAO = new CustomerDAO();
			StaffDAO staffDAO = new StaffDAO();
			AdminDAO adminDAO = new AdminDAO();

			Customer customer = customerDAO.getByEmail(forgotEmail);
			Staff staff = staffDAO.getStaffByEmail(forgotEmail);
			Admin admin = adminDAO.getAdminByEmail(forgotEmail);
			if (customer != null || staff != null || admin != null) {
				String otp = Config.getRandomNumber(5);
				session.setAttribute("resetOtp", otp);
				session.setAttribute("resetEmail", forgotEmail);
				String resetToken = JwtUtils.generateToken(otp);
				String url = "http://localhost:8080/resetPassword?token=" + resetToken;
				try {
					Email email = new Email();
					email.setTo(forgotEmail);
					email.setSubject("Reset Your Password");
					StringBuilder sb = new StringBuilder();
					if (customer != null) {
						sb.append("Dear ").append(customer.getFullname()).append("<br>");
					} else if (staff != null) {
						sb.append("Dear ").append(staff.getFullname()).append("<br>");
					} else {
						sb.append("Dear ").append(admin.getFullname()).append("<br>");
					}
					sb.append("You are receiving this email because you requested to reset your password for your account on Shoes Store. <br> ");
					sb.append("Please click on the link below to reset your password:. <br> ");
					sb.append(url + ". <br> ");
					sb.append("If you did not request to reset your password, you can safely ignore this email. Your account will remain unaffected.. <br> ");
					sb.append("Thank you,. <br> ");
					sb.append("Shoes Store.");
					email.setContent(sb.toString());
					EmailUtils.send(email);
					session.setAttribute("success", "Send Mail Sucessful!");
					response.sendRedirect("/forgotPassword");
				} catch (Exception ex) {
					Logger.getLogger(ForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
					session.setAttribute("error", "Send Mail failed!");
					response.sendRedirect("/forgotPassword");
				}
			} else {
				session.setAttribute("error", "Email does not exist!");
				response.sendRedirect("/forgotPassword");
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
