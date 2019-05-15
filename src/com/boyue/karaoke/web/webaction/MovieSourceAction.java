package com.boyue.karaoke.web.webaction;

import com.boyue.karaoke.model.MovieSource;
import com.boyue.karaoke.service.MovieSourceService;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.boyue.karaoke.web.webaction.MovieSourceAction;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;






@Controller("MovieSourceAction")
@Scope("prototype")
public class MovieSourceAction
  extends DefaultBaseAction<MovieSource>
{
  @Autowired
  private MovieSourceService movieSourceService;
  private MovieSource model;
  private List<MovieSource> movie;
  
  public String findPage() {
    if (this.model == null) {
      this.model = new MovieSource();
    }
    this.movie = this.movieSourceService.findAll();
    return "success";
  }




  
  public String toUpdate() {
    if (this.model != null) {
      this.model = this.movieSourceService.findById(Integer.valueOf(this.model.getId()));
    }
    return "success";
  }
  
  public String update() {
    this.movieSourceService.update(this.model);
    return "success";
  }
  
  public MovieSource getModel() { return this.model; }

  
  public void setModel(MovieSource model) { this.model = model; }

  
  public List<MovieSource> getMovie() { return this.movie; }

  
  public void setMovie(List<MovieSource> movie) { this.movie = movie; }
}

