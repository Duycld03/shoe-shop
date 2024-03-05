package VNPay;

import DAOs.OrderDAO;
import Models.Order;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Duy
 */
public class VNPayReturn extends HttpServlet {

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
			out.println("<title>Servlet VNPayReturn</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet VNPayReturn at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
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

		// Begin process return from VNPAY
		Map fields = new HashMap();
		for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
			String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
			String fieldValue = URLEncoder.encode(request.getParameter(fieldName),
					StandardCharsets.US_ASCII.toString());
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				fields.put(fieldName, fieldValue);
			}
		}

		String vnp_SecureHash = request.getParameter("vnp_SecureHash");
		if (fields.containsKey("vnp_SecureHashType")) {
			fields.remove("vnp_SecureHashType");
		}
		if (fields.containsKey("vnp_SecureHash")) {
			fields.remove("vnp_SecureHash");
		}
		String signValue = Config.hashAllFields(fields);

		// check signature
		if (signValue.equals(vnp_SecureHash)) {
			String amount = request.getParameter("vnp_Amount");
			String customerId = request.getParameter("vnp_OrderInfo");
			String resCode = request.getParameter("vnp_ResponseCode");
			String transactionNo = request.getParameter("vnp_TransactionNo");
			String bankCode = request.getParameter("vnp_BankCode");
			String payDate = request.getParameter("vnp_PayDate");
			try {
				int amountDraw = Integer.parseInt(amount) / (24500 * 100);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				Date date = sdf.parse(payDate);
				Timestamp timestamp = new Timestamp(date.getTime());
				if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
					OrderDAO orderDAO = new OrderDAO();
					Order newOrder = new Order(transactionNo, amountDraw, timestamp, "Paid", "Processing", customerId, "VNPay", null);
					orderDAO.addOrder(newOrder);
					request.getSession().setAttribute("checkoutSuccess", "Payment Success!");
					response.sendRedirect("/");
				} else {
					request.getSession().setAttribute("error", "erorr");
					// chuyen ve cart page
					response.sendRedirect("/");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

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
		processRequest(request, response);
	}

}
