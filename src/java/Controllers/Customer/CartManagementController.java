/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Customer;

import DAOs.CartDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import DAOs.ProductVariantsDAO;
import Models.Account;
import Models.Cart;
import Models.Customer;
import Models.Product;
import Models.ProductVariant;
import Utils.JwtUtils;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vinh Dev
 */
public class CartManagementController extends HttpServlet {

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
			throws ServletException, IOException, SQLException {
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
		response.setContentType("text/html;charset=UTF-8");
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
		HttpSession session = request.getSession();
		String path = request.getRequestURI();
		if (path.endsWith("/delete")) {
			String cartId = request.getParameter("cartId");
			CartDAO cartDAO = new CartDAO();
			int result = cartDAO.delete(cartId);
			if (result >= 1) {
				session.setAttribute("success", "Delete cart successful!");
			} else {
				session.setAttribute("error", "Delete cart failed!");
			}
			response.sendRedirect("/cartManagement");
			return;
		} else {
			CartDAO cartDAO = new CartDAO();
			List<Cart> carts = cartDAO.getCartByCusID(customer.getCustomerId());
			float total = 0;
			for (Cart cart : carts) {
				total += cart.getTotalPrice();
			}

			request.setAttribute("carts", carts);
			request.setAttribute("total", total);
			request.getRequestDispatcher("Customer/cart.jsp").forward(request, response);
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

		CartDAO cartDAO = new CartDAO();
		if (request.getParameter("reload") != null) {
			ProductDAO product = new ProductDAO();
			List<Cart> carts = cartDAO.getCartByCusID(customer.getCustomerId());
			float total = 0;
			for (Cart cart : carts) {
				total += cart.getTotalPrice();
			}

			Gson gson = new Gson();
			JsonObject job = new JsonObject();
			job.add("carts", gson.toJsonTree(carts));
			job.addProperty("total", total);
			response.getWriter().write(gson.toJson(job));
			return;
		}

		if (request.getParameter("updateQuantity") != null) {
			String cartId = request.getParameter("cartId");
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			Gson gson = new Gson();
			JsonObject job = new JsonObject();

			Cart cart = cartDAO.getCartByCartId(cartId);
			ProductVariantsDAO productVariantDAO = new ProductVariantsDAO();
			ProductVariant productVariant = productVariantDAO.getVariantByID(cart.getProductVariant().getVariantId());
			if (productVariant.getStockQuantity() < quantity) {
				job.addProperty("error", "Quantity is not enough!");
				response.getWriter().write(gson.toJson(job));
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				return;
			}
			ProductDAO productDAO = new ProductDAO();
			Product product = productDAO.getProductByID(productVariant.getProductId());
			float newTotalPrice = quantity * (product.getPrice() - product.getPrice() * 5 / 100);
			cart.setQuantity(quantity);
			cart.setTotalPrice(newTotalPrice);
			int result = cartDAO.update(cart);
			if (result >= 1) {
				job.addProperty("status", "success");
			} else {
				job.addProperty("status", "fail");

			}

			response.getWriter().write(gson.toJson(job));
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
