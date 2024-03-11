/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Common;

import DAOs.BrandDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import DAOs.ProductVariantsDAO;
import Models.Brand;
import Models.Customer;
import Models.Product;
import Models.ProductImage;
import Models.ProductVariant;
import Utils.JwtUtils;
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
 * @author Duy
 */
public class ProductController extends HttpServlet {

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
			out.println("<title>Servlet ProductController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
		Cookie[] cookies = request.getCookies();
		Cookie loginCookie = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("login")) {
				loginCookie = cookie;
			}
		}
		if (loginCookie != null) {
			String username = JwtUtils.getContentFromToken(loginCookie.getValue());
			CustomerDAO customerDAO = new CustomerDAO();
			Customer customer = customerDAO.getCustomerByUsername(username);
			request.setAttribute("customer", customer);
		}

		String productID = request.getParameter("proID");
		ProductDAO proDao = new ProductDAO();
		BrandDAO br = new BrandDAO();
		ProductVariantsDAO var = new ProductVariantsDAO();
		Product pro = proDao.getProductByID(productID);// Select Product
		String BrandID = pro.getBrandId();// Lay brandID
		Brand brand = br.getBrandById(BrandID); // Select Brand
		List<Product> top4Relate = proDao.getTop4RelatePro(BrandID);// Select Top 4 relate
		List<ProductImage> img = proDao.getImages(productID);// Líst subImg
		List<ProductVariant> listVar = var.getVariantByProID(productID);// Select all Variant
		if (pro == null) {
			request.setAttribute("error", "Khong co du lieu");
		} else {
			request.setAttribute("product", pro);
			request.setAttribute("brand", brand);
			request.setAttribute("listVar", listVar);
			request.setAttribute("listImg", img);
			request.setAttribute("relateP", top4Relate);

		}
		request.getRequestDispatcher("/Common/productDetail.jsp").forward(request, response);
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
