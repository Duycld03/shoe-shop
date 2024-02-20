package Models;

/**
 *
 * @author Duy
 */
public class Admin {
    private String adminId;
    private String username;
    private String password;
    private String email;
    private String fullname;

    public Admin(String adminId, String username, String password, String email, String fullname) {
        this.adminId = adminId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
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
}
