package com.boyue.karaoke.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 *
 * @author ben
 * @date   2014-6-23 下午4:50:02
 *
 */
public class SongUtil {

	/**
	 * 把歌曲名称转成拼音
	 * 如：大海 转换后变成dahai
	 * @param songName
	 * @return
	 * @throws BadHanyuPinyinOutputFormatCombination 
	 */
	public static String songName2pinyin(String songName) throws BadHanyuPinyinOutputFormatCombination {
		HanyuPinyinOutputFormat format= new HanyuPinyinOutputFormat();
		format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		format.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE);
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < songName.length(); i++) {
			char c = songName.charAt(i);
			if (isChinese(c)) {
				sb.append(PinyinHelper.toHanyuPinyinStringArray(c, format)[0].substring(0, 1));
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}
	
	private static boolean isChinese(char a) { 
		int v = (int)a; 
		return (v >=19968 && v <= 171941); 
	}
	
	public static void main(String[] args) {
		try {
			System.out.println(SongUtil.songName2pinyin("真的3爱你"));
		} catch (BadHanyuPinyinOutputFormatCombination e) {
			e.printStackTrace();
		}
	}
}
