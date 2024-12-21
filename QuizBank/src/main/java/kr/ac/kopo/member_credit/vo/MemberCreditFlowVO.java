package kr.ac.kopo.member_credit.vo;

public class MemberCreditFlowVO {
	private int flow_no;
	private String member_email;
	private int work_credit;
	private int member_credit;
	private String work_nm;
	private String work_dt;
	
	public MemberCreditFlowVO() {
		super();
	}

	public MemberCreditFlowVO(int flow_no, String member_email, int work_credit, int member_credit, String work_nm,
			String work_dt) {
		super();
		this.flow_no = flow_no;
		this.member_email = member_email;
		this.work_credit = work_credit;
		this.member_credit = member_credit;
		this.work_nm = work_nm;
		this.work_dt = work_dt;
	}

	public int getFlow_no() {
		return flow_no;
	}

	public void setFlow_no(int flow_no) {
		this.flow_no = flow_no;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getWork_credit() {
		return work_credit;
	}

	public void setWork_credit(int work_credit) {
		this.work_credit = work_credit;
	}

	public int getMember_credit() {
		return member_credit;
	}

	public void setMember_credit(int member_credit) {
		this.member_credit = member_credit;
	}

	public String getWork_nm() {
		return work_nm;
	}

	public void setWork_nm(String work_nm) {
		this.work_nm = work_nm;
	}

	public String getWork_dt() {
		return work_dt;
	}

	public void setWork_dt(String work_dt) {
		this.work_dt = work_dt;
	}

	@Override
	public String toString() {
		return "memberCreditFlowVO [flow_no=" + flow_no + ", member_email=" + member_email + ", work_credit="
				+ work_credit + ", member_credit=" + member_credit + ", work_nm=" + work_nm + ", work_dt=" + work_dt
				+ "]";
	}
	
	
}
