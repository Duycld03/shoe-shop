package Controllers.Common;

import DAOs.BrandDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import DAOs.ProductVariantsDAO;
import Models.Brand;
import Models.Customer;
import Models.Product;
import Models.ProductVariant;
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
 * @author Duy
 */
public class ProductFilterController extends HttpServlet {

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
			out.println("<title>Servlet ProductFilterController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ProductFilterController at " + request.getContextPath() + "</h1>");
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

		BrandDAO brandDAO = new BrandDAO();
		List<Brand> brandWithAmount = brandDAO.getBrandWithAmount();

		ProductVariantsDAO productVariantDAO = new ProductVariantsDAO();
		List<String> colors = productVariantDAO.getAllColor();
		request.setAttribute("brandWithAmount", brandWithAmount);
		request.setAttribute("colors", colors);

		request.getRequestDispatcher("/Common/filterProduct.jsp").forward(request, response);
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
		if (request.getParameter("getAllProduct") != null) {
			ProductDAO productDAO = new ProductDAO();
			List<Product> products = productDAO.getAllProducts();

			for (Product product : products) {
				BrandDAO brandDAO = new BrandDAO();
				Brand brand = brandDAO.getBrandById(product.getBrandId());
				product.setBrand(brand);

				ProductVariantsDAO productVariantsDAO = new ProductVariantsDAO();
				List<ProductVariant> productVariants = productVariantsDAO.getVariantByProID(product.getProductId());
				product.setProductVariants(productVariants);
			}
			response.getWriter().print(new Gson().toJson(products));
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
