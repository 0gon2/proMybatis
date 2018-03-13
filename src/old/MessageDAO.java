package old;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MessageDAO {
	private static MessageDAO messageDao = new MessageDAO();
	public static MessageDAO getInstance() {
		return messageDao;
	}
	
	public int insert(MessageVO message) throws SQLException {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement("select nvl(max(num),0) "
					+ "from guestbook");
			rs=pstmt.executeQuery();
			int max=0;
			if(rs.next()) {
				max=rs.getInt(1);
			}

			pstmt = conn.prepareStatement(
					"insert into guestbook(num, writerid, content, otherid)"
					+ " values (?, ?, ?, ? )");
			
			pstmt.setInt(1, max+1);
			pstmt.setString(2, message.getWriterid());
			pstmt.setString(3, message.getContent());
			pstmt.setString(4, message.getOtherid());
			return pstmt.executeUpdate();
		} finally {
			close(conn,pstmt,null);
		}
		
	}

	public MessageVO select(int num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn=null;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(
					"select * from guestbook where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return null;
				/*return makeMessageFromResultSet(rs);*/
			} else {
				return null;
			}
		} finally {
			close(conn,pstmt,rs);
		}
	}

	private ListVO makeMessageFromResultSet(ResultSet rs) throws SQLException {
		ListVO message=new ListVO();
		message.setBackground(rs.getString("profile"));
		message.setProfile(rs.getString("profile"));
		message.setNum(rs.getInt("num"));
		message.setContent(rs.getString("content"));
		message.setWriterid(rs.getString("writerid"));
		message.setName(rs.getString("name"));
		return message;
	}

	public int selectCount(String receiverid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn=null;
		String sql="";
		int number=0;
		try {
			conn=getConnection();
			sql = "select nvl(count(*),0) from guestbook where otherid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiverid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1);
			}
			return number;
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
			}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
			}
		}
	}

	public List<ListVO> selectList(String memberid, int startRow, int endRow) 
			throws SQLException {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		try {
			conn=getConnection();
			sql = " select * from (select rownum rnum ,a.* "
					+ "from(select num, writerid, name,content,profile, background "
					+ "from member m, guestbook g "
					+ "where m.memberid=g.writerid "
					+ "and otherid=? order by num desc)a ) "
					+ "where rnum  between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, endRow - startRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<ListVO> messageList = new ArrayList<ListVO>();
				do {
					messageList.add(makeMessageFromResultSet(rs));
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			close(conn,pstmt,rs);
		}
	}

	public int deleteMessage(int num) throws SQLException {
		PreparedStatement pstmt = null;
		Connection conn=null;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(
					"delete from guestbook where num = ?");
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} finally {
			close(conn, pstmt, null);
		}
	}

}
