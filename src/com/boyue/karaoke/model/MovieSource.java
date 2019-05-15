package com.boyue.karaoke.model;
import com.boyue.karaoke.model.MovieSource;
import java.io.Serializable;

public class MovieSource
  implements Serializable
{
  private int id;
  private String source_name;
  private int source_state;
  
  public int getId() { return this.id; }

  
  public void setId(int id) { this.id = id; }

  
  public String getSource_name() { return this.source_name; }

  
  public void setSource_name(String source_name) { this.source_name = source_name; }

  
  public int getSource_state() { return this.source_state; }

  
  public void setSource_state(int source_state) { this.source_state = source_state; }
}
