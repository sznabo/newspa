package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.karaoke.model.TemlCfg;

public interface TemlCfgService {
	 TemlCfg  findByKey(String key);
	 List<TemlCfg> findAll();
	 boolean update(TemlCfg temlCfg);
}
