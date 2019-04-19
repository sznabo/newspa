package com.boyue.framework.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ben
 * @date   2012-12-8 上午11:24:31
 *
 */
public class ObjectUtil {

	/**
	 * 把对象的所有string属性都trim
	 * @param o
	 */
	public static void trimObjStringProperty(Object o) {
		try {
			if (o == null) {
				return;
			}
			Field[] fields = o.getClass().getDeclaredFields();
			for (Field field : fields) {
				if (field.getType().equals(String.class)) {
					if (field.getModifiers() == 25) {//25是 public static final
						continue;
					}
					String geter = "get" + StringUtils.capitalize(field.getName());
					String setter = "set" + StringUtils.capitalize(field.getName());
					Method getterMethod = null;
					Method setterMethod = null;
					try {
						getterMethod = o.getClass().getMethod(geter);
						setterMethod = o.getClass().getMethod(setter, String.class);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (getterMethod == null) {
						continue;
					}
					Object invokeResult = getterMethod.invoke(o, null);
					if (invokeResult != null) {
						setterMethod.invoke(o, invokeResult.toString().trim());
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
