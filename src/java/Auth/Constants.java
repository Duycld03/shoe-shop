package Auth;

/**
 *
 * @author Duy
 */
public class Constants {

	public static String GOOGLE_CLIENT_ID = "890248307249-p2bid9b832qnpvfnf05nins9pvoerjrt.apps.googleusercontent.com";

	public static String GOOGLE_CLIENT_SECRET = "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";

	public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/auth/LoginGoogleHandler";

	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

	public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
