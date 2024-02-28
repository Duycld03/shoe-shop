package Models;

/**
 *
 * @author Duy
 */
public class Customer {

	private String customerId;
	private String username;
	private String password;
	private String email;
	private String fullname;
	private String socialId;
	private String phoneNumber;

	public Customer() {
	}

	public Customer(String customerId, String username, String password, String email, String fullname, String socialId, String phoneNumber) {
		this.customerId = customerId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.fullname = fullname;
		this.socialId = socialId;
		this.phoneNumber = phoneNumber;
	}

	public Customer(String customerId, String username, String password, String email, String fullname, String phoneNumber) {
		this.customerId = customerId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.fullname = fullname;
		this.phoneNumber = phoneNumber;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getSocialId() {
		return socialId;
	}

	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

}
