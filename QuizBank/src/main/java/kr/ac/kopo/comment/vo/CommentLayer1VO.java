package kr.ac.kopo.comment.vo;

public class CommentLayer1VO {
	private int comment_lay1_no;
	private int quiz_no;
	private int ori_comment_no;
	private String member_email;
	private String written;
	private String reg_dt;
	// 추가
	private String nick_nm;
	
	public CommentLayer1VO() {
		super();
	}

	public CommentLayer1VO(int comment_lay1_no, int quiz_no, int ori_comment_no, String member_email, String written,
			String reg_dt) {
		super();
		this.comment_lay1_no = comment_lay1_no;
		this.quiz_no = quiz_no;
		this.ori_comment_no = ori_comment_no;
		this.member_email = member_email;
		this.written = written;
		this.reg_dt = reg_dt;
	}

	public int getComment_lay1_no() {
		return comment_lay1_no;
	}

	public void setComment_lay1_no(int comment_lay1_no) {
		this.comment_lay1_no = comment_lay1_no;
	}

	public int getQuiz_no() {
		return quiz_no;
	}

	public void setQuiz_no(int quiz_no) {
		this.quiz_no = quiz_no;
	}

	public int getOri_comment_no() {
		return ori_comment_no;
	}

	public void setOri_comment_no(int ori_comment_no) {
		this.ori_comment_no = ori_comment_no;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getWritten() {
		return written;
	}

	public void setWritten(String written) {
		this.written = written;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	
	// 추가
	public String getNick_nm() {
		return nick_nm;
	}

	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}

	@Override
	public String toString() {
		return "CommentLayer1VO [comment_lay1_no=" + comment_lay1_no + ", quiz_no=" + quiz_no + ", ori_comment_no="
				+ ori_comment_no + ", member_email=" + member_email + ", written=" + written + ", reg_dt=" + reg_dt
				+ "]";
	}

}
