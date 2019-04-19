package com.boyue.framework.dao.util;

public class SqlUtil {

	/**
	 * 根据查询列表的sql 产生计算总数的sql
	 * @param selectListSql
	 * @return
	 */
	public static String getCountSqlBySelectListSql(String selectListSql) {
		String selectListSqlTmp = selectListSql.toLowerCase();
		
		if (selectListSqlTmp.indexOf("group by") == -1
				&& selectListSqlTmp.indexOf("union") == -1) {
			//找到from  的位置
			int beginIndex = selectListSqlTmp.indexOf("from");
			int endIndex = selectListSql.length();
			
			//看看有没有order by,有就截掉他
			int orderByIndex = selectListSqlTmp.indexOf("order by");
			if (orderByIndex != -1) {
				endIndex = orderByIndex;
			}
			return "select count(*) CNT " + selectListSql.substring(beginIndex, endIndex);
		} else {
			return "SELECT COUNT(*) CNT FROM (" + selectListSql + ") ttttt";
		}
        
	}
}
