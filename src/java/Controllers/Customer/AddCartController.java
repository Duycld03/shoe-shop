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
import Utils.CreateID;
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

/**
 *
 * @author Vinh Dev
 */
public class AddCartController extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
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
		response.setContentType("application/json");

		Cookie[] cookies = request.getCookies();
		Cookie loginCookie = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("login")) {
				loginCookie = cookie;
			}
		}
		if (loginCookie == null) {
			response.sendRedirect("/customerLogin");
			return;
		}
		String username = JwtUtils.getContentFromToken(loginCookie.getValue());
		CustomerDAO customerDAO = new CustomerDAO();
		Customer customer = customerDAO.getCustomerByUsername(username);
		request.setAttribute("customer", customer);

		if (request.getParameter("addToCart") != null) {
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			int size = Integer.parseInt(request.getParameter("size"));
			String color = request.getParameter("color");
			String productId = request.getParameter("productId");

			ProductDAO productDAO = new ProductDAO();
			Product product = productDAO.getProductByID(productId);

			Gson gson = new Gson();
			JsonObject job = new JsonObject();

			CartDAO cartDAO = new CartDAO();
			ProductVariantsDAO productVariantDAO = new ProductVariantsDAO();
			String variantId = productVariantDAO.checkVariantExit(color, size, productId);
			Cart cartExisted = cartDAO.checkCartExist(customer.getCustomerId(), variantId);
			if (cartExisted != null) {
				int stockQuantity = cartExisted.getQuantity() + quantity;
				if (stockQuantity > cartExisted.getProductVariant().getStockQuantity()) {
//					response.sendRedirect("/product?proID=" + productId);
					job.addProperty("error", "Quantity is not enough!");
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					response.getWriter().write(gson.toJson(job));
					return;
				}
				cartExisted.setQuantity(stockQuantity);
				cartExisted.setTotalPrice(stockQuantity * product.getPrice());
				int result = cartDAO.update(cartExisted);
				if (result >= 1) {
					job.addProperty("success", "Add To Cart successful!");
				} else {
					job.addProperty("error", "Add To Cart failed!");
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					response.getWriter().write(gson.toJson(job));
					return;
				}
			} else {
				ProductVariant productVariant = productVariantDAO.getVariantByID(variantId);
				String cartId = CreateID.autoIncreaseID(cartDAO.getAllCartID(), "Cart");

				if (quantity > productVariant.getStockQuantity()) {
					job.addProperty("error", "Quantity is not enough!");
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					response.getWriter().write(gson.toJson(job));
					return;
				}
				Cart newCart = new Cart(cartId, quantity, quantity * product.getPrice(), customer.getCustomerId(), productVariant);
				int result = cartDAO.add(newCart);
				if (result >= 1) {
					job.addProperty("success", "Add To Cart successful!");
				} else {
					job.addProperty("error", "Add To Cart failed!");
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					response.getWriter().write(gson.toJson(job));
					return;
				}
			}
//			response.sendRedirect("/product?proID=" + productId);
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
