/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AdminDAO;
import DAOs.CustomerDAO;
import DAOs.StaffDAO;
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
 * @author To Do Hong Y - CE171148
 */
public class UpdateCustomerController extends HttpServlet {

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
			out.println("<title>Servlet UpdateCustomerController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet UpdateCustomerController at " + request.getContextPath() + "</h1>");
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
		String id_raw = request.getParameter("id");
		CustomerDAO cDAO = new CustomerDAO();
		Customer c = cDAO.getCustomerById(id_raw);
		request.setAttribute("category", c);
		request.getRequestDispatcher("updatecustomer.jsp").forward(request, response);
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
		if (request.getParameter("btnSave") != null) {
			HttpSession session = request.getSession();
			String id_raw = request.getParameter("id");
			String susername = request.getParameter("username");
			String sfullname = request.getParameter("Fullname");
			String spassword = request.getParameter("password");
			String semail = request.getParameter("email");
			String sphonenumber = request.getParameter("phonenumber");
			CustomerDAO customerDAO = new CustomerDAO();
			AdminDAO adminDAO = new AdminDAO();
			StaffDAO staffDAO = new StaffDAO();
			Customer customer = customerDAO.getCustomerById(id_raw);

			if (!customer.getEmail().equals(semail) && (customerDAO.getByEmail(semail) != null || staffDAO.getStaffByEmail(semail) != null || adminDAO.getAdminByEmail(semail) != null)) {
				session.setAttribute("error", "Email already exists!");
				response.sendRedirect("/customermanager");
				return;
			}

			if (!customer.getPhoneNumber().equals(sphonenumber) && (customerDAO.getCustomerByPhoneNumber(sphonenumber) != null || staffDAO.getStaffByPhoneNumber(sphonenumber) != null || adminDAO.getAdminByPhoneNumber(sphonenumber) != null)) {
				session.setAttribute("error", "Phone number already exists!");
				response.sendRedirect("/customermanager");
				return;
			}

			if (!customer.getUsername().equals(susername) && (customerDAO.getCustomerByUsername(susername) != null || staffDAO.getStaffByUsername(susername) != null || adminDAO.getAdminByUsername(susername) != null)) {
				session.setAttribute("error", "Username already exists!");
				response.sendRedirect("/customermanager");
				return;
			}
			Customer newCustomer = new Customer(id_raw, susername, spassword, semail, sfullname, sphonenumber);
			if (!customer.getEmail().equals(semail)) {
				newCustomer.setSocialId("");

			}
			if (spassword.isEmpty()) {
				customerDAO.updateCustomerWithoutPassword(newCustomer);
				session.setAttribute("success", "Update successful!");
				response.sendRedirect("/customermanager");
			} else {
				customerDAO.updateCustomerwithoutSociaID(newCustomer);
				session.setAttribute("success", "Update successful!");
				response.sendRedirect("/customermanager");
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
