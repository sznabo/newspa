package com.boyue.karaoke.service.impl;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.MovieSourceDAO;
import com.boyue.karaoke.model.MovieSource;
import com.boyue.karaoke.service.MovieSourceService;
import com.boyue.karaoke.service.impl.MovieSourceServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;














@Service
public class MovieSourceServiceImpl
  implements MovieSourceService
{
  @Autowired
  private MovieSourceDAO movieSourceDao;
  
  public PageBean<MovieSource> findPage(MovieSource model, int pageNo, int pageSize) { return this.movieSourceDao.findPage(model, pageNo, pageSize); }


  
  public void update(MovieSource model) {
    if (model.getSource_state() == 1) {
      this.movieSourceDao.updateStatus(Integer.valueOf(model.getId()));
    }
    try {
      this.movieSourceDao.update(model);
    }
    catch (Exception e) {
      e.printStackTrace();
    } 
  }




  
  public MovieSource findById(Integer id) { return (MovieSource)this.movieSourceDao.findById(id); }




  
  public List<MovieSource> findAll() { return this.movieSourceDao.findAll(); }
}

