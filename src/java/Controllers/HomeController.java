package Controllers;

import DAOs.CartDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import Models.Customer;
import Models.Product;
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
public class HomeController extends HttpServlet {

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
			out.println("<title>Servlet HomeController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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
			String username = JwtUtils.getUsernameFromToken(loginCookie.getValue());
			CustomerDAO customerDAO = new CustomerDAO();
			Customer customer = customerDAO.getCustomerByUsername(username);
			if (customer != null) {
				request.setAttribute("customer", customer);
			}
		}

		ProductDAO productDAO = new ProductDAO();
		List<Product> top3DiscountedProduct = productDAO.getTop3DiscountedProduct();
		request.setAttribute("top3DiscountedProduct", top3DiscountedProduct);

		List<Product> top8Product = productDAO.getTop8Product();
		request.setAttribute("top8Product", top8Product);

		List<Product> top3BestSeller = productDAO.getTop3BestSeller();
		request.setAttribute("top3BestSeller", top3BestSeller);

		request.getRequestDispatcher("index.jsp").forward(request, response);
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
