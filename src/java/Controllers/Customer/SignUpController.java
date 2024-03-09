package Controllers.Customer;

import DAOs.AddressDAO;
import DAOs.AdminDAO;
import DAOs.CustomerDAO;
import DAOs.ProductDAO;
import DAOs.StaffDAO;
import Models.Address;
import Models.Customer;
import Utils.CreateID;
import Utils.JwtUtils;
import Utils.VerifyRecaptcha;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Duy
 */
public class SignUpController extends HttpServlet {

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
            out.println("<title>Servlet SignUpController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpController at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        Cookie loginCookie = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login")) {
                loginCookie = cookie;
            }
        }

        if (loginCookie != null) {
            String username = JwtUtils.getContentFromToken(loginCookie.getValue());
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomerByUsername(username);
            if (customer != null) {
                response.sendRedirect("/");
            } else {
                request.getRequestDispatcher("/Customer/signup.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/Customer/signup.jsp").forward(request, response);
        }

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
        if (request.getParameter("btnSignUp") != null) {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String username = request.getParameter("username").toLowerCase();
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String city = request.getParameter("city");
            String addressDetail = request.getParameter("addressDetail");
            String recaptcha = request.getParameter("g-recaptcha-response");

            boolean verify = VerifyRecaptcha.verify(recaptcha);
            if (!verify) {
                session.setAttribute("error", "Recaptcha verification failed");
                response.sendRedirect("/signUp");
                return;
            }

            CustomerDAO customerDAO = new CustomerDAO();
            StaffDAO staffDAO = new StaffDAO();
            AdminDAO adminDAO = new AdminDAO();

            if (customerDAO.getByEmail(email) != null || staffDAO.getStaffByEmail(email) != null
                    || adminDAO.getAdminByEmail(email) != null) {
                session.setAttribute("error", "Email already exists!");
                response.sendRedirect("/signUp");
                return;
            }
            if (customerDAO.getCustomerByPhoneNumber(phoneNumber) != null
                    || staffDAO.getStaffByPhoneNumber(phoneNumber) != null
                    || adminDAO.getAdminByPhoneNumber(phoneNumber) != null) {
                session.setAttribute("error", "Phone number already exists!");
                response.sendRedirect("/signUp");
                return;
            }
            if (customerDAO.getCustomerByUsername(username) != null || staffDAO.getStaffByUsername(username) != null
                    || adminDAO.getAdminByUsername(username) != null) {
                session.setAttribute("error", "Username already exists!");
                response.sendRedirect("/signUp");
                return;
            }
            List<String> allCusID = customerDAO.getAllCusID();
            String idFormat = "Cus";
            String customerId = CreateID.autoIncreaseID(allCusID, idFormat);
            Customer customer = new Customer(customerId, username, password, email, fullname, phoneNumber);
            int result = customerDAO.add(customer);
            if (result >= 1) {
                AddressDAO addressDAO = new AddressDAO();
                List<String> allAddressId = addressDAO.getAllAddressID();
                String idFormatAddress = "Ad";
                String addressId = CreateID.autoIncreaseID(allAddressId, idFormatAddress);
                Address address = new Address(addressId, city, addressDetail, customerId, true);
                int addressResult = addressDAO.add(address);
                if (addressResult >= 1) {
                    session.setAttribute("success", "Sign in successful!");
                    response.sendRedirect("/customerLogin");
                } else {
                    session.setAttribute("error", "Sign in failed!");
                    response.sendRedirect("/signUp");
                }

            } else {
                session.setAttribute("error", "Sign in failed!");
                response.sendRedirect("/signUp");
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
    }

}
