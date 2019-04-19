package com.boyue.karaoke.service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Customercase;
import java.io.File;
import java.util.List;

public abstract interface CustomercaseService
{
  public abstract void save(Customercase paramCustomercase);
  
  public abstract PageBean<Customercase> getAllCustomercase(int paramInt1, int paramInt2);
  
  public abstract PageBean<Customercase> findCustomercaseList(Customercase paramCustomercase, int paramInt1, int paramInt2);
  
  public abstract Customercase findCustomercaseByID(Integer paramInteger);
  
  public abstract void updateCustomercase(Customercase paramCustomercase, File paramFile1, File paramFile2, String paramString)
    throws Exception;
  
  public abstract void saveCustomercase(Customercase paramCustomercase, File paramFile, String paramString)
    throws Exception;
  
  public abstract Customercase findById(Integer paramInteger);
  
  public abstract void delByIDs(List<Integer> paramList);
}



/* Location:           F:\houtai\newspa\WEB-INF\classes\

 * Qualified Name:     com.boyue.karaoke.service.CustomercaseService

 * JD-Core Version:    0.7.0.1

 */