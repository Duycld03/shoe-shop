package Models;

/**
 *
 * @author Duy
 */
public class Brand {

    private String brandId;
    private String brandName;
    private int amount;

    public Brand(String brandId, String brandName, int amount) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.amount = amount;
    }

    public Brand(String brandId, String brandName) {
        this.brandId = brandId;
        this.brandName = brandName;
    }

    public Brand() {

    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}
