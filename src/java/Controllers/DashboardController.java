package Controllers;

import DAOs.AdminDAO;
import DAOs.CustomerDAO;
import DAOs.OrderDAO;
import DAOs.ProductDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Utils.JwtUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

/**
 *
 * @author Duy
 */
public class DashboardController extends HttpServlet {

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
			out.println("<title>Servlet DashboardController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet DashboardController at " + request.getContextPath() + "</h1>");
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
		Cookie[] cookies = request.getCookies();
		Cookie managerCookie = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("manager")) {
				managerCookie = cookie;
			}
		}
		if (managerCookie == null) {
			response.sendRedirect("/managerLogin");
			return;
		}
		String username = JwtUtils.getContentFromToken(managerCookie.getValue());
		AdminDAO adminDAO = new AdminDAO();
		Admin admin = adminDAO.getAdminByUsername(username);
		if (admin == null) {
			response.sendRedirect("/managerLogin");
			return;
		}
		request.setAttribute("admin", admin);

		//total revenue
		OrderDAO orderDAO = new OrderDAO();
		float totalRevenue = orderDAO.getTotalRevenue();
		int totalOrder = orderDAO.getOrderCount();

		ProductDAO productDAO = new ProductDAO();
		int totalProduct = productDAO.getProductCount();

		CustomerDAO customerDAO = new CustomerDAO();
		StaffDAO staffDAO = new StaffDAO();
		int totalCustomer = customerDAO.getCustomerCount();
		int totalStaff = staffDAO.getStaffCount();
		int totalAdmin = adminDAO.getAdminsCount();
		int totalUsers = totalCustomer + totalStaff + totalAdmin;

		request.setAttribute("totalRevenue", totalRevenue);
		request.setAttribute("totalOrder", totalOrder);
		request.setAttribute("totalProduct", totalProduct);
		request.setAttribute("totalUsers", totalUsers);

		//chart data
		StringJoiner Revenuejoiner = new StringJoiner(", ");
		for (int i = 1; i <= 12; i++) {
			Revenuejoiner.add(String.valueOf(orderDAO.getTotalRevenueByMonth(i)));
		}
		String revenueData = Revenuejoiner.toString();

		StringJoiner orderJoiner = new StringJoiner(", ");
		for (int i = 1; i <= 12; i++) {
			orderJoiner.add(String.valueOf(orderDAO.geTotalOrderByMonth(i)));
		}
		String orderData = orderJoiner.toString();

		request.setAttribute("revenueDate", revenueData);
		request.setAttribute("orderData", orderData);
		request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
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
		processRequest(request, response);
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
