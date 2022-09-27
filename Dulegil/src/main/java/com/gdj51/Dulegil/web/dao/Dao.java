package com.gdj51.Dulegil.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Dao implements IDao {

	@Autowired
	SqlSession sqlSession;

//	public int getInt2(int kkk, int hhh) throws Throwable {
//		int d = kkk + hhh;
//		return d;
//	}

	// 메소드(함수)를 생성해 그때는 괄호 안의 값이 받아오는 값.
//	public int getInt(String sql) throws Throwable {
//		
//		return sqlSession.selectOne(sql);
//             sqlSession에 있는 selectOne메소드를 호출하면서 가로안에있는 String sql을 넘겨줌. 
//		sqlSession 메서드 호출 시 
//       sqlSession(1,2) 가 있다면 1은 sql.xml의 namespace.id에 들어가는 값
//								2는 parameter에 들어가는 값
//	}

	@Override
	public int getInt(String sql) throws Throwable {
		return sqlSession.selectOne(sql);
	}

	@Override
	public int getInt(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}

	@Override
	public String getString(String sql) throws Throwable {
		return sqlSession.selectOne(sql);
	}

	@Override
	public String getString(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}

	@Override
	public HashMap<String, String> getMap(String sql) throws Throwable {
		return sqlSession.selectOne(sql);
	}

	@Override
	public HashMap<String, String> getMap(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne(sql, params);
	}

	@Override
	public List<HashMap<String, String>> getList(String sql) throws Throwable {
		return sqlSession.selectList(sql);
	}

	@Override
	public List<HashMap<String, String>> getList(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList(sql, params);
	}

	@Override
	public int insert(String sql) throws Throwable {
		return sqlSession.insert(sql);
	}

	@Override
	public int insert(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.insert(sql, params);
	}

	@Override
	public int update(String sql) throws Throwable {
		return sqlSession.update(sql);
	}

	@Override
	public int update(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.update(sql, params);
	}

	@Override
	public int delete(String sql) throws Throwable {
		return sqlSession.delete(sql);
	}

	@Override
	public int delete(String sql, HashMap<String, String> params) throws Throwable {
		return sqlSession.delete(sql, params);
	}

}
