/**
 *
 */
package kr.letech.study.cmmn.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 암호 유틸리티 객체
 *
 * @author YSH
 *
 */
public class CrytoUtils {

	/**
	 * 비밀번호를 SHA-256으로 hash
	 * @param text 평문
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static String encrypt(String text) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(text.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}

		return CrytoUtils.bytesToHex(md.digest());
	}

	/**
	 * byte값은 Hex 문자열로 변환
	 * @param bytes
	 * @return
	 */
	private static String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}
}
