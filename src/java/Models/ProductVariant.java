package Models;

/**
 *
 * @author Duy
 */
public class ProductVariant {

    private String variantId;
    private String color;
    private int size;
    private int stockQuantity;
    private String productId;
    private int SumOfVariant;

    public ProductVariant() {
    }

    public ProductVariant(String productId, int SumOfVariant) {
        this.productId = productId;
        this.SumOfVariant = SumOfVariant;
    }

    public int getSumOfVariant() {
        return SumOfVariant;
    }

    public void setSumOfVariant(int SumOfVariant) {
        this.SumOfVariant = SumOfVariant;
    }

    public ProductVariant(String variantId, String color, int size, int stockQuantity, String productId) {
        this.variantId = variantId;
        this.color = color;
        this.size = size;
        this.stockQuantity = stockQuantity;
        this.productId = productId;
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

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
}
