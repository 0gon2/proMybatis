package school;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SchoolDAO {
	private static SchoolDAO instance = new SchoolDAO();
	private SchoolDAO() {
	}
	public static SchoolDAO getInstance() {
		return instance;
	}
	//커넥션 연결 메소드(1)
	public static Connection getConnection() {
		Connection con = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbId = "scott";
			String dbPass = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return con;
	}

	// 커넥션 해제 메소드(1)
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {

			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {

			}
		if (con != null)
			try {
				con.close();
			} catch (SQLException ex) {

			}

	}
	
	public List getSchools(String sname, String sclass) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List schoolList = null;
		String sql="";
		try {
			con=getConnection();
			sql="select sid, sname, saddress from school where "
					+ "sname like '%'||?||'%' and sclass=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, sname);
			ps.setString(2, sclass);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				schoolList=new ArrayList<>();
				do {
					SchoolVO school = new SchoolVO();
					school.setSname(rs.getString("sname"));
					school.setSaddress(rs.getString("saddress"));
					school.setSclass(sclass);
					school.setSid(rs.getString("sid"));
					schoolList.add(school);
				}while(rs.next());
			}
		}catch (Exception e) {
			e.getStackTrace();
		}finally {
			close(con,ps,rs);
		}
		
		return schoolList;
	}
}
