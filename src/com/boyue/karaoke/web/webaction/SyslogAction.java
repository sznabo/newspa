package com.boyue.karaoke.web.webaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.model.Syslog;
import com.boyue.karaoke.service.SyslogService;

/**
 *
 * @author ben
 * @date   2014-7-2 下午2:40:08
 *
 */
@Controller("SyslogAction")
@Scope(value = "prototype")
public class SyslogAction extends BaseAction<Syslog> {

	@Autowired
	private SyslogService syslogService;
	private Syslog syslog;
	
	public String findPage() {
		this.pageBean = syslogService.findPage(syslog, pageNo, pageSize);
		return SUCCESS;
	}

	public Syslog getSyslog() {
		return syslog;
	}

	public void setSyslog(Syslog syslog) {
		this.syslog = syslog;
	}
	
}
