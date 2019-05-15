package com.boyue.karaoke.dao.impl;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.MovieSourceDAO;
import com.boyue.karaoke.dao.impl.MovieSourceDaoImpl;
import com.boyue.karaoke.model.MovieSource;
import org.springframework.stereotype.Repository;







@Repository
public class MovieSourceDaoImpl
  extends BaseDAOImpl<MovieSource>
  implements MovieSourceDAO
{
  public boolean updateStatus(Integer id) { return (executeSql("update movie_source set source_state=0 where id<>" + id) > 0); }




  
  public MovieSource findByStatu() { return null; }
}
