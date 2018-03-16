package board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisConnector;


public class BoardDBBean extends MybatisConnector{
		private final String namespace="ldg.mybatis";
		private static BoardDBBean instance = new BoardDBBean();
		public static BoardDBBean getInstance() {
			return instance;
		}
		SqlSession sqlSession;
		
		public int getArticleCount(String boardid) {
		int x = 0;
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardid", boardid);
		x=sqlSession.selectOne(namespace+".getArticleCount", map);
		sqlSession.close();
		return x;
		}
	   
		public List getArticles(int startRow, int endRow, String boardid) {
			sqlSession=sqlSession();
			Map map = new HashMap();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("boardid", boardid);
			List li=sqlSession.selectList(namespace+".getArticles", map);
			sqlSession.close();
			return li;
		}
		
		public void insertArticle(BoardDataBean article) {
			sqlSession=sqlSession();
			int number=sqlSession.selectOne(namespace+".getNextNumber");
			if(article.getNum()!=0) {//답글쓰기
				sqlSession.update(namespace+".updateRe_step", article);
				article.setRe_level(article.getRe_level()+1);
				article.setRe_step(article.getRe_step()+1);
			}else {//새글쓰기
				article.setRef(number);
				article.setRe_step(0);
				article.setRe_level(0);
			}
			article.setNum(number);
			sqlSession.insert(namespace+".insertBoard", article);
			sqlSession.commit();
			sqlSession.close();
		}
		public BoardDataBean getArticle(int num, String boardid, String chk) {
			sqlSession=sqlSession();
			Map map = new HashMap<>();
			map.put("num",num);
			map.put("boardid",boardid);
				if (chk.equals("content")) {
					sqlSession.update(namespace+".addReadCount",map);
				}
				BoardDataBean article =sqlSession.selectOne(namespace+".getArticle", map);
				sqlSession.commit();
				sqlSession.close();
			return article;
		}
		
		public int updateArticle(BoardDataBean article) {
			sqlSession=sqlSession();
			int updateCount=sqlSession.update(namespace+".updateArticle",article);
			sqlSession.commit();
			sqlSession.close();
			return updateCount;
		}
		public int deleteArticle(int num, String passwd) {
			sqlSession=sqlSession();
			Map map = new HashMap<>();
			map.put("num",num);
			map.put("passwd",passwd);
			int deleteNum=sqlSession.delete(namespace+".deleteArticle",map);
			sqlSession.commit();
			sqlSession.close();
			return deleteNum;
		}
		
		
		
	   
}
