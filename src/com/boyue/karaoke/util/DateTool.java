/*  1:   */ package com.boyue.karaoke.util;
/*  2:   */ 
/*  3:   */ import java.text.ParseException;
/*  4:   */ import java.text.SimpleDateFormat;
/*  5:   */ import java.util.Calendar;
/*  6:   */ import java.util.Date;
/*  7:   */ 
/*  8:   */ public class DateTool
/*  9:   */ {
/* 10:   */   public static String datatoWeek(String datetime)
/* 11:   */   {
/* 12:16 */     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
/* 13:17 */     String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
/* 14:18 */     Calendar calendar = Calendar.getInstance();
/* 15:19 */     Date date = null;
/* 16:   */     try
/* 17:   */     {
/* 18:23 */       date = dateFormat.parse(datetime);
/* 19:24 */       calendar.setTime(date);
/* 20:   */     }
/* 21:   */     catch (ParseException e)
/* 22:   */     {
/* 23:26 */       e.printStackTrace();
/* 24:   */     }
/* 25:29 */     int w = calendar.get(7) - 1;
/* 26:30 */     if (w < 0) {
/* 27:31 */       w = 0;
/* 28:   */     }
/* 29:32 */     return weekDays[w];
/* 30:   */   }
/* 31:   */ }


/* Location:           F:\houtai\newspa\WEB-INF\classes\
 * Qualified Name:     com.boyue.karaoke.util.DateTool
 * JD-Core Version:    0.7.0.1
 */