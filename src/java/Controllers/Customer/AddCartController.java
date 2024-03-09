/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Customer;

import DAOs.CartDAO;
import DAOs.CustomerDAO;
import Models.Account;
import Models.Cart;
import Models.Customer;
import Utils.JwtUtils;
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
        String productID = request.getParameter("pid");

        Cookie[] cookies = request.getCookies();
        Cookie loginCookie = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login")) {
                loginCookie = cookie;
            }
        }
        if (loginCookie != null) {
            response.sendRedirect("/login");
        }
        String username = JwtUtils.getUsernameFromToken(loginCookie.getValue());
        CustomerDAO customerDAO = new CustomerDAO();
        Customer a = customerDAO.getCustomerByUsername(username);
        request.setAttribute("customer", a);
        String accountID = a.getCustomerId();
        int amount = Integer.parseInt(request.getParameter("quantity"));

        String size = request.getParameter("size");
//
        CartDAO cart = new CartDAO();
        Cart cartExisted = cart.checkCartExist(accountID, productID);
        int amountExisted;
        String sizeExisted;
        if (cartExisted != null) {
            amountExisted = cartExisted.getQuantity();
            cart.editAmountAndSizeCart(accountID, productID, (amountExisted + amount));
            request.setAttribute("mess", "Da tang so luong san pham!");
            request.getRequestDispatcher("managerCart").forward(request, response);
        } else {
            cart.insertCart(accountID, productID, amount);
            request.setAttribute("mess", "Da them san pham vao gio hang!");
            request.getRequestDispatcher("managerCart").forward(request, response);
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
