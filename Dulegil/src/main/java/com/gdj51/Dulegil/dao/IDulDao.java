package com.gdj51.Dulegil.dao;

import java.util.HashMap;

public interface IDulDao {

	
	// 관리자 로그인 체크 
	public HashMap<String, String> getMap(String string, HashMap<String, String> params)throws Throwable;

}
