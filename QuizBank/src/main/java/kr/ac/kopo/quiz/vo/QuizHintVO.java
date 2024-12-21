package kr.ac.kopo.quiz.vo;

public class QuizHintVO {
	private int quiz_no;
	private String separate;
	private String korean;
	private String english;
	private String code;
	private String num;
	
	public QuizHintVO() {
		super();
	}

	public QuizHintVO(int quiz_no, String separate, String korean, String english, String code, String num) {
		super();
		this.quiz_no = quiz_no;
		this.separate = separate;
		this.korean = korean;
		this.english = english;
		this.code = code;
		this.num = num;
	}

	public int getQuiz_no() {
		return quiz_no;
	}

	public void setQuiz_no(int quiz_no) {
		this.quiz_no = quiz_no;
	}

	public String getSeparate() {
		return separate;
	}

	public void setSeparate(String separate) {
		this.separate = separate;
	}

	public String getKorean() {
		return korean;
	}

	public void setKorean(String korean) {
		this.korean = korean;
	}

	public String getEnglish() {
		return english;
	}

	public void setEnglish(String english) {
		this.english = english;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "QuizHintVO [quiz_no=" + quiz_no + ", separate=" + separate + ", korean=" + korean + ", english="
				+ english + ", code=" + code + ", num=" + num + "]";
	}
	
	
}
