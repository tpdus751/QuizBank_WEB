package kr.ac.kopo.member.vo;

public class MemberVO {
	private String member_email;
	private String member_nm;
	private String member_pwd;
	private String nick_nm;
	private String type;
	private String phone1;
	private String phone2;
	private String phone3;
	private int credit;
	private String reg_dt;
	private String prohibit;
	
	public MemberVO() {
	}

	public MemberVO(String member_email) {
		this.member_email = member_email;
	}
	
	public MemberVO(String member_email, String member_pwd) {
		this.member_email = member_email;
		this.member_pwd = member_pwd;
	}

	public MemberVO(String member_email, String nick_nm, String type) {
		super();
		this.member_email = member_email;
		this.nick_nm = nick_nm;
		this.type = type;
	}
	
	

	public MemberVO(String member_email, String member_nm, String member_pwd, String nick_nm, String type,
			String phone1, String phone2, String phone3, int credit) {
		super();
		this.member_email = member_email;
		this.member_nm = member_nm;
		this.member_pwd = member_pwd;
		this.nick_nm = nick_nm;
		this.type = type;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.credit = credit;
	}

	public MemberVO(String member_email, String member_nm, String member_pwd, String nick_nm, String type,
			String phone1, String phone2, String phone3, int credit, String reg_dt, String prohibit) {
		this.member_email = member_email;
		this.member_nm = member_nm;
		this.member_pwd = member_pwd;
		this.nick_nm = nick_nm;
		this.type = type;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.credit = credit;
		this.reg_dt = reg_dt;
		this.prohibit = prohibit;
	}



	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_nm() {
		return member_nm;
	}

	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getNick_nm() {
		return nick_nm;
	}

	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getProhibit() {
		return prohibit;
	}

	public void setProhibit(String prohibit) {
		this.prohibit = prohibit;
	}

	@Override
	public String toString() {
		return "MemberVO [member_email=" + member_email + ", member_nm=" + member_nm + ", member_pwd=" + member_pwd
				+ ", nick_nm=" + nick_nm + ", type=" + type + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3="
				+ phone3 + ", credit=" + credit + ", reg_dt=" + reg_dt + ", prohibit=" + prohibit + "]";
	}
	
	
	
	
}
