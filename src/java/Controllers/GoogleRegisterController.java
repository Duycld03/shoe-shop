/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Auth.UserGoogleDto;
import DAOs.CustomerDAO;
import Models.Customer;
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
public class GoogleRegisterController extends HttpServlet {

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
			out.println("<title>Servlet GoogleRegisterController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet GoogleRegisterController at " + request.getContextPath() + "</h1>");
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
		if (request.getSession().getAttribute("user") != null) {
			request.getRequestDispatcher("/googleRegister.jsp").forward(request, response);
		} else {
			response.sendRedirect("/");
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
		if (request.getParameter("btnRegister") != null) {
			UserGoogleDto user = (UserGoogleDto) request.getSession().getAttribute("user");
			String username = request.getParameter("username").toLowerCase();
			String password = request.getParameter("password");
			String phoneNumber = request.getParameter("phoneNumber");

			CustomerDAO customerDAO = new CustomerDAO();
			if (customerDAO.customerExist(username, username, phoneNumber) != null) {
				session.setAttribute("error", "Customer already exists");
				response.sendRedirect("/googleRegister");
				return;
			}
			String customerId = "Cus" + (customerDAO.getCustomerCount() + 1);
			Customer customer = new Customer(customerId, username, password, user.getEmail(), user.getName(), user.getId(), phoneNumber);
			int result = customerDAO.add(customer);
			if (result >= 1) {
				session.removeAttribute("user");
				session.setAttribute("success", "Google register successful!");
				response.sendRedirect("/customerLogin");
			} else {
				session.setAttribute("error", "Google register failed!");
				response.sendRedirect("/googleRegister");
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
