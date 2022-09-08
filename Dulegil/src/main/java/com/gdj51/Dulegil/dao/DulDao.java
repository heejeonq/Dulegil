package com.gdj51.Dulegil.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DulDao implements IDulDao {
	@Autowired
	public SqlSession session;
	
	

}
