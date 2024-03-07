package Models;

import java.sql.Timestamp;

/**
 *
 * @author Duy
 */
public class Order {

	private String orderId;
	private float totalAmount;
	private Timestamp orderDate;
	private String paymentStatus;
	private String orderStatus;
	private String customerId;
	private String paymentMethod;
	private String staffId;

	public Order(String orderId, float totalAmount, Timestamp orderDate, String paymentStatus, String orderStatus,
			String customerId, String paymentMethod, String staffId) {
		this.orderId = orderId;
		this.totalAmount = totalAmount;
		this.orderDate = orderDate;
		this.paymentStatus = paymentStatus;
		this.orderStatus = orderStatus;
		this.customerId = customerId;
		this.paymentMethod = paymentMethod;
		this.staffId = staffId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

}
