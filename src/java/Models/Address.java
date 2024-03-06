/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Doan Thanh Phuc - CE170580
 */
public class Address {

    private String addressId;
    private String city;
    private String addressDetail;
    private String customerId;
    private boolean isPrimary;

    public Address() {
    }

    public Address(String addressId, String city, String addressDetail, String customerId, boolean isPrimary) {
        this.addressId = addressId;
        this.city = city;
        this.addressDetail = addressDetail;
        this.customerId = customerId;
        this.isPrimary = isPrimary;
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

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public boolean isPrimary() {
        return isPrimary;
    }

    public void setIsPrimary(boolean isPrimary) {
        this.isPrimary = isPrimary;
    }

    @Override
    public String toString() {
        return "Address{" + "addressId=" + addressId + ", city=" + city + ", addressDetail=" + addressDetail + ", customerId=" + customerId + ", isPrimary=" + isPrimary + '}';
    }
}
