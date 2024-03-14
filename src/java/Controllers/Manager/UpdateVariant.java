/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Manager;

import DAOs.ProductVariantsDAO;
import Models.ProductVariant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class UpdateVariant extends HttpServlet {

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
			out.println("<title>Servlet updateVariant</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet updateVariant at " + request.getContextPath() + "</h1>");
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
		String proID = request.getParameter("VarID");
		ProductVariantsDAO dao = new ProductVariantsDAO();
		ProductVariant var = dao.getVariantByID(proID);
		request.setAttribute("var", var);
		request.getRequestDispatcher("/Manager/updateVariant.jsp").forward(request, response);
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
			ProductVariantsDAO dao = new ProductVariantsDAO();
			String varID = request.getParameter("varid");
			String proID = request.getParameter("proid");
			String Color = request.getParameter("color");
			String size_draw = request.getParameter("size");
			String stockQuaity_draw = request.getParameter("stockquantity");
			String isDelete_draw = request.getParameter("isdelete");

			try {
				int Size = Integer.parseInt(size_draw);
				int stockQuantity = Integer.parseInt(stockQuaity_draw);
				boolean isDelete = Boolean.parseBoolean(isDelete_draw);
				ProductVariant var = new ProductVariant(varID, Color, Size, stockQuantity, proID, isDelete);
				if (dao.UpdateVariant(var) == true) {
					session.setAttribute("success", "success");
					request.getRequestDispatcher("/productDetailInfor?proID=" + proID).forward(request, response);
				} else {
					session.setAttribute("error", "error");
					response.sendRedirect("/productmanagement");
				}
			} catch (Exception e) {
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
