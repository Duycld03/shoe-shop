/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ProductVariantsDAO;
import Models.ProductVariant;
import Utils.CreateID;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class AddVariant extends HttpServlet {

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
			out.println("<title>Servlet addVariant</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet addVariant at " + request.getContextPath() + "</h1>");
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
		processRequest(request, response);
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
		HttpSession session = request.getSession();
		ProductVariantsDAO dao = new ProductVariantsDAO();
		String isFormat = "Var";
		List<String> allproductID = dao.getAllVarinatID();
		String VarID = CreateID.autoIncreaseID(allproductID, isFormat);
		String Color = request.getParameter("color");
		String size_draw = request.getParameter("size");
		String stockQuaity_draw = request.getParameter("stockquantity");
		boolean isDelete = false;
		String ProID = request.getParameter("proid");
		int stockQuatity = 0;
		int size = 0;
		try {
			stockQuatity = Integer.parseInt(stockQuaity_draw);
			size = Integer.parseInt(size_draw);
			ProductVariant var = new ProductVariant(VarID, Color, size, stockQuatity, ProID, isDelete);
			if (dao.checkVariantExit(Color, size, ProID) != null) {
				String varUpate = dao.checkVariantExit(Color, size, ProID);
				ProductVariant newVariant = dao.getVariantByID(varUpate);

				if (dao.UpdateStockVar(varUpate, stockQuatity + newVariant.getStockQuantity()) == true) {
					session.setAttribute("success", "Update Stock Quantity of " + newVariant.getVariantId());
					response.sendRedirect("/productmanagement");
				} else {
					session.setAttribute("error", "can not update stock variant " + newVariant.getVariantId());
					response.sendRedirect("/productmanagement");
				}
			} else {
				if (dao.addVariant(var) == true) {
					session.setAttribute("success", "add new variant success");
					request.getRequestDispatcher("/productDetailInfor?proID=" + ProID).forward(request, response);
				} else {
					session.setAttribute("error", "add new variant failed");
					request.getRequestDispatcher("/productDetailInfor?proID=" + ProID).forward(request, response);
				}
			}
		} catch (Exception e) {

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
