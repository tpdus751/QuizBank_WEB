package kr.ac.kopo.quiz.vo;

public class MultipleQuizChoiceVO {
	private int quiz_no;
	private String choice_1;
	private String choice_2;
	private String choice_3;
	private String choice_4;
	private String choice_5;
	
	public MultipleQuizChoiceVO() {
		super();
	}

	public MultipleQuizChoiceVO(int quiz_no, String choice_1, String choice_2, String choice_3, String choice_4,
			String choice_5) {
		super();
		this.quiz_no = quiz_no;
		this.choice_1 = choice_1;
		this.choice_2 = choice_2;
		this.choice_3 = choice_3;
		this.choice_4 = choice_4;
		this.choice_5 = choice_5;
	}

	public int getQuiz_no() {
		return quiz_no;
	}

	public void setQuiz_no(int quiz_no) {
		this.quiz_no = quiz_no;
	}

	public String getChoice_1() {
		return choice_1;
	}

	public void setChoice_1(String choice_1) {
		this.choice_1 = choice_1;
	}

	public String getChoice_2() {
		return choice_2;
	}

	public void setChoice_2(String choice_2) {
		this.choice_2 = choice_2;
	}

	public String getChoice_3() {
		return choice_3;
	}

	public void setChoice_3(String choice_3) {
		this.choice_3 = choice_3;
	}

	public String getChoice_4() {
		return choice_4;
	}

	public void setChoice_4(String choice_4) {
		this.choice_4 = choice_4;
	}

	public String getChoice_5() {
		return choice_5;
	}

	public void setChoice_5(String choice_5) {
		this.choice_5 = choice_5;
	}

	@Override
	public String toString() {
		return "MultipleQuizChoiceVO [quiz_no=" + quiz_no + ", choice_1=" + choice_1 + ", choice_2=" + choice_2
				+ ", choice_3=" + choice_3 + ", choice_4=" + choice_4 + ", choice_5=" + choice_5 + "]";
	}

	
	
}
