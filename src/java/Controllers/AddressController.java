package Controllers;

import DAOs.AddressDAO;
import DAOs.CustomerDAO;
import Models.Address;
import Models.Customer;
import Utils.JwtUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Duy
 */
public class AddressController extends HttpServlet {

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
			out.println("<title>Servlet AddressController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet AddressController at " + request.getContextPath() + "</h1>");
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

		String path = request.getRequestURI();
		HttpSession session = request.getSession();
		AddressDAO addressDAO = new AddressDAO();
		if (path.endsWith("/delete")) {
			String id = request.getParameter("id");
			int result = addressDAO.deleteById(id);
			if (result >= 1) {
				session.setAttribute("success", "Delete Address Successful!");
			} else {
				session.setAttribute("error", "Delete Address Failed!");
			}
			response.sendRedirect("/profile/address");
		} else if (path.endsWith("setPrimary")) {
			String addressId = request.getParameter("id");
			addressDAO.removePrimaryByCustomerId(customer.getCustomerId());
			addressDAO.setPrimaryByAddressId(addressId);
			response.sendRedirect("/profile/address");
		} else {
			response.sendRedirect("/profile/address");
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
		HttpSession session = request.getSession();
		if (request.getParameter("btnAdd") != null) {
			String city = request.getParameter("city");
			String addressDetail = request.getParameter("addressDetail").replaceAll("\\r?\\n", " ").trim();
			String customerId = request.getParameter("customerId");

			AddressDAO addressDAO = new AddressDAO();
			String addressId = "Ad" + (addressDAO.getAddressCount() + 1);
			Address address = new Address(addressId, city, addressDetail, customerId, false);
			int result = addressDAO.add(address);
			if (result >= 1) {
				session.setAttribute("success", "Add Address Successful!");
			} else {
				session.setAttribute("error", "Add Address Failed!");
			}
			response.sendRedirect("/profile/address");
			return;
		}

		if (request.getParameter("btnSave") != null) {
			String city = request.getParameter("city");
			String addressDetail = request.getParameter("addressDetail").replaceAll("\\r?\\n", " ").trim();
			String customerId = request.getParameter("customerId");
			String addressId = request.getParameter("addressId");

			AddressDAO addressDAO = new AddressDAO();
			Address address = new Address(addressId, city, addressDetail, customerId, false);
			int result = addressDAO.updateAddress(address);
			if (result >= 1) {
				session.setAttribute("success", "Update Address Successful!");
			} else {
				session.setAttribute("error", "Update Address Failed!");
			}
			response.sendRedirect("/profile/address");
			return;
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
