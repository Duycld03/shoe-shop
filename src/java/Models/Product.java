package Models;

/**
 *
 * @author Duy
 */
public class Product {
    private String productId;
    private String productName;
    private float price;
    private float discount;
    private String description;
    private String brandId;
    private String isDelete;

    public Product(String productId, String productName, float price, float discount, String description,
            String brandId, String isDelete) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.brandId = brandId;
        this.isDelete = isDelete;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

}