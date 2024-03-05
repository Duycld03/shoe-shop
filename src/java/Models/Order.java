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
	private String PaymentStatus;
	private String orderStatus;
	private String customerId;
	private String paymentMethod;
	private String StaffID;

	public Order() {
	}

	public Order(String orderId, float totalAmount, Timestamp orderDate, String PaymentStatus, String orderStatus, String customerId, String paymentMethod, String StaffID) {
		this.orderId = orderId;
		this.totalAmount = totalAmount;
		this.orderDate = orderDate;
		this.PaymentStatus = PaymentStatus;
		this.orderStatus = orderStatus;
		this.customerId = customerId;
		this.paymentMethod = paymentMethod;
		this.StaffID = StaffID;
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
		return PaymentStatus;
	}

	public void setPaymentStatus(String PaymentStatus) {
		this.PaymentStatus = PaymentStatus;
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

	public String getStaffID() {
		return StaffID;
	}

	public void setStaffID(String StaffID) {
		this.StaffID = StaffID;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

}
