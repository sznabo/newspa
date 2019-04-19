 package com.boyue.karaoke.service.impl;
 
 import com.boyue.framework.common.PageBean;
 import com.boyue.karaoke.common.SystemConfig;
 import com.boyue.karaoke.dao.DiscountDAO;
 import com.boyue.karaoke.model.Discount;
 import com.boyue.karaoke.service.DiscountService;
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
 public class DiscountServiceImpl implements DiscountService
 {
   @Autowired
   private DiscountDAO discountDAO;
   
   
   public void save(Discount d)
   {
     this.discountDAO.save(d);
   }
   
   public PageBean<Discount> getAllDiscount(int pageNo, int pageSize)
   {
     PageBean<Discount> beans = this.discountDAO.findPage(null, pageNo, pageSize);
     return beans;
   }
   
   
   public PageBean<Discount> findDiscountList(Discount model, int pageNo, int pageSize)
   {
     return this.discountDAO.findPage(model, pageNo, pageSize);
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
   
   
   public Discount findDiscountByID(Integer id)
   {
     return (Discount)this.discountDAO.findById(id);
   }
   
   
   public void updateDiscount(Discount model, File img, File logo_img, String imgFileName)
     throws Exception
   {
     Discount oldCustomercase = (Discount)this.discountDAO.findById(model.getId());
     String oldLogo = null;
     String oldImg = null;
     if (logo_img != null)
     {
       String imgPath = "upload/discountfile/";
       String imgImgPath = setImgPath(logo_img, imgPath, imgFileName);
       oldImg = oldCustomercase.getImg();
       oldCustomercase.setImg(imgImgPath);
     }
     oldCustomercase.setTitle(model.getTitle());
     oldCustomercase.setContent(model.getContent());
     if ((model.getId() != null) && (!model.getId().equals("")))
     {
       this.discountDAO.update(oldCustomercase);
       if ((oldImg != null) && (!oldImg.equals("")) && (oldLogo != null) && (!oldLogo.equals(""))) {
         new File(SystemConfig.getProjectBasePath() + oldImg).delete();
       } else if ((oldImg != null) && (!oldImg.equals(""))) {
         new File(SystemConfig.getProjectBasePath() + oldImg).delete();
       }
     }
   }
   
   
   
   public void saveDiscount(Discount model, File img, String imgFileName)
     throws Exception
   {
     String ImgPath = "upload/customerfile/";
     String Path = setImgPath(img, ImgPath, imgFileName);
     model.setImg(Path);
     this.discountDAO.save(model);
   }
   
   
   public Discount findById(Integer id)
   {
     return (Discount)this.discountDAO.findById(id);
   }
   
   
   
   public void delByIDs(List<Integer> idList)
   {
     if ((idList == null) || (idList.isEmpty())) {
       return;
     }
     this.discountDAO.deleteByIdList(idList);
   }
   
   
 }


