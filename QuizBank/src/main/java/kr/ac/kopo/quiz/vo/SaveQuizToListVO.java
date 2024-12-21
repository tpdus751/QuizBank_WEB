package kr.ac.kopo.quiz.vo;

public class SaveQuizToListVO {
	private String member_email;
	private int quiz_no;
	
	public SaveQuizToListVO() {
		super();
	}
	
	public SaveQuizToListVO(String member_email) {
		super();
		this.member_email = member_email;
	}

	public SaveQuizToListVO(String member_email, int quiz_no) {
		super();
		this.member_email = member_email;
		this.quiz_no = quiz_no;
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

	@Override
	public String toString() {
		return "SaveQuizToListVO [member_email=" + member_email + ", quiz_no=" + quiz_no + "]";
	}
	
}
