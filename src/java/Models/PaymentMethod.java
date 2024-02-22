package Models;

/**
 *
 * @author Duy
 */
public class PaymentMethod {
    private String methodId;
    private String methodName;

    public PaymentMethod(String methodId, String methodName) {
        this.methodId = methodId;
        this.methodName = methodName;
    }

    public String getMethodId() {
        return methodId;
    }

    public void setMethodId(String methodId) {
        this.methodId = methodId;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }
}
