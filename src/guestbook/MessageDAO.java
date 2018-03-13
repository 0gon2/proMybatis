package guestbook;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisConnector;

public class MessageDAO extends MybatisConnector {
	private static MessageDAO messageDao = new MessageDAO();
	public static MessageDAO getInstance() {
		return messageDao;
	}
	private MessageDAO() {}
    private final String namespace="ldg.mybatis";
    SqlSession sqlSession;
	
	public int insert(MessageVO message) throws SQLException {
		sqlSession=sqlSession();
		int max=sqlSession.selectOne(namespace+".getMessageNum",message);
		message.setNum(message.getNum()+1);
		sqlSession.insert(namespace+".insert",message);
		sqlSession.commit();
		sqlSession.close();
		return max;
	}

	public MessageVO select(int num) throws SQLException {
		sqlSession=sqlSession();
		Map map = new HashMap<>();
		map.put("num", num);
		MessageVO sel=sqlSession.selectOne(namespace+".select",map);
		sqlSession.close();
		return sel;
	}

	public int selectCount(String receiverid) throws SQLException {
		sqlSession=sqlSession();
		Map map = new HashMap<>();
		map.put("receiverid", receiverid);
		int number=sqlSession.selectOne(namespace+".selectCount",map);
		sqlSession.close();
		return number;
	}

	public List<ListVO> selectList(String memberid, int startRow, int endRow) 
			throws SQLException {
		sqlSession=sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow-1);
		map.put("endRow", endRow-startRow+1);
		map.put("memberid", memberid);
		List li=sqlSession.selectList(namespace+".selectList", map);
		sqlSession.close();
		return li;
	}

	public int deleteMessage(int num) throws SQLException {
		sqlSession=sqlSession();
		Map map = new HashMap<>();
		map.put("num", num);
		int number =sqlSession.delete(namespace+".deleteMessage", map);
		sqlSession.commit();
		sqlSession.close();
		return number ;
	}
	
}
