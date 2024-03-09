/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Manager;

import DAOs.AdminDAO;
import DAOs.ProductDAO;
import DAOs.ProductVariantsDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Models.Product;
import Models.ProductVariant;
import Models.Staff;
import Utils.JwtUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class ProductManagement extends HttpServlet {

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
			out.println("<title>Servlet ProductManagement</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ProductManagement at " + request.getContextPath() + "</h1>");
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
		StaffDAO staffDAO = new StaffDAO();
		Staff staff = staffDAO.getStaffByUsername(username);
		if (admin == null && staff == null) {
			response.sendRedirect("/managerLogin");
			return;
		}
		request.setAttribute("admin", admin);
		request.setAttribute("staff", staff);
		ProductDAO proD = new ProductDAO();
		ProductVariantsDAO varD = new ProductVariantsDAO();
		String proID = request.getParameter("ProID");
		if (proID != null) {
			List<ProductVariant> listVar = varD.getVariantByProID(proID);
		}
		List<ProductVariant> varS = varD.getAllVariants();
		List<Product> pros = proD.getAllProManagement();

		request.setAttribute("ProList", pros);
		request.getRequestDispatcher("/Manager/productList.jsp").forward(request, response);

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
