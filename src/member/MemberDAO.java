package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisConnector;


public class MemberDAO extends MybatisConnector{
	
	
	private static MemberDAO messageDao = new MemberDAO();
	public static MemberDAO getInstance() {
		return messageDao;
	}
	private MemberDAO() {}
    private final String namespace="ldg.member";
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
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("memberid", memberid);
		String chk=sqlSession.selectOne(namespace+".login",map);
		if(chk!=null) {
			if(chk.equals(password)) {return 1;}
			else {return 0;}
		}
		sqlSession.close();
		return -1; 
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
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("myid", myId);
		map.put("otherId", otherId);
		map.put("status", "1");
		sqlSession.insert(namespace+".addRequest",map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void acceptRequest(String myId, String otherId) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("myId", myId);
		map.put("otherId", otherId);
		sqlSession.update(namespace+".acceptRequest",map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void listUpdate(MemberVO member) {
		sqlSession=sqlSession();
		sqlSession.update(namespace+".listUpdate", member);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void profileUpload(MemberVO member, int chk) {
		sqlSession=sqlSession();
			if(chk==0) {
				sqlSession.update(namespace+".profileUpload", member);
			}
			else{
				sqlSession.update(namespace+".backgroundUpload", member);
			}
			sqlSession.commit();
			sqlSession.close();
	}

	public String identifyRequest(String myId, String otherid) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("myid", myId);
		map.put("otherid", otherid);
		String statement=sqlSession.selectOne(namespace+".identifyRequest",map);
		sqlSession.close();
		return statement;
	}
	
	public String getProfile(String memberid) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("memberid", memberid);
		String profile=sqlSession.selectOne(namespace+".getProfile",map);
		sqlSession.close();
		return profile;
	}
	
	public String getBackground(String memberid) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("memberid", memberid);
		String background=sqlSession.selectOne(namespace+".getBackground",map);
		sqlSession.close();
		return background;
	}
	
	public String getStatus(String myId, String otherid) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("myId", myId);
		map.put("otherid", otherid);
		String status=sqlSession.selectOne(namespace+".getStatus",map);
		sqlSession.close();
		return status;
	}

	//학교 명단 추출하는 메소드
	public List getSchoolmate(int startRow, int endRow, String emtid,
			String midid, String highid, String sclass) {
		sqlSession=sqlSession();
		Map map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("emtid", emtid);
		map.put("midid", midid);
		map.put("highid", highid);
		List li = null;
			if(sclass.equals("초등학교")) {
				li=sqlSession.selectList(namespace+".getEmtmate",map);
			}
			if(sclass.equals("중학교")) {
				li=sqlSession.selectList(namespace+".getMidmate",map);
			}
			if(sclass.equals("고등학교")) {
				li=sqlSession.selectList(namespace+".getHighmate",map);
			}
		sqlSession.close();
		return li;
	}
	public List reqList(String id) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		List li=sqlSession.selectList(namespace+".reqList",map);
		sqlSession.close();
		return li;
	}

	
	public List friendList(String id) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		List li=sqlSession.selectList(namespace+".friendList",map);
		sqlSession.close();
		return li;
	}
	
	
	
	
	public List getAllmember(int startRow, int endRow) {
		sqlSession=sqlSession();
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List li=sqlSession.selectList(namespace+".getAllmember",map);
		sqlSession.close();
		return li;
	}
	//동창 인원수 체크
	
	
	public int getSchoolmateCount(String sclass, 
			String emtid, String midid, String highid) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<>();
		map.put("emtid", emtid);
		map.put("midid", midid);
		map.put("highid", highid);
		int number=0;
			if(sclass.equals("초등학교")) {
				number=sqlSession.selectOne(namespace+".emtCount",map);
			}
			if(sclass.equals("중학교")) {
				number=sqlSession.selectOne(namespace+".midCount",map);
			}
			if(sclass.equals("고등학교")) {
				number=sqlSession.selectOne(namespace+".highCount",map);
			}
			sqlSession.close();
		return number;
	}
 /*여기까지~~~~~*/
	public List findFriendList(int startRow, int endRow, 
			String name, String sclass, String emtid, 
			String midid, String highid ) {
		sqlSession=sqlSession();
		Map map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("name", name);
		map.put("emtid", emtid);
		map.put("midid", midid);
		map.put("highid", highid);
		List li = null;
		if(sclass.equals("초등학교")) {
			li=sqlSession.selectList(namespace+".friendListEmt",map);
		}
		if(sclass.equals("중학교")) {
			li=sqlSession.selectList(namespace+".friendListMid",map);
		}
		if(sclass.equals("고등학교")) {
			li=sqlSession.selectList(namespace+".friendListHigh",map);
		}
		sqlSession.close();
		return li;
	}
	
	public int findFriendCount(String sclass, String name, 
			String emtid, String midid, String highid) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<>();
		map.put("name", name);
		map.put("emtid", emtid);
		map.put("midid", midid);
		map.put("highid", highid);
		int number = 0;
			if(sclass.equals("초등학교")) {
				number=sqlSession.selectOne(namespace+".emtListCount",map);
			}
			if(sclass.equals("중학교")) {
				number=sqlSession.selectOne(namespace+".midListCount",map);
			}
			if(sclass.equals("고등학교")) {
				number=sqlSession.selectOne(namespace+".highListCount",map);
			}
		sqlSession.close();
		return number;
	}
	
	
	public int reqeustCount(String myid) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<>();
		map.put("myid", myid);
		int number = sqlSession.selectOne(namespace+".reqeustCount",map);
		sqlSession.close();
		return number;
	}

	//전체 회원 수 카운팅
	public int getMemberCount() {
		sqlSession=sqlSession();
		int number = sqlSession.selectOne(namespace+".getMemberCount");
		sqlSession.close();
		return number;
	}
	
	public MemberVO getUserInfo(String memberid) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<>();
		map.put("memberid", memberid);
		MemberVO member=sqlSession.selectOne(namespace+".getUserInfo",map);
		sqlSession.close();
		return member;
	}
	
	//학교 id를 가지고 오는 메소드
	public MemberVO getSchoolId(String memberid) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<>();
		map.put("memberid", memberid);
		MemberVO member=sqlSession.selectOne(namespace+".getSchoolId",map);
		sqlSession.close();
		return member;
	}
}
