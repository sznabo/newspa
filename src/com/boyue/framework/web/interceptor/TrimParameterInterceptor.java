package com.boyue.framework.web.interceptor;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 去掉请求值的首尾空格
 * @author ben
 * @date   2012-12-8 上午11:23:16
 *
 */
public class TrimParameterInterceptor extends AbstractInterceptor  {

    public String intercept(ActionInvocation invocation) throws Exception {
        Map<String, Object> parameters = invocation.getInvocationContext().getParameters();
        Set<Entry<String, Object>> entrySet = parameters.entrySet();
        String[] strings = null;
        String[] values = null;
        int strLength = 0;
        for (Iterator<Entry<String, Object>> it = entrySet.iterator(); it.hasNext();) {
            Entry<String, Object> entry = it.next();
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (value instanceof String[]) {
            	values = (String[]) value;//类型转换
            	strLength = values.length;
            	strings = new String[strLength];
                for (int i = 0; i < strLength; i++) {
                    strings[i] = values[i].trim();
                }
                parameters.put((String) key, strings);
            }
        }
        invocation.getInvocationContext().setParameters(parameters);
        return invocation.invoke();
    }
}
