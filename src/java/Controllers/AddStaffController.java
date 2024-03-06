/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AdminDAO;
import DAOs.CustomerDAO;
import DAOs.StaffDAO;
import Models.Staff;
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
 * @author To Do Hong Y - CE171148
 */
public class AddStaffController extends HttpServlet {

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
        if (request.getParameter("btnAdd") != null) {
            HttpSession session = request.getSession();
            response.setContentType("text/html;charset=UTF-8");
            String susername = request.getParameter("username");
            String sfullname = request.getParameter("Fullname");
            String spassword = request.getParameter("password");
            String semail = request.getParameter("email");
            String sphonenumber = request.getParameter("phonenumber");
            StaffDAO staffDAO = new StaffDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            AdminDAO adminDAO = new AdminDAO();
            List<String> allStaffID = staffDAO.getAllStaffID();
            String idFormat = "ST";
            String staffID = CreateID.autoIncreaseID(allStaffID, idFormat);
            Staff staff = new Staff(staffID, susername, spassword, semail, sfullname, sphonenumber);
            if (customerDAO.getByEmail(semail) != null || staffDAO.getStaffByEmail(semail) != null || adminDAO.getAdminByEmail(semail) != null) {
                session.setAttribute("error", "Email already exists!");
                response.sendRedirect("/staffmanager");
                return;
            }
            if (customerDAO.getCustomerByPhoneNumber(sphonenumber) != null || staffDAO.getStaffByPhoneNumber(sphonenumber) != null || adminDAO.getAdminByPhoneNumber(sphonenumber) != null) {
                session.setAttribute("error", "Phone number already exists!");
                response.sendRedirect("/staffmanager");
                return;
            }
            if (customerDAO.getCustomerByUsername(susername) != null || staffDAO.getStaffByUsername(susername) != null || adminDAO.getAdminByUsername(susername) != null) {
                session.setAttribute("error", "Username already exists!");
                response.sendRedirect("/staffmanager");
                return;
            }
            staffDAO.addStaff(staff);
            session.setAttribute("success", "Staff Added!");
            response.sendRedirect("/staffmanager");
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
