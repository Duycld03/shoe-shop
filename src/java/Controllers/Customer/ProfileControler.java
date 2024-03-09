/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Customer;

import DAOs.AdminDAO;
import DAOs.AddressDAO;
import DAOs.CustomerDAO;
import DAOs.OrderDAO;
import DAOs.OrderDetailDAO;
import DAOs.StaffDAO;
import Models.Customer;
import Models.Address;
import Models.Order;
import Models.OrderDetail;
import Utils.JwtUtils;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class ProfileControler extends HttpServlet {

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
			out.println("<title>Servlet ProfileControler</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ProfileControler at " + request.getContextPath() + "</h1>");
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
		Cookie[] cookies = request.getCookies();
		Cookie loginCookie = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("login")) {
				loginCookie = cookie;
			}
		}
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = null;
		if (loginCookie != null) {
			String username = JwtUtils.getContentFromToken(loginCookie.getValue());
			customer = customerDAO.getCustomerByUsername(username);
			if (customer == null) {
				response.sendRedirect("/customerLogin");
				return;
			}
		} else {
			response.sendRedirect("/customerLogin");
			return;
		}

		request.setAttribute("customer", customer);
		String path = request.getRequestURI();
		if (path.endsWith("/orderHistory")) {
			OrderDAO orderDAO = new OrderDAO();
			List<Order> orders = orderDAO.getOrdersbyCustomerId(customer.getCustomerId());
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("/Customer/myOrderHistory.jsp").forward(request, response);
		} else if (path.endsWith("/orderHistory/orderDetail")) {
			String orderDetailId = request.getParameter("id");
			OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
			List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailByOrderID(orderDetailId);
			request.setAttribute("orderDetails", orderDetails);
			request.getRequestDispatcher("/Customer/myOrderDetail.jsp").forward(request, response);
		} else if (path.endsWith("/address")) {
			AddressDAO addressDAO = new AddressDAO();
			List<Address> addresses = addressDAO.getAddressesByCusId(customer.getCustomerId());
			request.setAttribute("addresses", addresses);
			request.getRequestDispatcher("/Customer/myAddress.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/Customer/myProfile.jsp").forward(request, response);
		}
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
