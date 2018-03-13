package member;

import java.sql.Date;

public class MemberVO {
	private String memberid;
	private String password;
	private String name;
	private int birthday;
	private String sch_emt;
	private String sch_mid;
	private String sch_high;
	private Date joindate;
	private int point;
	
	private String profile;
	private int prosize;
	private String background;
	private int backsize;
	
	
	
	private String emtid;
	public int getProsize() {
		return prosize;
	}
	public void setProsize(int prosize) {
		this.prosize = prosize;
	}
	public int getBacksize() {
		return backsize;
	}
	public void setBacksize(int backsize) {
		this.backsize = backsize;
	}
	private String midid;
	private String highid;
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
	
	public String getEmtid() {
		return emtid;
	}
	public void setEmtid(String emtid) {
		this.emtid = emtid;
	}
	public String getMidid() {
		return midid;
	}
	public void setMidid(String midid) {
		this.midid = midid;
	}
	public String getHighid() {
		return highid;
	}
	public void setHighid(String highid) {
		this.highid = highid;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBirthday() {
		return birthday;
	}
	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}
	public String getSch_emt() {
		return sch_emt;
	}
	public void setSch_emt(String sch_emt) {
		this.sch_emt = sch_emt;
	}
	public String getSch_mid() {
		return sch_mid;
	}
	public void setSch_mid(String sch_mid) {
		this.sch_mid = sch_mid;
	}
	public String getSch_high() {
		return sch_high;
	}
	public void setSch_high(String sch_high) {
		this.sch_high = sch_high;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
