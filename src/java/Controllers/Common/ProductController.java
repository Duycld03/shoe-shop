/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Common;

import DAOs.BrandDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import DAOs.ProductImageDAO;
import DAOs.ProductVariantsDAO;
import Models.Brand;
import Models.Customer;
import Models.Product;
import Models.ProductImage;
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
		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.getProductByID(productID);// Select Product

		//get Brand
		BrandDAO brandDAO = new BrandDAO();
		Brand brand = brandDAO.getBrandById(product.getBrandId());
		product.setBrand(brand);

		//get Variants
		ProductVariantsDAO productVariantsDAO = new ProductVariantsDAO();
		List<ProductVariant> productVariants = productVariantsDAO.getVariantByProID(product.getProductId());
		product.setProductVariants(productVariants);

		//get Images
		ProductImageDAO productImageDAO = new ProductImageDAO();
		List<ProductImage> images = productImageDAO.getImages(productID);
		product.setImages(images);

		List<Integer> sizeList = productVariantsDAO.getSizeByProID(productID);
		List<ProductVariant> variantBySize = productVariantsDAO.getVariantBySizeAndProId(sizeList.get(0), productID);
		List<Product> top4Relate = productDAO.getTop4RelatePro(product.getBrand().getBrandId());// Select Top 4 relate

		if (product == null) {
			request.setAttribute("error", "Khong co du lieu");
		} else {
			request.setAttribute("product", product);
			request.setAttribute("sizeList", sizeList);
			request.setAttribute("variantBySize", variantBySize);
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
		if (request.getParameter("getColorBySize") != null) {
			String productId = request.getParameter("productId");
			int size = Integer.parseInt(request.getParameter("size"));

			ProductVariantsDAO productVariantDAO = new ProductVariantsDAO();
			List<ProductVariant> variantBySize = productVariantDAO.getVariantBySizeAndProId(size, productId);

			Gson gson = new Gson();
			JsonObject job = new JsonObject();
			job.add("data", gson.toJsonTree(variantBySize));

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
