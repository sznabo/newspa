package com.boyue.framework.exception;

/**
 * @author ben
 * 2012-11-3 下午04:09:00
 * 非法数据
 */
public class IllegalDataException extends RuntimeException {

	public IllegalDataException() {
		super();
	}

	public IllegalDataException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		//super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public IllegalDataException(String message, Throwable cause) {
		super(message, cause);
	}

	public IllegalDataException(String message) {
		super(message);
	}

	public IllegalDataException(Throwable cause) {
		super(cause);
	}

	
}
