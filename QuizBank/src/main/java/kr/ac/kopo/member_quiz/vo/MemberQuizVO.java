package kr.ac.kopo.member_quiz.vo;

public class MemberQuizVO {
	private String member_email;
	private int quiz_no;
	private String is_correct;
	private int quiz_try_cnt;
	
	public MemberQuizVO() {
		super();
	}
	
	public MemberQuizVO(String member_email, int quiz_no) {
		super();
		this.member_email = member_email;
		this.quiz_no = quiz_no;
	}

	public MemberQuizVO(String member_email, int quiz_no, String is_correct, int quiz_try_cnt) {
		super();
		this.member_email = member_email;
		this.quiz_no = quiz_no;
		this.is_correct = is_correct;
		this.quiz_try_cnt = quiz_try_cnt;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getQuiz_no() {
		return quiz_no;
	}

	public void setQuiz_no(int quiz_no) {
		this.quiz_no = quiz_no;
	}

	public String getIs_correct() {
		return is_correct;
	}

	public void setIs_correct(String is_correct) {
		this.is_correct = is_correct;
	}

	public int getQuiz_try_cnt() {
		return quiz_try_cnt;
	}

	public void setQuiz_try_cnt(int quiz_try_cnt) {
		this.quiz_try_cnt = quiz_try_cnt;
	}

	@Override
	public String toString() {
		return "MemberQuizVO [member_email=" + member_email + ", quiz_no=" + quiz_no + ", is_correct=" + is_correct
				+ ", quiz_try_cnt=" + quiz_try_cnt + "]";
	}
	
	
}
