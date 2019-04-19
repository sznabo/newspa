package com.boyue.karaoke.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author mrg
 */
public class Datefomter {
  public static java.util.Date parseDate(String dateStr, String format) {
        java.util.Date date = null;
        try {
            java.text.DateFormat df = new java.text.SimpleDateFormat(format);
            String dt = dateStr.replaceAll("-", "/");
            if ((!dt.equals("")) && (dt.length() < format.length())) {
                dt += format.substring(dt.length()).replaceAll("[YyMmDdHhSs]",
                        "0");
            }
            date = (java.util.Date) df.parse(dt);
        } catch (Exception e) {
        }
        return date;
    }

    /**
     * @param dateStr
     * @return Date
     */
    public static java.util.Date parseDate(String dateStr) {
        return parseDate(dateStr, "yyyy/MM/dd");
    }

    /**
     * 格式化输出日期
     * @param date 日期
     * @param format  格式
     * @return 返回字符型日期
     */
    public static String format(java.util.Date date, String format) {
        String result = "";
        try {
            if (date != null) {
                java.text.DateFormat df = new java.text.SimpleDateFormat(format);
                result = df.format(date);
            }
        } catch (Exception e) {
        }
        return result;
    }

    /**
     * 常用的格式化日期
     * @param date Date
     * @return String
     */
    public static String formatDate(java.util.Date date) {
        return format(date, "yyyy年MM月dd日");
    }

    /**
     * 输出时间
     * @param date
     * @return
     */
    public static String format(java.util.Date date) {
        return format(date, "yyyy/MM/dd");
    }

    /**
     * 返回年份
     * @param date 日期
     * @return 返回年份
     */
    public static int getYear(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.YEAR);
    }

    /**
     * 返回月份
     * @param date 日期
     * @return 返回月份
     */
    public static int getMonth(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.MONTH) + 1;
    }

    /**
     * 返回日份
     * @param date 日期
     * @return 返回日份
     */
    public static int getDay(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.DAY_OF_MONTH);
    }

    /**
     * 返回小时
     * @param date 日期
     * @return 返回小时
     */
    public static int getHour(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.HOUR_OF_DAY);
    }

    /**
     * 返回分钟
     * @param date 日期
     * @return 返回分钟
     */
    public static int getMinute(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.MINUTE);
    }

    /**
     * 返回秒钟
     * @param date 日期
     * @return 返回秒钟
     */
    public static int getSecond(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.get(java.util.Calendar.SECOND);
    }

    /**
     * 返回毫秒
     * @param date 日期
     * @return 返回毫秒
     */
    public static long getMillis(java.util.Date date) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTime(date);
        return c.getTimeInMillis();
    }

    /**
     * 返回字符型日期
     * @param date 日期
     * @return 返回字符型日期
     */
    public static String getDate(java.util.Date date) {
        return format(date, "yyyy/MM/dd");
    }

    /**
     * 返回字符型时间
     * @param date 日期
     * @return 返回字符型时间
     */
    public static String getTime(java.util.Date date) {
        return format(date, "HH:mm:ss");
    }

    /**
     * 返回字符型日期时间
     * @param date 日期
     * @return 返回字符型日期时间
     */
    public static String getDateTime(java.util.Date date) {
        return format(date, "yyyy/MM/dd HH:mm:ss");
    }

    /**
     * 日期相加
     * @param date 日期
     * @param day 天数
     * @return 返回相加后的日期
     */
    public static java.util.Date addDate(java.util.Date date, int day) {
        java.util.Calendar c = java.util.Calendar.getInstance();
        c.setTimeInMillis(getMillis(date) + ((long) day) * 24 * 3600 * 1000);
        return c.getTime();
    }

    /**
     * 日期相减
     * @param date 日期
     * @param date1 日期
     * @return 返回相减后的日期
     */
    public static int diffDate(java.util.Date date, java.util.Date date1) {
        return (int) ((getMillis(date) - getMillis(date1)) / (24 * 3600 * 1000));
    }

    /**
     * 取得指定月份的第一天
     * @param strdate String
     * @return String
     */
    public static String getMonthBegin(String strdate) {
        java.util.Date date = parseDate(strdate);
        return format(date, "yyyy-MM") + "-01";
    }

    /**
     * 取得指定月份的最后一天
     * @param strdate String
     * @return String
     */
    public static String getMonthEnd(String strdate) {
        java.util.Date date = parseDate(getMonthBegin(strdate));
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, 1);
        calendar.add(Calendar.DAY_OF_YEAR, -1);
        return formatDate(calendar.getTime());
    }

    /**
     * 计算传入值是否星期(六)
     * @param str
     * @return boolean - 是返回true
     */
    public boolean checkWeek6(String str, int week) {
        boolean flag = false;
        int realWeek = 0;
        str.replace('/', '-');
        Calendar cal = Calendar.getInstance();
        cal.setTime(java.sql.Date.valueOf(str.substring(0, 10)));
        realWeek = cal.get(Calendar.DAY_OF_WEEK);
        if (realWeek == (week + 1)) {
            flag = true;
        }
        return flag;
    }

    /**
     * Description: 获取GMT8时间
     *
     * @return 将当前时间转换为GMT8时区后的Date
     */
    public static Date getGMT8Time() {
        Date gmt8 = null;
        try {
            Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("GMT+8"),
                    Locale.CHINESE);
            Calendar day = Calendar.getInstance();
            day.set(Calendar.YEAR, cal.get(Calendar.YEAR));
            day.set(Calendar.MONTH, cal.get(Calendar.MONTH));
            day.set(Calendar.DATE, cal.get(Calendar.DATE));
            day.set(Calendar.HOUR_OF_DAY, cal.get(Calendar.HOUR_OF_DAY));
            day.set(Calendar.MINUTE, cal.get(Calendar.MINUTE));
            day.set(Calendar.SECOND, cal.get(Calendar.SECOND));
            gmt8 = day.getTime();
        } catch (Exception e) {
            System.out.println("获取GMT8时间 getGMT8Time() error !");
            e.printStackTrace();
            gmt8 = null;
        }
        return gmt8;
    }
    /**
     * Description: 获取sql当前时间
     *
     * @return 将当前时间转换为后的String
     */
    public static String getNowDateAndTime(){
    	Date date = new Date();
		String nowdate = new String(new SimpleDateFormat("yyyy-MM-dd").format(date));
		String nowtime = new String(new SimpleDateFormat("HH:mm:ss").format(date));
    	return nowdate+" "+nowtime;
    }
    /**
     * Description: 获取sql当前日期
     *
     * @return 将当前时间转换为后的String
     */
    public static String getNowDate(){
    	Date date = new Date();
		String nowdate = new String(new SimpleDateFormat("yyyy-MM-dd").format(date));
    	return nowdate;
    }
    /**
     * Description: 获取sql当前时间
     *
     * @return 将当前时间转换为后的String
     */
    public static String getNowTime(java.util.Date date){
		String nowtime = new String(new SimpleDateFormat("HH:mm").format(date));
    	return nowtime;
    }
    public static String getWeekMessage(java.util.Date date){
    	 String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
         Calendar cal = Calendar.getInstance();
         cal.setTime(date);
         int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
         if (w < 0)
             w = 0;
         return weekDays[w];
    }
    
    
}