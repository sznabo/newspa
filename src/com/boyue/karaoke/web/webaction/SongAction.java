package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.Song;
import com.boyue.karaoke.service.SongService;
import com.boyue.karaoke.util.SongUtil;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.boyue.spa.domain.Vodprogram;
import com.boyue.spa.domain.Vodvideo;

/**
 *
 * @author ben
 * @date   2014-6-23 上午9:46:08
 *
 */
@Controller("SongAction")
@Scope(value = "prototype")
public class SongAction  extends DefaultBaseAction<Song> {

	@Autowired
	private SongService songService;
	
	private Integer id;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private Song song;
	//歌词上传文件
	private File geci;
	private String geciFileName;
	private String geciContentType;
	//歌曲文件
	private File songFile;
	private String songFileFileName;
	private String songFileContentType;
	
	//歌曲文件
	private File logo;
	private String logoFileName;
	private String logoContentType;
	//文件
	private File xls;
	private String xlsFileName;
	private String xlsContentType;
	private Integer messge;
	/**
	 * 进入增加页面
	 * @return
	 */
	public String toAdd() {
		return SUCCESS;
	}
	
	/**
	 * 增加
	 * @return
	 * @throws IOException 
	 */
	public String save() throws Exception {
		if (geci != null) {
			String filename = Constants.LYRICFILE_UPLOAD_DIR + System.currentTimeMillis() + "." +FilenameUtils.getExtension(geciFileName).toLowerCase();
			FileUtils.copyFile(geci, new File(this.getProjectPath() + filename));
			song.setLyricFile(filename);
		}
		if (getLang() == 1) {
			song.setSongNamee(song.getSongName());
			song.setSingere(song.getSinger());
		}else if (getLang() ==2) {
			song.setSongName(song.getSongNamee());
			song.setSinger(song.getSingere());
		}
		song.setSongYinpin(SongUtil.songName2pinyin(song.getSongName()));
		if (StringUtils.isNotBlank(song.getMusicFile())) {
			songService.save(song);
		}
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 * @throws IOException 
	 */
	public String update() throws Exception {
		Song old = songService.findById(song.getId());
		if (getLang() == 1) {  //中文
			old.setSongName(song.getSongName());
			old.setSinger(song.getSinger());
		}else if (getLang() ==2) {
			old.setSongNamee(song.getSongNamee());
			old.setSingere(song.getSingere());
		}
		old.setSingerType("");
		old.setSongYinpin(song.getSongYinpin());
		//old.setYear(song.getYear());
		old.setRecommend(song.getRecommend());
		old.setSongYinpin(SongUtil.songName2pinyin(old.getSongName()));
		String delLyricFile = null;
		String delSongFile = null;
		if (geci != null) {
			String filename = Constants.LYRICFILE_UPLOAD_DIR + System.currentTimeMillis() + "." +FilenameUtils.getExtension(geciFileName).toLowerCase();
			FileUtils.copyFile(geci, new File(this.getProjectPath() + filename));
			delLyricFile = old.getLyricFile();
			old.setLyricFile(filename);
		}
		
		if (songFile != null) {
			String filename = Constants.SONG_UPLOAD_DIR + System.currentTimeMillis() + "." +FilenameUtils.getExtension(songFileFileName).toLowerCase();
			FileUtils.copyFile(songFile, new File(this.getProjectPath() + filename));
			delSongFile = old.getMusicFile();
			old.setMusicFile(filename);
		}
		if (logo != null) {
			String filename = Constants.SONG_UPLOAD_DIR + System.currentTimeMillis() + "." +FilenameUtils.getExtension(logoFileName).toLowerCase();
			FileUtils.copyFile(logo, new File(this.getProjectPath() + filename));

			new File(this.getProjectPath() + old.getLogo()).delete();
			old.setLogo(filename);
		}
		
		songService.update(old);
		//如果原来有歌词，则删掉
		if (delLyricFile != null) {
			new File(this.getProjectPath() + delLyricFile).delete();
		}
		//删除原来的
		if (delSongFile != null) {
			new File(this.getProjectPath() + delSongFile).delete();
		}
		return SUCCESS;
	}
	
	/**
	 * 删除歌词
	 * @return
	 */
	public String delLyricFile() {
		Song old = songService.findById(id);
		String delLyricFile = old.getLyricFile();
		if (delLyricFile != null) {
			old.setLyricFile(null);
			songService.update(old);
			new File(this.getProjectPath() + delLyricFile).delete();
		}
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		song = songService.findById(id);
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			songService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	/**
	 * 歌曲分页查询
	 * @return
	 */
	public String findPage() {
		this.pageBean = songService.findPage(song, pageNo, pageSize);
		return SUCCESS;
	}
	
	/**
	 * 歌曲信息批量导入
	 * @return
	 */
	public String macRead() {
		messge = 1;
		
		if(xlsFileName!=null&&!xlsFileName.equals("")){
			List<Song> list = new ArrayList<Song>();
			try {
				FileInputStream fin = new FileInputStream(xls);
				try {
					HSSFWorkbook workbook = new HSSFWorkbook(fin);
					//获得表一
					//HSSFSheet sheet = workbook.getSheet("sheet1"); //注意表的名字
					HSSFSheet sheet = workbook.getSheetAt(0);
					//获得表一所有行
					int rows = sheet.getPhysicalNumberOfRows();
					//遍历行信息
					Song s = null;
					for(int i=1;i<rows;i++){
						//获得行信息
						HSSFRow row = sheet.getRow(i);
						if(row!=null){
							s = new Song();
							//行的所有列信息
							int cols = row.getPhysicalNumberOfCells();
							//遍历列信息
							for(int k=0;k<=cols;k++){ //此时K值对应列名
								HSSFCell col = row.getCell((short) k);
								if(k==0){
									System.out.println("k==0 "+result(col));
									s.setSongName(result(col));
								}
								if(k==1){
									System.out.println("k==1 "+result(col));
									s.setSinger(result(col));
									s.setSingere(result(col));
								}
								if(k==2){
									System.out.println("k==2 "+result(col));
									s.setMusicFile(result(col));
								}
								if(k==3){
									System.out.println("k==3 "+result(col));
									s.setLogo(result(col));
								}
							}
							try {
								s.setSongYinpin(SongUtil.songName2pinyin(s.getSongName()));
							} catch (BadHanyuPinyinOutputFormatCombination e) {
								e.printStackTrace();
							}
							if (s.getSongNamee() == null) {
								s.setSongNamee(s.getSongName());
							}
							s.setType(1);
							s.setSingerType("");
							s.setPlayTimes(0);
							s.setYear(2015);
							list.add(s);
							
						}
						
						
					}
					
					//注意重复导入
					if(list!= null && list.size() > 0){
						Boolean status = songService.saveSongs(list);
						if(status == false){
							messge = 2;
						}
						
					}
				} catch (IOException e) {
					messge = 2;//导入异常
					e.printStackTrace();
				}
			} catch (FileNotFoundException e) {
				messge = 2;
				e.printStackTrace();
			}			
		}
		return SUCCESS;
		
	}
	
	
	//获得xls结果
	public String result(HSSFCell cell){
		String result = "";
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC:
			result =Integer.toString((int)(cell.getNumericCellValue()));;
			break;
		case HSSFCell.CELL_TYPE_STRING:
			result = cell.getStringCellValue();
			break;
		}		
		return result;
	}
	

	public File getGeci() {
		return geci;
	}

	public void setGeci(File geci) {
		this.geci = geci;
	}

	public String getGeciFileName() {
		return geciFileName;
	}

	public void setGeciFileName(String geciFileName) {
		this.geciFileName = geciFileName;
	}

	public Song getSong() {
		return song;
	}

	public void setSong(Song song) {
		this.song = song;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public File getSongFile() {
		return songFile;
	}

	public void setSongFile(File songFile) {
		this.songFile = songFile;
	}

	public String getSongFileFileName() {
		return songFileFileName;
	}

	public void setSongFileFileName(String songFileFileName) {
		this.songFileFileName = songFileFileName;
	}

	public String getGeciContentType() {
		return geciContentType;
	}

	public void setGeciContentType(String geciContentType) {
		this.geciContentType = geciContentType;
	}

	public String getSongFileContentType() {
		return songFileContentType;
	}

	public void setSongFileContentType(String songFileContentType) {
		this.songFileContentType = songFileContentType;
	}

	public File getXls() {
		return xls;
	}

	public void setXls(File xls) {
		this.xls = xls;
	}

	public String getXlsFileName() {
		return xlsFileName;
	}

	public void setXlsFileName(String xlsFileName) {
		this.xlsFileName = xlsFileName;
	}

	public String getXlsContentType() {
		return xlsContentType;
	}

	public void setXlsContentType(String xlsContentType) {
		this.xlsContentType = xlsContentType;
	}

	public Integer getMessge() {
		return messge;
	}

	public void setMessge(Integer messge) {
		this.messge = messge;
	}

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public String getLogoContentType() {
		return logoContentType;
	}

	public void setLogoContentType(String logoContentType) {
		this.logoContentType = logoContentType;
	}
	
	

}
