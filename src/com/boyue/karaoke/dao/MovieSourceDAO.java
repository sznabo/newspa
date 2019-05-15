package com.boyue.karaoke.dao;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.MovieSource;
import java.util.List;

public interface MovieSourceDAO extends DAO<MovieSource> {
  List<MovieSource> findAll();
  
  boolean updateStatus(Integer paramInteger);
  
  MovieSource findByStatu();
}
