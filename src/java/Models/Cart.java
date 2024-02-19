package Models;

/**
 *
 * @author Duy
 */
public class Cart {
    private String cartId;
    private int quantity;
    private float totalPrice;

    public Cart(String cartId, int quantity, float totalPrice) {
        this.cartId = cartId;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
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

}
