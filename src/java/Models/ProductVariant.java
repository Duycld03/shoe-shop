package Models;

/**
 *
 * @author Duy
 */
public class ProductVariant {
    private String variantId;
    private String color;
    private float price;
    private int size;
    private float discount;
    private int stockQuantity;

    public ProductVariant(String variantId, String color, float price, int size, float discount, int stockQuantity) {
        this.variantId = variantId;
        this.color = color;
        this.price = price;
        this.size = size;
        this.discount = discount;
        this.stockQuantity = stockQuantity;
    }

    public String getVariantId() {
        return variantId;
    }

    public void setVariantId(String variantId) {
        this.variantId = variantId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }
}
