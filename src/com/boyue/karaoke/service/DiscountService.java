package com.boyue.karaoke.service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Discount;
import java.io.File;
import java.util.List;

public abstract interface DiscountService
{
  public abstract void save(Discount paramDiscount);
  
  public abstract PageBean<Discount> getAllDiscount(int paramInt1, int paramInt2);
  
  public abstract void delByIDs(List<Integer> paramList);
  
  public abstract Discount findById(Integer paramInteger);
  
  public abstract void saveDiscount(Discount paramDiscount, File paramFile, String paramString)
    throws Exception;
  
  public abstract PageBean<Discount> findDiscountList(Discount paramDiscount, int paramInt1, int paramInt2);
  
  public abstract Discount findDiscountByID(Integer paramInteger);
  
  public abstract void updateDiscount(Discount paramDiscount, File paramFile1, File paramFile2, String paramString)
    throws Exception;
}



