package Models;

/**
 *
 * @author Duy
 */
public class Cart {

	private String cartId;
	private int quantity;
	private float totalPrice;
	private String customerId;
	private ProductVariant productVariant;

	public Cart(String cartId, int quantity, float totalPrice, String customerId, ProductVariant productVariant) {
		this.cartId = cartId;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.customerId = customerId;
		this.productVariant = productVariant;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public ProductVariant getProductVariant() {
		return productVariant;
	}

	public void setProductVariant(ProductVariant productVariant) {
		this.productVariant = productVariant;
	}

}
