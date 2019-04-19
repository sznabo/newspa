/*
 * 文 件 名 : StringUtils.java
 * 版    权 : China Machi.Co.,Ltd.Copyright 2009-2011.All rights reserved
 * 描    述 : <描述>
 * 修 改 人 : Administrator
 * 修改时间 : Dec 20, 2012
 * 跟踪单号 : <跟踪单号>
 * 修改单号 : <修改单号>
 * 修改内容 : <修改内容>
 */
package com.boyue.framework.util;

/**
 * 字符串处理类<br>
 * <功能详细描述>
 *
 * @author  Administrator
 * @version [版本号,Dec 20, 2012]
 * @see     [相关类/方法]
 * @since   [产品/模块]
 */
public class StringUtils
{
    /**
     * 判断字符串是否为空
     * <功能详细描述>
     * @param str
     * @return [参数说明]
     *
     * @author Administrator
     * @see [类、类#方法、类#成员]
     */
    public static boolean isNotEmpty(String str)
    {
        boolean result = true;
        if (null == str || "".equals(str))
        {
            result = false;
        }
        
        return result;
    }
    
    /**
     * 判断字符串是否为空
     * <功能详细描述>
     * @param str
     * @return [参数说明]
     *
     * @author Administrator
     * @see [类、类#方法、类#成员]
     */
    public static boolean isEmpty(String str)
    {
        boolean result = false;
        if (null == str || "".equals(str))
        {
            result = true;
        }
        
        return result;
    }
}
