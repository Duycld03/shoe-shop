package Models;

/**
 *
 * @author Duy
 */
public class OrderDetail {
    private String orderDetailId;
    private float price;
    private int quantity;

    public OrderDetail(String orderDetailId, float price, int quantity) {
        this.orderDetailId = orderDetailId;
        this.price = price;
        this.quantity = quantity;
    }

    public String getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(String orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
