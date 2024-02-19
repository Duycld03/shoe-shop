package Models;

/**
 *
 * @author Duy
 */
public class Address {
    private String addressId;
    private String city;
    private String addressDetail;

    public Address(String addressId, String city, String addressDetail) {
        this.addressId = addressId;
        this.city = city;
        this.addressDetail = addressDetail;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

}
