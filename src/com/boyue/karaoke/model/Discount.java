 package com.boyue.karaoke.model;
 
 import java.io.Serializable;
 
 public class Discount implements Serializable
 {
   private Integer id;
   private String title;//标题
   private String content;//内容
   private String img;//图片
   
   public Integer getId()
   {
     return this.id;
   }
   
   public void setId(Integer id)
   {
     this.id = id;
   }
   
   public String getTitle()
   {
     return this.title;
   }
   
   public void setTitle(String title)
   {
     this.title = title;
   }
   
   public String getContent()
   {
     return this.content;
   }
   
   public void setContent(String content)
   {
     this.content = content;
   }
   
   public String getImg()
   {
     return this.img;
   }
   
   public void setImg(String img)
   {
     this.img = img;
   }
 }



