package com.boyue.framework.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;

/** 
 * 基础数据库操作类 
 *  
 * @author ss 
 *  
 */  
public interface DAO<T> {  
  
    /** 
     * 保存一个对象 
     *  
     * @param o 
     * @return 
     */  
    public Serializable save(T o);  
  
    /** 
     * 删除一个对象 
     *  
     * @param o 
     */  
    public void delete(T o);  
  
    public void deleteById(Serializable id);
    
    /** 
     * 更新一个对象 
     *  
     * @param o 
     */  
    public void update(T o);  
  
    /** 
     * 保存或更新对象 
     * @param o 
     */  
    public void saveOrUpdate(T o);  
  
  
    /** 
     * 获得一个对象 
     *  
     * @param c 
     *            对象类型 
     * @param id 
     * @return Object 
     */  
    public T findById(Serializable id);  
  
    /**
     * 根据id批量删除
     * @param idList
     * @param idName
     */
    public void deleteByIdList(List idList);
    
    public List<T> findByIdList(List idList);
  
    public PageBean<T> findPage(T t,final int pageNo, final int pageSize);
    
    public PageBean<T> findPageByOrder(T t,final int pageNo, final int pageSize,Order... order);
    
    public List<T> findByExample(T t);
}  

