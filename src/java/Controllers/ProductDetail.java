/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.BrandDAO;
import DAOs.ProductDAO;
import DAOs.ProductVariantsDAO;
import Models.Product;
import Models.Brand;
import Models.ProductVariant;
import Models.ProductImage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class ProductDetail extends HttpServlet {

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
            out.println("<title>Servlet ProductDetailInfor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailInfor at " + request.getContextPath() + "</h1>");
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
        String ProductID = request.getParameter("proID");
        String proID = "P1";
        ProductDAO proDao = new ProductDAO();
        BrandDAO br = new BrandDAO();
        ProductVariantsDAO var = new ProductVariantsDAO();
        Product pro = proDao.getProductByID(proID);//Select Product
        String BrandID = pro.getBrandId();//Lay brandID
        Brand brand = br.getBrandById(BrandID); // Select Brand
        List<Product> top4Relate = proDao.getTop4RelatePro(BrandID);//Select Top 4 relate
        List<ProductImage> img = proDao.getImages(proID);//Líst subImg
        List<ProductVariant> listVar = var.getVariantByProID(proID);//Select all Variant
        if (pro == null) {
            request.setAttribute("error", "Khong co du lieu");
        } else {
            request.setAttribute("product", pro);
            request.setAttribute("brand", brand);
            request.setAttribute("listVar", listVar);
            request.setAttribute("listImg", img);
            request.setAttribute("relateP", top4Relate);

        }
        request.getRequestDispatcher("/productDetail.jsp").forward(request, response);
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
