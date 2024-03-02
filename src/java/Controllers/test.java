/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AdminDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import DAOs.StaffDAO;
import Models.Product;
import Models.ProductImage;
import Utils.MD5;
import Utils.*;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duy
 */
public class test extends HttpServlet {

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
			out.println("<title>Servlet test</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet test at " + request.getContextPath() + "</h1>");
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
//		ProductDAO pDAO = new ProductDAO();
//		List<ProductImage> images = pDAO.getImages("P001");
//		for (ProductImage image : images) {
//			System.out.println(image.getImageURL());
//		}
//		System.out.println(pDAO.getPrimaryImage("P001").getImageURL());
//		System.out.println(MD5.getMd5("duy"));
//		AdminDAO aDAO = new AdminDAO();
//		System.out.println(aDAO.checkLogin("DuyNT", "12345"));

//		StaffDAO sDAO = new StaffDAO();
//		System.out.println(sDAO.checkLogin("DuyNT", "12345"));
		CustomerDAO cDAO = new CustomerDAO();
//		System.out.println(cDAO.checkLogin("DuyNT", "12345"));
//		String token = JwtUtils.generateToken("duycld03");
//		System.out.println(token);
//		System.out.println(JwtUtils.getUsernameFromToken(token));
		System.out.println(cDAO.getCustomerByPhoneNumber("0988309190"));

		System.out.println(cDAO.getCustomerCount());
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
