package com.boyue.karaoke.common;

public class Constants {
	
	public static final String VERIFY_CODE_KEY = "verifyCode";
	
	public static final String MANAGE_USERINFO_SESSION_KEY = "_adminUser";
	
	public static final int DEFAULT_PAGE_SIZE = 10;
	
	//设备超时
	public static final long TIMEOUT = 60 * 1000 *6;
	//歌词上传路径
	public static final String LYRICFILE_UPLOAD_DIR = "upload/lyric_file/";
	//歌曲文件
	public static final String SONG_UPLOAD_DIR = "upload/song_file/";
	//歌曲分类图标
	public static final String SONG_CATEGORY_ICON_UPLOAD_DIR = "upload/song_category_icon/";
	
	public static final String MENU_LOGO_PATH = "upload/menu/logo/";
	
	public static final String BACK_IMG_PATH = "upload/back/logo/";
	//APP推送的图标
	public static final String APP_ICON_DIR = "upload/app_icon/";
	//广告上传文件
	public static final String AD_FILE_DIR = "upload/adfile/";

	public static final String VODPROGRAM_IMG_PATH = "upload/imgupload/tv/";
	
	public static final String SHOPINTRODUCE_LOGO_IMG_PATH = "upload/shopintroduce/logo/";
	//直播app路径
	public static final String LIVE_APP = "upload/live/app/";
	
	public static final String SHOPINTRODUCE_IMG_PATH = "upload/shopintroduce/img/";
	
	//系统权限信息的key
	public static final String SYS_PERMISSION = "sysPermission";
	
	public static final String SYS_PERMISSION_ERROR = "sysPermissionError";
	
	//这个系统允许的用户个数
	public static final String SYS_PERSON_NUM = "sysPersonNum";
	
	//终端背景图片key
	public static final String TEML_BACK_IMG = "back_img";
	
	//终端桌面logo key
	public static final String TEML_LOGO = "back_logo";
	public static final String TEML_VOLUME = "volume";
	
	
	public static final class ServerType {
		public static final String WEB_SERVER = "0";
		
		public static final String CMS_SERVER = "1";
		
		public static final String CONTROL_SERVER = "7";
		
		public static final String P2P_SERVER = "6";
		
		public static final String SOURCE_SERVER = "2";
	}
	

}

