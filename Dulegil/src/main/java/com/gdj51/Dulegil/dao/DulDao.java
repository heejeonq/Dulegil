package com.gdj51.Dulegil.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DulDao implements IDulDao {
	@Autowired
	public SqlSession session;
	
	
	// 관리자 로그인 체크 
	@Override
	public HashMap<String, String> getMap(String string, HashMap<String, String> params)throws Throwable {
		return session.selectOne("adLogin.checkMem", params);
	}
	
	

}
