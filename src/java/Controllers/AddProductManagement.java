/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AdminDAO;
import DAOs.BrandDAO;
import DAOs.ProductDAO;
import DAOs.StaffDAO;
import Models.Admin;
import Models.Brand;
import Models.Product;
import Models.Staff;
import Utils.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class AddProductManagement extends HttpServlet {

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
            out.println("<title>Servlet AddProductManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductManagement at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

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
        StaffDAO staffDAO = new StaffDAO();
        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.getAdminByUsername(username);
        Staff staff = staffDAO.getStaffByUsername(username);
        if (admin == null && staff == null) {
            response.sendRedirect("/managerLogin");
            return;
        }
        String staffID = staff.getStaffId();
        ProductDAO dao = new ProductDAO();
        BrandDAO d = new BrandDAO();
        List<Brand> brands = d.getAllBrand();
        request.setAttribute("Brands", brands);
        request.getRequestDispatcher("addNewProduct.jsp").forward(request, response);
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
        if (request.getParameter("btnSave") != null) {
            ProductDAO dao = new ProductDAO();
            List<String> allproductID = dao.getAllProID();
            String idFormat = "P";
            String ProID = CreateID.autoIncreaseID(allproductID, idFormat);
            String productName = request.getParameter("productName");
            String price = request.getParameter("price");
            String discount = request.getParameter("discount");
            String description = request.getParameter("description");
            String brandId = request.getParameter("brandID");
            boolean isDeleted = false;
            try {
                float price_draw = Float.parseFloat(price);
                float discount_draw = Float.parseFloat(discount);
                Product pro = new Product(ProID, productName, price_draw, discount_draw, description, brandId, isDeleted);
                if (dao.checkProNameExit(productName)) {
                    request.setAttribute("NameError", "This product name was exited!");
                    request.setAttribute("Pro", pro);
                    request.getRequestDispatcher("addNewProduct.jsp").forward(request, response);
                } else if (dao.addProduct(pro) == true) {
                    session.setAttribute("success", "success");
                    response.sendRedirect("/productmanagement");
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
