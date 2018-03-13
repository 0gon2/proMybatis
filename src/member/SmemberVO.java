package member;

import java.sql.Date;

public class SmemberVO {
	private String memberid;
	private String name;
	private Date joindate;
	private int birthday;
	
	private String sch_emt;
	private String sch_mid;
	private String sch_high;
	
	
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
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public int getBirthday() {
		return birthday;
	}
	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}
}
