package com.boyue.karaoke.service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.MovieSource;
import java.util.List;

public interface MovieSourceService {
  void update(MovieSource paramMovieSource);
  
  PageBean<MovieSource> findPage(MovieSource paramMovieSource, int paramInt1, int paramInt2);
  
  List<MovieSource> findAll();
  
  MovieSource findById(Integer paramInteger);
}

