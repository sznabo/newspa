package com.boyue.framework.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;

public class DateUtil
{
    
    /** 默认的日期格式. */
    public static String DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
    
    public static Date parse(String date)
    {
        try
        {
            return DateUtils.parseDate(date,
                    "yyyy-MM-dd",
                    "yyyy-MM-dd HH:mm:ss");
        }
        catch (ParseException e)
        {
            throw new IllegalArgumentException(e);
        }
    }
    
    /**
     * 格式化成年月日，带时分秒
     * @param date
     * @return
     */
    public static String formatToLong(Date date)
    {
        return DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:ss");
    }
    
    /**
     * 获取指定日期最开始的时间 时.分.秒.毫秒 置为0
     * @param date
     * @return
     */
    public static Date getDateStart(Date date)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        
        cal.set(cal.HOUR_OF_DAY, 0);
        cal.set(cal.MINUTE, 0);
        cal.set(cal.SECOND, 0);
        cal.set(cal.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     * 获取指定日期最后一毫秒的时间
     * @param date
     * @return
     */
    public static Date getDateEnd(Date date)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        
        cal.set(cal.HOUR_OF_DAY, 23);
        cal.set(cal.MINUTE, 59);
        cal.set(cal.SECOND, 59);
        cal.set(cal.MILLISECOND, 999);
        return cal.getTime();
    }
    
    /**
     * 格式化成年月日
     * @param date
     * @return
     */
    public static String formatToShort(Date date)
    {
        return DateFormatUtils.format(date, "yyyy-MM-dd");
    }
    
    /**
     * 将Date转换成字符串
     * @param date Date 要转换的Date实例
     * @param format String 日期格式字符串
     * @return String
     */
    public static String date2String(Date date, String format)
    {
        if (date == null)
        {
            date = new Date();
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }
    
    /**
     * 将Date类转换成字符串形式,使用默认的格式做转换.
     * yyyy年MM月DD日 HH:MM:SS
     * @param date Date
     * @return String
     */
    public static String date2String(Date date)
    {
        return date2String(date, DEFAULT_DATE_FORMAT);
    }
    
    /**
     * 得到本月的最后时间
     * @param date Date 要偏移的时间
     * @return Date
     */
    public static Date getLastday(Date date)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        calendar.set(Calendar.DAY_OF_MONTH, maxDay);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        date.setTime(calendar.getTimeInMillis());
        return date;
    }
    
    /**
     * 得到本月的开始时间
     * @param date Date 要偏移的时间
     * @return Date
     */
    public static Date getBeginday(Date date)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        date.setTime(calendar.getTimeInMillis());
        return date;
    }
    
    /**
     * 得到字符串形式的当前时间,日期格式采用默认的格式.
     * @return String
     */
    public static String getCurrentDate()
    {
        Date date = new Date();
        return date2String(date, DEFAULT_DATE_FORMAT);
    }
    
    /**
     * 将字符串格式转换成日期格式
     * <功能详细描述>
     * @param date
     * @param dateFormat
     * @return [参数说明]
     *
     * @author xu.yang
     * @see [类、类#方法、类#成员]
     */
    public static Date string2SQLDate(String date, String dateFormat)
    {
        try
        {
            SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
            long time = sdf.parse(date).getTime();
            return new Date(time);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * 偏移时间(按秒偏移)
     * @param date Date 初始时间
     * @param second long 偏移秒数
     * @return Date
     */
    public static Date offsetSecond(Date date, long seconds)
    {
        long time = date.getTime();
        time = time + (seconds * 1000);
        return new java.sql.Date(time);
    }
    
    /**
     * 偏移时间(按分钟偏移)
     * @param date Date 初始时间
     * @param minute long 偏移分钟数
     * @return Date
     */
    public static Date offsetMinute(Date date, long minutes)
    {
        return offsetSecond(date, 60 * minutes);
    }
    
    /**
     * 偏移时间(按小时偏移)
     * @param date Date 初始时间
     * @param hour long 偏移小时数
     * @return Date
     */
    public static Date offsetHour(Date date, long hours)
    {
        return offsetMinute(date, 60 * hours);
    }
    
    /**
     * 偏移时间(按天偏移)
     * @param date Date 初始时间
     * @param day long 偏移天数
     * @return Date
     */
    public static Date offsetDay(Date date, int days)
    {
        return offsetHour(date, 24 * days);
    }
    
    /**
     * 偏移时间(按周偏移)
     * @param date Date 初始时间
     * @param week long 偏移周数
     * @return Date
     */
    public static Date offsetWeek(Date date, int weeks)
    {
        return offsetDay(date, 7 * weeks);
    }
    
    /**
     * 偏移时间(按月偏移)
     * 规则:
     * 1. 如果要偏移的时间是月末, 偏移后也是月末
     * 2. 要偏移的时间的当前天大于偏移后的月份的最大天数也调整为月末, 比如12月30号(非月末)偏移两个月
     * 应变为2月28(29)号
     * @param date Date 要偏移的时间
     * @param months int 要偏移的月份
     * @return Date
     */
    public static Date offersetMonth(Date date, int months)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int curDay = calendar.get(Calendar.DAY_OF_MONTH);
        int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        
        //将当前天设置为1号, 然后增加月份数 (先加月份, 再加天)
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.MONTH, months);
        
        //加过月份以后的日期当月的最大天数
        int newMaxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        
        //如果当前天为月底, 加过以后也调整为月底
        if (curDay == maxDay)
        {
            calendar.set(Calendar.DAY_OF_MONTH, newMaxDay);
            
        }
        else
        {
            //如果要加的初始日期的天大于新的月份的最大天数, 则调整为月底, 比如12月30号加两个月
            //不是2 * 30天 到 3月2号, 而是到2月底
            if (curDay > newMaxDay)
            {
                calendar.set(Calendar.DAY_OF_MONTH, newMaxDay);
            }
            else
            {
                calendar.set(Calendar.DAY_OF_MONTH, curDay);
            }
        }
        
        date.setTime(calendar.getTimeInMillis());
        return date;
    }
    
    /**
     * 检查指定时间是否在某个时间范围内(闭区间), 时间格式必须一致, 长度一致
     * @param date String 指定时间
     * @param beginDate String 范围开始时间
     * @param endDate String 范围结束时间
     * @return boolean true-在范围内, false-不在范围内
     * @throws BaseAppException
     */
    public static boolean isInRange(String date, String beginDate,
            String endDate)
    {
        if (StringUtils.isEmpty(date) || StringUtils.isEmpty(beginDate)
                || StringUtils.isEmpty(endDate))
        {
            return false;
        }
        
        int dateLen = date.length();
        int beginDateLen = date.length();
        int endDateLen = date.length();
        
        if (beginDateLen != dateLen || endDateLen != endDateLen)
        {
            return false;
        }
        
        boolean asc = isAsc(beginDate, endDate);
        
        if (asc)
        {
            if (date.compareTo(beginDate) >= 0 && date.compareTo(endDate) <= 0)
            {
                return true;
            }
        }
        else
        {
            if (date.compareTo(beginDate) >= 0 || date.compareTo(endDate) <= 0)
            {
                return true;
            }
        }
        
        return false;
    }
    
    /**
     * 判断字符串是否升序的, 第一个字符串小于第二个字符串
     * @param firstStr String
     * @param secondStr String
     * @return boolean true-升序, false-降序
     */
    private static boolean isAsc(String firstStr, String secondStr)
    {
        return (firstStr.compareTo(secondStr) < 0);
    }
    
    /**
     * 检查指定时间是否在某个时间范围内(闭区间)
     * @param date Date 指定时间
     * @param beginDate Date 范围开始时间
     * @param endDate Date 范围结束时间
     * @return boolean true-在范围内, false-不在范围内
     */
    public static boolean isInRange(Date date, Date beginDate, Date endDate)
    {
        if (date.compareTo(beginDate) >= 0 && date.compareTo(endDate) <= 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    /**
     * 比较两个时间之间相差的天数<br>
     * <功能详细描述>
     * @param beginDate 开始时间
     * @param endDate 结束时间
     * @return [参数说明]
     * Apr 11, 2013
     * @author xu.yang22@zte.com.cn
     * @see [类、类#方法、类#成员]
     */
    public static int daysOfTwo(Date beginDate, Date endDate)
    {
        Calendar aCalendar = Calendar.getInstance();
        aCalendar.setTime(beginDate);
        int day1 = aCalendar.get(Calendar.DAY_OF_YEAR);
        aCalendar.setTime(endDate);
        int day2 = aCalendar.get(Calendar.DAY_OF_YEAR);
        
        return day2 - day1;
        
    }
    
    /**
     * 比较两个时间大小，按毫秒比较<br>
     * firstDate大返回1，否则返回-1
     * @param firstDate
     * @param secondDate
     * @return [参数说明]
     *
     * @author xu.yang
     * @see [类、类#方法、类#成员]
     */
    public static int compareDate(Date firstDate, Date secondDate)
    {
        Calendar aCalendar = Calendar.getInstance();
        aCalendar.setTime(firstDate);
        Calendar bCalendar = Calendar.getInstance();
        bCalendar.setTime(secondDate);
        return aCalendar.compareTo(bCalendar);
    }
    
    public static void main(String[] args)
    {
        Date date1 = new Date();
        try
        {
            Thread.sleep(1000);
        }
        catch (InterruptedException e)
        {
            e.printStackTrace();
        }
        Date date2 = new Date();
        System.out.println(DateUtil.compareDate(date2, date1));
    }

	/**
	 * 指定日期增加天数
	 * @param
	 * @return
	 * */
	public static Date addDay(Date date, int days) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_YEAR, days);
		return c.getTime();
	}
}
