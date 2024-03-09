/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Manager;

import DAOs.ProductImageDAO;
import Models.ProductImage;
import Utils.CreateID;
import com.google.gson.Gson;
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
public class UpdateImage extends HttpServlet {

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
            out.println("<title>Servlet UpdateImage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateImage at " + request.getContextPath() + "</h1>");
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
        ProductImageDAO dao = new ProductImageDAO();
        String imgid = request.getParameter("ImgID");
        ProductImage img = dao.getImageByID(imgid);
        request.setAttribute("img", img);
        request.getRequestDispatcher("/Manager/UpdateImage.jsp").forward(request, response);
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
        System.out.println(new Gson().toJson(request.getParameterMap()));
        if (request.getParameter("btnSave") != null) {
            ProductImageDAO dao = new ProductImageDAO();
            String imgid = request.getParameter("imgid");
            String proid = request.getParameter("proid");
            String isprimay_draw = request.getParameter("isprimary");

            try {
                boolean isPrimary = Boolean.parseBoolean(isprimay_draw);
                // Check if isPrimary already exists and update if needed

                Part part = request.getPart("imgurl");
                String fileName;
                System.out.println("Ngoài check part");
                if (part != null && part.getSize() > 0) {
                    String realPath = request.getServletContext().getRealPath("/images");
                    fileName = part.getSubmittedFileName();
                    if (fileName.toLowerCase().endsWith(".jpg") || fileName.toLowerCase().endsWith(".png")) {
                        File imgDir = new File(realPath);
                        if (!imgDir.exists()) {
                            imgDir.mkdir();
                        }
                        part.write(realPath + "/" + fileName);
                    } else {
                        // Handle invalid file format
                        session.setAttribute("error", "Can not add this image. Invalid file format");

                    }
                    System.out.println("update image " + fileName);
                } else {
                    ProductImage getImg = dao.getImageByID(imgid);
                    fileName = getImg.getImageURL();
                }
                if (isPrimary) {
                    dao.removeisPrimaryImg(proid);
                }
                ProductImage img = new ProductImage(imgid, fileName, isPrimary, proid);

                // Add product image and handle success/failure
                if (dao.updateImage(img)) {
                    session.setAttribute("success", "Update Image successs");
                    if (dao.checkIsprimary(proid, true) == null) {
                        String newPrimary = dao.randomImg(proid);
                        dao.UpdateIsPrimary(newPrimary);
                    }
                    response.sendRedirect("/productDetailInfor?proID=" + proid);
                    return;
                } else {
                    session.setAttribute("error", "Update Image failed");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                session.setAttribute("error", "An error occurred while processing the request");
            }
            // Redirect back to the form with appropriate messages
            response.sendRedirect("updateimage?ProID=" + proid);
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
