package Models;

/**
 *
 * @author Duy
 */
public class OrderDetail {

    private String orderDetailId;
    private float price;
    private int quantity;
    private String orderId;
    private String variantId;
    private ProductVariant productVariant;

    public OrderDetail(String orderDetailId, float price, int quantity, String orderId, String variantId, ProductVariant productVariant) {
        this.orderDetailId = orderDetailId;
        this.price = price;
        this.quantity = quantity;
        this.orderId = orderId;
        this.variantId = variantId;
        this.productVariant = productVariant;
    }

    public ProductVariant getProductVariant() {
        return productVariant;
    }

    public void setProductVariant(ProductVariant productVariant) {
        this.productVariant = productVariant;
    }

    public OrderDetail() {
    }

    public OrderDetail(String orderDetailId, float price, int quantity, String orderId, String variantId) {
        this.orderDetailId = orderDetailId;
        this.price = price;
        this.quantity = quantity;
        this.orderId = orderId;
        this.variantId = variantId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getVariantId() {
        return variantId;
    }

    public void setVariantId(String variantId) {
        this.variantId = variantId;
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
