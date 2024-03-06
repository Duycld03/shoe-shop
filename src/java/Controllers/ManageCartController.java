/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CartDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import Models.Account;
import Models.Cart;
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
public class ManageCartController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
         Cookie[] cookies = request.getCookies();
        Cookie loginCookie = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login")) {
                loginCookie = cookie;
            }
        }
        if (loginCookie == null) {
            response.sendRedirect("/login");
        }
        String username = JwtUtils.getUsernameFromToken(loginCookie.getValue());
        CustomerDAO customerDAO = new CustomerDAO();
        Customer a = customerDAO.getCustomerByUsername(username);
        request.setAttribute("customer", a);
        String accountID = a.getCustomerId();
        CartDAO cart = new CartDAO();
        ProductDAO product = new ProductDAO();
        ResultSet list = cart.getCartByAccountID(accountID);
        List<Product> list2 = product.getAllProducts();

        request.setAttribute("listCart", list);
        request.setAttribute("listProduct", list2);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
//        double totalMoney = 0;
//        while (list.next()) {
//            for (Product p : list2) {
//                if (list.getString(5)== p.getProductId()) {
//                    totalMoney = totalMoney + (p.getPrice() * list.getInt(2));
//                }
//            }
//        }
//
//        double totalMoneyVAT = totalMoney + totalMoney * 0.1;
//
//        PrintWriter out = response.getWriter();
//        out.println(" <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Tá»•ng tiá»�n hĂ ng</strong><strong>" + totalMoney + "</strong></li>\r\n"
//                + "                                        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">PhĂ­ váº­n chuyá»ƒn</strong><strong>Free ship</strong></li>\r\n"
//                + "                                        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">VAT</strong><strong>10 %</strong></li>\r\n"
//                + "                                        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Tá»•ng thanh toĂ¡n</strong>\r\n"
//                + "                                            <h5 class=\"font-weight-bold\">" + totalMoneyVAT + "</h5>\r\n"
//                + "                                        </li>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManageCartController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManageCartController.class.getName()).log(Level.SEVERE, null, ex);
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
