 package com.boyue.karaoke.service.impl;
 
 import com.boyue.framework.common.PageBean;
 import com.boyue.karaoke.common.SystemConfig;
 import com.boyue.karaoke.dao.CustomercaseDAO;
 import com.boyue.karaoke.model.Customercase;
 import com.boyue.karaoke.service.CustomercaseService;
 import java.io.File;
 import java.io.IOException;
 import java.util.Date;
 import java.util.List;
 import javax.servlet.ServletContext;
 import org.apache.commons.io.FileUtils;
 import org.apache.struts2.ServletActionContext;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Service;
 
 @Service
 public class CustomercaseServiceImpl
   implements CustomercaseService
 {
   @Autowired
   private CustomercaseDAO customercaseDAO;
   
   public void save(Customercase d)
   {
     this.customercaseDAO.save(d);
   }
   
   public PageBean<Customercase> getAllCustomercase(int pageNo, int pageSize)
   {
     PageBean<Customercase> beans = this.customercaseDAO.findPage(null, pageNo, pageSize);
     return beans;
   }
   
   public PageBean<Customercase> findCustomercaseList(Customercase model, int pageNo, int pageSize)
   {
     return this.customercaseDAO.findPage(model, pageNo, pageSize);
   }
   
   private String setImgPath(File img, String ImgPath, String imgFileName)
     throws IOException
   {
     String imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
     String imgName = new Date().getTime() + imgType;
     String imgPathReal = ImgPath + imgName;
     FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPathReal));
     return imgPathReal;
   }
   
   public Customercase findCustomercaseByID(Integer id)
   {
     return (Customercase)this.customercaseDAO.findById(id);
   }
   
   public void updateCustomercase(Customercase model, File img, File logo_img, String imgFileName)
     throws Exception
   {
     Customercase oldCustomercase = (Customercase)this.customercaseDAO.findById(model.getId());
     
 
     String oldLogo = null;
     String oldImg = null;
     if (logo_img != null)
     {
       String imgPath = "upload/customerfile/";
       String imgImgPath = setImgPath(logo_img, imgPath, imgFileName);
       oldImg = oldCustomercase.getImg();
       oldCustomercase.setImg(imgImgPath);
     }
     oldCustomercase.setTitle(model.getTitle());
     oldCustomercase.setContent(model.getContent());
     if ((model.getId() != null) && (!model.getId().equals("")))
     {
       this.customercaseDAO.update(oldCustomercase);
       if ((oldImg != null) && (!oldImg.equals("")) && (oldLogo != null) && (!oldLogo.equals(""))) {
         new File(SystemConfig.getProjectBasePath() + oldImg).delete();
       } else if ((oldImg != null) && (!oldImg.equals(""))) {
         new File(SystemConfig.getProjectBasePath() + oldImg).delete();
       }
     }
   }
   
   public void saveCustomercase(Customercase model, File img, String imgFileName)
     throws Exception
   {
     String ImgPath = "upload/customerfile/";
     String Path = setImgPath(img, ImgPath, imgFileName);
     model.setImg(Path);
     
 
     this.customercaseDAO.save(model);
   }
   
   public Customercase findById(Integer id)
   {
     return (Customercase)this.customercaseDAO.findById(id);
   }
   
   public void delByIDs(List<Integer> idList)
   {
     if ((idList == null) || (idList.isEmpty())) {
       return;
     }
     this.customercaseDAO.deleteByIdList(idList);
   }
 }


