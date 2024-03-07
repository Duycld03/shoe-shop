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
    private boolean isDelete;

    public ProductVariant() {
    }

    public ProductVariant(String productId, int SumOfVariant) {
        this.productId = productId;
        this.SumOfVariant = SumOfVariant;
    }

    public ProductVariant(String variantId, String color, int size, int stockQuantity, String productId) {
        this.variantId = variantId;
        this.color = color;
        this.size = size;
        this.stockQuantity = stockQuantity;
        this.productId = productId;
    }

    public ProductVariant(String variantId, String color, int size, int stockQuantity, String productId, boolean isDelete) {
        this.variantId = variantId;
        this.color = color;
        this.size = size;
        this.stockQuantity = stockQuantity;
        this.productId = productId;

        this.isDelete = isDelete;
    }

    public ProductVariant(String VarID, String Color, int size, int stockQuatity, String ProID, int size0, boolean delete) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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

    public boolean isDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public int getSumOfVariant() {
        return SumOfVariant;
    }

    public void setSumOfVariant(int SumOfVariant) {
        this.SumOfVariant = SumOfVariant;
    }
}
