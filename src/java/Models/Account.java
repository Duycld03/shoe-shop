/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Vinh Dev
 */
public class Account {

    private String CustomerID;
    private String UserName;
    private String Password;
    private String FullName;
    private String SocialId;
    private String PhoneNumber;

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getSocialId() {
        return SocialId;
    }

    public void setSocialId(String SocialId) {
        this.SocialId = SocialId;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    private String Email;

   

    public Account() {

    }

    @Override
    public String toString() {
        return "Account{" + "CustomerID=" + CustomerID + ", UserName=" + UserName + ", Password=" + Password + ", FullName=" + FullName + ", SocialId=" + SocialId + ", PhoneNumber=" + PhoneNumber + ", Email=" + Email + '}';
    }

}