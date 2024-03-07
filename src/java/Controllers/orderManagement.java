/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AdminDAO;
import DAOs.OrderDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Models.Order;
import Models.Staff;
import Utils.JwtUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import java.util.List;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class OrderManagement extends HttpServlet {

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
            out.println("<title>Servlet orderManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderManagement at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        Cookie managerCookie = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("manager")) {
                managerCookie = cookie;
            }
        }
        if (managerCookie == null) {
            response.sendRedirect("/managerLogin");
            return;
        }
        String username = JwtUtils.getContentFromToken(managerCookie.getValue());
        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.getAdminByUsername(username);
        StaffDAO staffDAO = new StaffDAO();
        Staff staff = staffDAO.getStaffByUsername(username);
        if (admin == null && staff == null) {
            response.sendRedirect("/managerLogin");
            return;
        }
        HttpSession session = request.getSession();
        OrderDAO orderD = new OrderDAO();

        if (staff != null) {
            String staffID = staff.getStaffId();
            request.setAttribute("staff", staff);
            String orderID = request.getParameter("OrderID");
            if (orderD.updateTakeCareStaff(staffID, orderID) == true) {
                request.setAttribute("StaffID_Check", staffID);
            } else {
                request.setAttribute("error", "false");
            }
            //Lay orderID khi order thanh cong
            String orderID_draw = request.getParameter("OrderID");
            String status = request.getParameter("status");
            if (orderID_draw != null && status != null) {
                orderD.updateOrderStatus(orderID_draw, status);
                if (status.equalsIgnoreCase("Success")) {
                    session.setAttribute("success", "The order has been successful");
                } else {
                    session.setAttribute("error", "The order has been cancelled");
                }
            } else if (orderID_draw != null) {
                orderD.updateTakeCareStaff(staffID, orderID);
            }
            List<Order> list = orderD.getOrderbyStaffID(staffID);
            request.setAttribute("Orders", list);
        } else {
            request.setAttribute("admin", admin);
            List<Order> list = orderD.getAllOrder();
            request.setAttribute("Orders", list);
            System.out.println("Chay vao admin");
        }
        request.getRequestDispatcher("orderList.jsp").forward(request, response);
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
