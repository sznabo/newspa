package test.com.boyue.ad.service;

import java.lang.reflect.Method;

import com.boyue.karaoke.model.AppInfo;

/**
 *
 * @author ben
 * @date   2014-6-23 下午3:36:08
 *
 */
public class ClassUt {

	public static void main(String[] args) {
		String modelName = "appInfo";
		Class c = AppInfo.class;
		Method[] methods = c.getDeclaredMethods();
		for (Method method : methods) {
			if (method.getName().startsWith("set") && !method.getName().equals("setId")) {
				System.out.println("old." + method.getName() + "(" + modelName +".get" + method.getName().substring(3) +"());");
			}
		}
	}
}
