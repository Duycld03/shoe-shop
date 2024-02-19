package Models;

/**
 *
 * @author Duy
 */
public class Product {
    private String productId;
    private String proName;
    private String description;

    public Product(String productId, String proName, String description) {
        this.productId = productId;
        this.proName = proName;
        this.description = description;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
