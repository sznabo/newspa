package com.boyue.karaoke.dao;


import java.util.List;


import com.boyue.framework.dao.DAO;
import com.boyue.spa.domain.Vodpart;

public interface IVodPartDAO extends DAO<Vodpart> {

	public List<Vodpart> findAll();

	public List<Vodpart> findIsName(Vodpart v);

}
