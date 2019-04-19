package com.boyue.framework.security;

public class SecurityUtils {

	/**
	 * 用bcrypt算法加密
	 * @param password
	 * @return
	   * 　bcrypt是专门为密码存储而设计的算法，基于Blowfish加密算法变形而来，由Niels Provos和David Mazières发表于1999年的USENIX。
　　   * bcrypt最大的好处是有一个参数（work factor)，可用于调整计算强度，而且work factor是包括在输出的摘要中的。随着攻击者计算能力的提高，使用者可以逐步增大work factor，而且不会影响已有用户的登陆。
　　   * bcrypt经过了很多安全专家的仔细分析，使用在以安全著称的OpenBSD中，一般认为它比PBKDF2更能承受随着计算能力加强而带来的风险。bcrypt也有广泛的函数库支持，因此我们建议使用这种方式存储密码
	 */
	public static String encryp2bcrypt(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}
	
	/**
	 * 用明文密码匹配bcrypt的密文
	 * @param password
	 * @param encrypPwd
	 * @return
	 */
	public static boolean match2bcrypt(String password, String encrypPwd) {
		return BCrypt.checkpw(password, encrypPwd);
	}
	
	public static String encryp2Md5(String text) throws SecurityException {
		return MD5.encrypt2Str(text);
	}
	
	public static void main(String[] args) {
		String e = SecurityUtils.encryp2bcrypt("kenshin");
		System.out.println(SecurityUtils.match2bcrypt("kenshin", e));
	}
}
