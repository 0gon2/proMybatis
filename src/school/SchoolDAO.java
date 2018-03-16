package school;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisConnector;


public class SchoolDAO extends MybatisConnector {
	private static SchoolDAO instance = new SchoolDAO();
	private SchoolDAO() {
	}
	public static SchoolDAO getInstance() {
		return instance;
	}
	private final String namespace="ldg.school";
	SqlSession sqlSession;
	
	public List getSchools(String sname, String sclass) {
		sqlSession=sqlSession();
		Map<String, String> map= new HashMap<>();
		map.put("sname", sname);
		map.put("sclass", sclass);
		List schoolList=sqlSession.selectList(namespace+".getSchools",map);
		return schoolList;
	}
}
