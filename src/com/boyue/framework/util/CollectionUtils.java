package com.boyue.framework.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;

public class CollectionUtils {
 
	public static void main(String[] args){
	}
	public static boolean isNotEmpty(Collection list) {
		if (list != null && !list.isEmpty()) {
			return true;
		}
		return false;
	}
	
	public static List getObjectPropertyList(Collection list, String propertyName) {
		List propertyList = new ArrayList();
		for (Object o : list) {
			try {
				propertyList.add(PropertyUtils.getProperty(o, propertyName));
			} catch (Exception e) {
				throw new IllegalArgumentException("根据属性名获取的get方法获取对象属性值异常", e);
			}
		}
		return propertyList;
	}
	
	public static <K,V> Map<K, V> listToMap(Collection<V> list, String keyPropertyName) {
		Map<K, V> map = new HashMap<K, V>(list.size());
		for (V o : list) {
			try {
				map.put((K)PropertyUtils.getProperty(o, keyPropertyName), o);
			} catch (Exception e) {
				throw new IllegalArgumentException("根据属性名获取的get方法获取对象属性值异常", e);
			}
		}
		return map;
	}
	
	/**
	 * @param list
	 * @param propertyName
	 * @param value
	 * @return
	 */
	public static boolean isExists(Collection list, String propertyName, Object targetValue) {
		for (Object o : list) {
			try {
				Object source = PropertyUtils.getProperty(o, propertyName);
				if (source.equals(targetValue)) {
					return true;
				}
			} catch (Exception e) {
				throw new IllegalArgumentException("根据属性名获取的get方法获取对象属性值异常", e);
			}
		}
		return false;
	}
	
	/**
     * 分割List
     * @param list 待分割的list
     * @param size 每段list的大小
     * @return List<<List<T>> 
     */
     public static  List<List> splitList(List list, int size) {
        
        int listSize = list.size();                                                           //list的大小
        int page = (listSize + (size-1))/ size;                      //页数
        
        List<List> listArray = new ArrayList<List>();              //创建list数组 ,用来保存分割后的list
        for(int i=0;i<page;i++) {                                                         //按照数组大小遍历
            List subList = new ArrayList();                               //数组每一位放入一个分割后的list
            for(int j=0;j<listSize;j++) {                                                 //遍历待分割的list
                int pageIndex = ( (j + 1) + (size-1) ) / size;   //当前记录的页码(第几页)
                if(pageIndex == (i + 1)) {                                               //当前记录的页码等于要放入的页码时
                    subList.add(list.get(j));                                               //放入list中的元素到分割后的list(subList)
                }
                
                if( (j + 1) == ((j + 1) * size) ) {                               //当放满一页时退出当前循环
                    break;
                }
            }
            listArray.add(subList);                                                         //将分割后的list放入对应的数组的位中
        }
        return listArray;
    }

	
	
	/**
	 * 根据集合里面的bean中的某个字段排序
	 * @param collection
	 * @param propertyName
	 */
	@SuppressWarnings("unchecked")
	public static void sortByProperty(List list,final String propertyName) {
		Collections.sort(list, new Comparator() {

			@Override
			public int compare(Object o1, Object o2) {
				try {
					Object v1 = PropertyUtils.getProperty(o1, propertyName);
					Object v2 = PropertyUtils.getProperty(o2, propertyName);
					//检查他有没有实现Comparator 接口
					Class<?>[] interfaces = v1.getClass().getInterfaces();
					boolean isImpleComparator = false;
					for (Class cls : interfaces) {
						if (cls == Comparable.class) {
							isImpleComparator = true;
							break;
						}
					}
					if (isImpleComparator) {
						return ((Comparable)v1).compareTo(((Comparable)v2));
					} else {
						throw new IllegalArgumentException("指定的字段的类型没有实现Comparable接口，没法比较");
					}
				} catch (Exception e) {
					throw new IllegalArgumentException(e);
				} 
			}
		});
	}
}
