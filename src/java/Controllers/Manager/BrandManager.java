/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Manager;

import DAOs.AdminDAO;
import DAOs.BrandDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Models.Brand;
import Models.Staff;
import Utils.JwtUtils;
import jakarta.servlet.RequestDispatcher;
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
 * @author To Do Hong Y - CE171148
 */
public class BrandManager extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
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
        request.setAttribute("admin", admin);
        request.setAttribute("staff", staff);
        BrandDAO c = new BrandDAO();
        List<Brand> list = c.getAllBrand();
        request.setAttribute("data", list);
        RequestDispatcher r = request.getRequestDispatcher("/Manager/brandmanager.jsp");
        r.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
