package Models;

import java.util.List;

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
    private boolean isDeleted;
    private ProductImage primaryImage;
    private List<ProductImage> images;
    private Brand brand;
    private List<ProductVariant> productVariants;

    public Product() {
    }

    public Product(String productId, String productName, float price, float discount, String description,
            String brandId, boolean isDeleted, ProductImage primaryImage, List<ProductImage> images) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.brandId = brandId;
        this.isDeleted = isDeleted;
        this.primaryImage = primaryImage;
        this.images = images;
    }

    public Product(String productId, String productName, float price, float discount, String description,
            String brandId, boolean isDeleted, ProductImage primaryImage) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.brandId = brandId;
        this.isDeleted = isDeleted;
        this.primaryImage = primaryImage;
    }

    public Product(String productId, String productName, float price, float discount, String description,
            String brandId, boolean isDeleted) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.brandId = brandId;
        this.isDeleted = isDeleted;
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

    public ProductImage getPrimaryImage() {
        return primaryImage;
    }

    public void setPrimaryImage(ProductImage primaryImage) {
        this.primaryImage = primaryImage;
    }

    public List<ProductImage> getImages() {
        return images;
    }

    public void setImages(List<ProductImage> images) {
        this.images = images;
    }

    public boolean getIsDelete() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public List<ProductVariant> getProductVariants() {
        return productVariants;
    }

    public void setProductVariants(List<ProductVariant> productVariants) {
        this.productVariants = productVariants;
    }
}
