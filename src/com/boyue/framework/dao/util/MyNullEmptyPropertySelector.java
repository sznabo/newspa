package com.boyue.framework.dao.util;

import org.hibernate.criterion.Example.PropertySelector;
import org.hibernate.type.Type;

/**
 *
 * @author ben
 * @date   2014-6-18 下午2:52:12
 *
 */
/**
 * Property selector that includes only properties that are not {@code null} and non-zero (if numeric)
 */
public  class MyNullEmptyPropertySelector implements PropertySelector {
	/**
	 * Singleton access
	 */
	public static final MyNullEmptyPropertySelector INSTANCE = new MyNullEmptyPropertySelector();

	@Override
	public boolean include(Object object, String propertyName, Type type) {
		if (object == null) {
			return false;
		}
		if ((object instanceof String) && (object.toString().equals(""))) {
			return false;
		}
		return true;
	}

	private Object readResolve() {
		return INSTANCE;
	}
}
