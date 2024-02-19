package Models;

/**
 *
 * @author Duy
 */
public class ProductImage {
    private String imageId;
    private String imageURL;

    public ProductImage(String imageId, String imageURL) {
        this.imageId = imageId;
        this.imageURL = imageURL;
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
