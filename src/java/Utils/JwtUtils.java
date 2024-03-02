package Utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JwtUtils {

	private static final String SECRET_KEY = "c94dadc33df8e469b456b5e7da220aafd3a39190904270ad2d580aa6aef08f79";

	public static String generateToken(String content) {
		String token = Jwts.builder()
				.setSubject(content)
				.signWith(SignatureAlgorithm.HS256, SECRET_KEY)
				.compact();
		return token;
	}

	public static String getContentFromToken(String token) {
		try {
			Claims claims = Jwts.parser()
					.setSigningKey(SECRET_KEY)
					.parseClaimsJws(token)
					.getBody();
			return claims.getSubject();
		} catch (Exception e) {
			return "";
		}
	}
}
