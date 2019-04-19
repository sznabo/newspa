package com.boyue.spa.domain;

/**
 *
 * @author ben
 * @date   2013-4-25 上午11:20:26
 *
 */
public class VideoStat {

	private Integer id;
	
	private Integer videoId;
	
	private Integer maxVisit;

	private String videoName;
	
	private Integer type;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public Integer getMaxVisit() {
		return maxVisit;
	}

	public void setMaxVisit(Integer maxVisit) {
		this.maxVisit = maxVisit;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
