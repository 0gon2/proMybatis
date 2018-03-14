package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.BoardDataBean;
import util.MybatisConnector;


public class MemberDAO extends MybatisConnector{
	
	
	private static MemberDAO messageDao = new MemberDAO();
	public static MemberDAO getInstance() {
		return messageDao;
	}
	private MemberDAO() {}
    private final String namespace="ldg.mybatis";
    SqlSession sqlSession;
    
    
	public int updateArticle(MemberVO article) {
		sqlSession=sqlSession();
		int updateCount = sqlSession.update(namespace+".updateArticle", article);
		sqlSession.commit();
		sqlSession.close();
		return updateCount;
	}
	
	//회원 탈퇴
	public void deleteArticle(String memberid) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("memberid", memberid);
		sqlSession.update(namespace+".deleteArticle", map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public int login(String memberid, String password) {
		String sql = "SELECT password FROM member WHERE memberid=?";
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("password", password);
		String chk=sqlSession.selectOne(namespace+".login",map);
		if(chk!=null) {
			if(chk.equals(password)) {
				return 1;	//로그인 성공
			}
			else {
				return 0;	//비밀번호 불일치
			}
		}
		sqlSession.close();
			return -1; //아이디가 없다
	}
	
	//회원등록 메소드
	public void insertMember(MemberVO member) {
		sqlSession=sqlSession();
		sqlSession.insert(namespace+".insertMember",member);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	//친구관계 테이블에 회원 추가
	public void requestFriend(relationVO rel) {
		sqlSession=sqlSession();
		sqlSession.insert(namespace+".requestFriend",rel);
		sqlSession.commit();
		sqlSession.close();
	}
	
	//친구요청보내기
	public void addRequest(String myId ,String otherId) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "insert into relation(myid, otherid, status) values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, myId);
			pstmt.setString(2, otherId);
			pstmt.setInt(3, 1);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

	}
	
	public void acceptRequest(String myId, String otherId) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "update relation set status=2 "
					+ "where (myid=? and otherid=?) or (myid=? and otherid=?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myId);
			pstmt.setString(2, otherId);
			pstmt.setString(3, otherId);
			pstmt.setString(4, myId);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
	}
	
	public void listUpdate(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "update member set sch_emt=?, sch_mid=?,sch_high=? where memberid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getSch_emt());
			pstmt.setString(2, member.getSch_mid());
			pstmt.setString(3, member.getSch_high());
			pstmt.setString(4, member.getMemberid());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
	}
	
	public void profileUpload(MemberVO member,String memberid, int chk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="";
		try {
			conn = getConnection();
			if(chk==0) {
				sql = "update member set profile=?, prosize=? "
						+ "where memberid=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getProfile());
				pstmt.setInt(2, member.getProsize());
				pstmt.setString(3, memberid);
				pstmt.executeUpdate();
			}
			else{
				sql = "update member set background=?, backsize=? "
						+ "where memberid=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getBackground());
				pstmt.setInt(2, member.getBacksize());
				pstmt.setString(3, memberid);
				pstmt.executeUpdate();
			}

		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close(conn, pstmt, null);
		}
	}

	public String identifyRequest(String myId, String otherid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		String statement = null;
		try {
			con=getConnection();
			sql = "select myid from relation where myid=? and otherid=?"
					+ " and status=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, myId);
			pstmt.setString(2, otherid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				statement = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(con, pstmt, rs);
		}
		return statement;
	}
	

	public String getProfile(String memberid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		String profile = null;
		try {
			con=getConnection();
			sql = "select profile from member where memberid=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				profile = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return profile;
	}
	
	
	
	public String getBackground(String memberid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		String background = null;
		try {
			con=getConnection();
			sql = "select background from member where memberid=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				background = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(con, pstmt, rs);
		}
		return background;
	}
	
	public String getStatus(String myId, String otherid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		String status = null;
		try {
			con=getConnection();
			sql = "select status from relation where (myid=? and otherid=?) or"
					+ "(myid=? and otherid=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, myId);
			pstmt.setString(2, otherid);
			pstmt.setString(3, otherid);
			pstmt.setString(4, myId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				status = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(con, pstmt, rs);
		}
		return status;
	}

	//학교 명단 추출하는 메소드
	@SuppressWarnings("resource")
	public List getSchoolmate(int startRow, int endRow, String emtid,
			String midid, String highid, String sclass) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		
		try {
			conn = getConnection();
			if(sclass.equals("초등학교")) {
				sql = " select * from (select rownum rnum ,a.* from "
						+ "(select m.name, m.birthday,m.joindate, m.memberid, "
						+ "m.sch_emt, m.sch_mid, m.sch_high"
						+ " from MEMBER m, SCHOOL s where m.emtid=s.sid and sid=? "
						+ "order by joindate desc) "
						+ "	a ) where rnum  between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, emtid);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
			}
			if(sclass.equals("중학교")) {
				sql = " select * from (select rownum rnum ,a.* from "
						+ "(select m.name, m.birthday,m.joindate, m.memberid, "
						+ "m.sch_emt, m.sch_mid, m.sch_high"
						+ " from MEMBER m, SCHOOL s where m.midid=s.sid and sid=? "
						+ "order by joindate desc) "
						+ "	a ) where rnum  between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, midid);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			if(sclass.equals("고등학교")) {
				sql = " select * from (select rownum rnum ,a.* from "
						+ "(select m.name, m.birthday,m.joindate, m.memberid, "
						+ "m.sch_emt, m.sch_mid, m.sch_high"
						+ " from MEMBER m, SCHOOL s where m.highid=s.sid and sid=? "
						+ "order by joindate desc) "
						+ "	a ) where rnum  between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, highid);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
		
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList();
				do {
					SmemberVO article = new SmemberVO();
					article.setName(rs.getString("name"));
					article.setBirthday(rs.getInt("birthday"));
					article.setJoindate(rs.getDate("joindate"));
					article.setMemberid(rs.getString("memberid"));
					article.setSch_emt(rs.getString("sch_emt"));
					article.setSch_mid(rs.getString("sch_mid"));
					article.setSch_high(rs.getString("sch_high"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return articleList;
	}

	public List reqList(String id) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = " SELECT name, memberid from MEMBER, RELATION "
				+ "where myid=memberid and status=1 and otherid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList();
				do {
					MemberVO article = new MemberVO();
					article.setName(rs.getString("name"));
					article.setMemberid(rs.getString("memberid"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return articleList;
	}
	
	public List friendList(String id) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = " SELECT name, memberid FROM MEMBER WHERE "
					+ "MEMBERID in "
					+ "(SELECT otherid from relation "
					+ "where myid=? AND status=2) OR "
					+ "MEMBERID in "
					+ "(SELECT myid from relation "
					+ "where otherid=? AND status=2)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList();
				do {
					MemberVO article = new MemberVO();
					article.setName(rs.getString("name"));
					article.setMemberid(rs.getString("memberid"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return articleList;
	}
	//회원전체 리스트 
	
	public List getAllmember(int startRow, int endRow) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = " select * from (select rownum rnum ,a.* from "
					+ "(select *"
					+ " from member order by joindate desc) "
					+ "	a ) where rnum  between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList();
				do {
					MemberVO article = new MemberVO();
					article.setMemberid(rs.getString("memberid"));
					article.setPassword(rs.getString("password"));
					article.setName(rs.getString("name"));
					article.setBirthday(rs.getInt("birthday"));
					article.setJoindate(rs.getDate("joindate"));
					article.setSch_emt(rs.getString("sch_emt"));
					article.setSch_mid(rs.getString("sch_mid"));
					article.setSch_high(rs.getString("sch_high"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return articleList;
	}
	//동창 인원수 체크
	
	
	@SuppressWarnings("resource")
	public int getSchoolmateCount(String sclass, String emtid, String midid, String highid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int number = 0;
		try {
			con=getConnection();
			if(sclass.equals("초등학교")) {
				sql = "select nvl(count(*),0) from "
						+ "(SELECT m.name, m.birthday,m.joindate " + 
						"from MEMBER m, SCHOOL s "
						+ "where m.emtid=s.sid and sid=?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, emtid);
			}
			if(sclass.equals("중학교")) {
				sql = "select nvl(count(*),0) from "
						+ "(SELECT m.name, m.birthday,m.joindate " + 
						"from MEMBER m, SCHOOL s "
						+ "where m.midid=s.sid and sid=?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, midid);
			}
			if(sclass.equals("고등학교")) {
				sql = "select nvl(count(*),0) from "
						+ "(SELECT m.name, m.birthday,m.joindate " + 
						"from MEMBER m, SCHOOL s "
						+ "where m.highid=s.sid and sid=?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, highid);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(con, pstmt, rs);
		}
		return number;
	}

	public List findFriendList(int startRow, int endRow, String name, String sclass, String emtid, String midid, String highid ) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = "";
		
		try {
			conn = getConnection();
			if(sclass.equals("초등학교")) {
				sql = " select * from (select rownum rnum ,a.* from "
						+ "(SELECT memberid,sch_emt, sch_mid, sch_high, name, birthday, joindate "
						+ "FROM MEMBER m, school s "
						+ "where m.emtid=s.sid and name=? and sid=? "
						+ "order by joindate desc)"
						+ "	a ) where rnum  between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, emtid);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
			}
			if(sclass.equals("중학교")) {
				sql = " select * from (select rownum rnum ,a.* from "
						+ "(SELECT memberid,sch_emt, sch_mid, sch_high, name, birthday, joindate "
						+ "FROM MEMBER m, school s "
						+ "where m.midid=s.sid and name=? and sid=?"
						+ "order by joindate desc)"
						+ "	a ) where rnum  between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, midid);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			if(sclass.equals("고등학교")) {
				sql = " select * from (select rownum rnum ,a.* from "
						+ "(SELECT memberid,sch_emt, sch_mid, sch_high ,name, birthday, joindate "
						+ "FROM MEMBER m, school s "
						+ "where m.highid=s.sid and name=? and sid=? "
						+ "order by joindate desc)"
						+ "	a ) where rnum  between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, highid);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
		
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList();
				do {
					SmemberVO article = new SmemberVO();
					
					article.setName(rs.getString("name"));
					article.setBirthday(rs.getInt("birthday"));
					article.setJoindate(rs.getDate("joindate"));
					article.setMemberid(rs.getString("memberid"));
					article.setSch_emt(rs.getString("sch_emt"));
					article.setSch_mid(rs.getString("sch_mid"));
					article.setSch_high(rs.getString("sch_high"));
					
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return articleList;
	}
	
	

	@SuppressWarnings("resource")
	public int findFriendCount(String sclass, String name, String emtid, String midid, String highid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int number = 0;
		try {
			con=getConnection();
			if(sclass.equals("초등학교")) {
				sql = "SELECT nvl(count(*),0) "
						+ "FROM MEMBER m, school s where "
						+ "m.emtid=s.sid and name=? and sid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, emtid);
			}
			if(sclass.equals("중학교")) {
				sql = "SELECT nvl(count(*),0) "
						+ "FROM MEMBER m, school s where "
						+ "m.midid=s.sid and name=? and sid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, midid);
			}
			if(sclass.equals("고등학교")) {
				sql = "SELECT nvl(count(*),0) "
						+ "FROM MEMBER m, school s where "
						+ "m.highid=s.sid and name=? and sid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, highid);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(con, pstmt, rs);
		}
		return number;
	}
	
	
	
	
	
	public int reqeustCount(String myid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int number = 0;
		try {
			con=getConnection();
			sql = "select nvl(count(*),0) from relation where otherid=?"
					+ "and status=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, myid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(con, pstmt, rs);
		}
		return number;
	}

	//전체 회원 수 카운팅
	public int getMemberCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int number = 0;
		try {
			con=getConnection();
			sql = "select nvl(count(*),0) from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(con, pstmt, rs);
		}
		return number;
	}

	
	
	public MemberVO getUserInfo(String memberid) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO article = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select memberid, name,sch_emt, sch_mid, sch_high, birthday "
					+ "from member where memberid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new MemberVO();
				article.setMemberid(rs.getString("memberid"));
				article.setName(rs.getString("name"));
				article.setSch_emt(rs.getString("sch_emt"));
				article.setSch_mid(rs.getString("sch_mid"));
				article.setSch_high(rs.getString("sch_high"));
				article.setBirthday(rs.getInt("birthday"));
				}
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return article;
	}
	

	
	public BoardDataBean getHot() {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select subject "
					+ "from board where boardid=1 and readcount>20";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
				article.setSubject(rs.getString("subject"));
				}
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return article;
	}
	//학교 id를 가지고 오는 메소드
	
	public MemberVO getSchoolId(String memberid) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO article = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select emtid, midid, highid "
					+ "from member where memberid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new MemberVO();
				article.setEmtid(rs.getString("emtid"));
				article.setMidid(rs.getString("midid"));
				article.setHighid(rs.getString("highid"));
				}
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return article;
	}
}
