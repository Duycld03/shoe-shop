/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Manager;

import DAOs.ProductImageDAO;
import Models.ProductImage;
import Utils.CreateID;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
@MultipartConfig(maxFileSize = 20 * 1024 * 1024, // 20MB
        maxRequestSize = 20 * 1024 * 1024) // 20MB
public class AddProductImage extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductImage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductImage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        request.getRequestDispatcher("/Manager/addImage.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        if (request.getParameter("btnSave") != null) {
            ProductImageDAO dao = new ProductImageDAO();
            List<String> allimgID = dao.getAllImgID();
            String isFormat = "Image";
            String imgid = CreateID.autoIncreaseID(allimgID, isFormat);
            String proid = request.getParameter("proid");
            String isprimay_draw = request.getParameter("isprimary");

            try {
                boolean isPrimary = Boolean.parseBoolean(isprimay_draw);
                // Check if isPrimary already exists and update if needed
                String updateImgID = dao.checkIsprimary(proid, isPrimary);

                Part part = request.getPart("imgurl");
                String realPath = request.getServletContext().getRealPath("/images");
                String fileName = part.getSubmittedFileName();

                if (fileName.toLowerCase().endsWith(".jpg") || fileName.toLowerCase().endsWith(".png")) {
                    File imgDir = new File(realPath);
                    if (!imgDir.exists()) {
                        imgDir.mkdir();
                    }
                    part.write(realPath + "/" + fileName);
                    if (isPrimary == true) {
                        dao.removeisPrimaryImg(proid);
                    }
                    ProductImage img = new ProductImage(imgid, fileName, isPrimary, proid);

                    // Add product image and handle success/failure
                    if (dao.addProductImge(img)) {
                        session.setAttribute("success", "Add Image successs");
                        response.sendRedirect("/productDetailInfor?proID=" + proid);
                        return;
                    } else {
                        session.setAttribute("error", "Add Image failed");
                    }
                } else {
                    // Handle invalid file format
                    session.setAttribute("error", "Can not add this image. Invalid file format");

                }

            } catch (Exception e) {
                System.out.println(e.getMessage());
                session.setAttribute("error", "An error occurred while processing the request");
            }
            // Redirect back to the form with appropriate messages
            response.sendRedirect("addimage?ProID=" + proid);
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
