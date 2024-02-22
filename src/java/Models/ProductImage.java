package Models;

/**
 *
 * @author Duy
 */
public class ProductImage {
    private String imageId;
    private String imageURL;
    private boolean isPrimary;
    private String productId;

    public ProductImage(String imageId, String imageURL, boolean isPrimary, String productId) {
        this.imageId = imageId;
        this.imageURL = imageURL;
        this.isPrimary = isPrimary;
        this.productId = productId;
    }

    public boolean isPrimary() {
        return isPrimary;
    }

    public void setPrimary(boolean isPrimary) {
        this.isPrimary = isPrimary;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
}
