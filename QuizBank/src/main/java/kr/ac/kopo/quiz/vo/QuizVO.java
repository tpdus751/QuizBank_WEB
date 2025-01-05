package kr.ac.kopo.quiz.vo;

public class QuizVO {
	private int quiz_no;
	private int ori_code_no;
	private int group_no;
	private int group_layer;
	private String member_email;
	private int subject_no;
	private String quiz_nm;
	private String quiz_type;
	private String content;
	private String explanation;
	private String answer;
	private String reg_dt;
	private int try_cnt;
	private int correct_ratio;
	private int view_cnt;
	private String quiz_img;
	private int correct_cnt;
	
	// 추가
	private String nick_nm;
	private String subject_nm;
	
	public QuizVO() {
	}
	
	public QuizVO(int quiz_no, String member_email) {
		super();
		this.quiz_no = quiz_no;
		this.member_email = member_email;
	}

	public QuizVO(int quiz_no, String quiz_nm, String content, String explanation, String answer) {
		super();
		this.quiz_no = quiz_no;
		this.quiz_nm = quiz_nm;
		this.content = content;
		this.explanation = explanation;
		this.answer = answer;
	}



	public QuizVO(String member_email, int subject_no, String quiz_nm, String quiz_type, String content,
			String explanation, String answer, String quiz_img) {
		super();
		this.member_email = member_email;
		this.subject_no = subject_no;
		this.quiz_nm = quiz_nm;
		this.quiz_type = quiz_type;
		this.content = content;
		this.explanation = explanation;
		this.answer = answer;
		this.quiz_img = quiz_img;
	}


	public QuizVO(int quiz_no, int ori_code_no, int group_no, int group_layer, String member_email, int subject_no,
			String quiz_nm, String quiz_type, String content, String explanation, String answer, String reg_dt,
			int try_cnt, int correct_ratio, int view_cnt, String quiz_img) {
		this.quiz_no = quiz_no;
		this.ori_code_no = ori_code_no;
		this.group_no = group_no;
		this.group_layer = group_layer;
		this.member_email = member_email;
		this.subject_no = subject_no;
		this.quiz_nm = quiz_nm;
		this.quiz_type = quiz_type;
		this.content = content;
		this.explanation = explanation;
		this.answer = answer;
		this.reg_dt = reg_dt;
		this.try_cnt = try_cnt;
		this.correct_ratio = correct_ratio;
		this.view_cnt = view_cnt;
		this.quiz_img = quiz_img;
	}
	
	
	public QuizVO(int quiz_no, int ori_code_no, int group_no, int group_layer, String member_email, int subject_no,
			String quiz_nm, String quiz_type, String content, String explanation, String answer, String reg_dt,
			int try_cnt, int correct_ratio, int view_cnt, String quiz_img, int correct_cnt) {
		super();
		this.quiz_no = quiz_no;
		this.ori_code_no = ori_code_no;
		this.group_no = group_no;
		this.group_layer = group_layer;
		this.member_email = member_email;
		this.subject_no = subject_no;
		this.quiz_nm = quiz_nm;
		this.quiz_type = quiz_type;
		this.content = content;
		this.explanation = explanation;
		this.answer = answer;
		this.reg_dt = reg_dt;
		this.try_cnt = try_cnt;
		this.correct_ratio = correct_ratio;
		this.view_cnt = view_cnt;
		this.quiz_img = quiz_img;
		this.correct_cnt = correct_cnt;
	}

	public int getQuiz_no() {
		return quiz_no;
	}

	public void setQuiz_no(int quiz_no) {
		this.quiz_no = quiz_no;
	}

	public int getOri_code_no() {
		return ori_code_no;
	}

	public void setOri_code_no(int ori_code_no) {
		this.ori_code_no = ori_code_no;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getGroup_layer() {
		return group_layer;
	}

	public void setGroup_layer(int group_layer) {
		this.group_layer = group_layer;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getSubject_no() {
		return subject_no;
	}

	public void setSubject_no(int subject_no) {
		this.subject_no = subject_no;
	}

	public String getQuiz_nm() {
		return quiz_nm;
	}

	public void setQuiz_nm(String quiz_nm) {
		this.quiz_nm = quiz_nm;
	}

	public String getQuiz_type() {
		return quiz_type;
	}

	public void setQuiz_type(String quiz_type) {
		this.quiz_type = quiz_type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public int getTry_cnt() {
		return try_cnt;
	}

	public void setTry_cnt(int try_cnt) {
		this.try_cnt = try_cnt;
	}

	public int getCorrect_ratio() {
		return correct_ratio;
	}

	public void setCorrect_ratio(int correct_ratio) {
		this.correct_ratio = correct_ratio;
	}
	
	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getQuiz_img() {
		return quiz_img;
	}

	public void setQuiz_img(String quiz_img) {
		this.quiz_img = quiz_img;
	}
	
	public int getCorrect_cnt() {
		return correct_cnt;
	}

	public void setCorrect_cnt(int correct_cnt) {
		this.correct_cnt = correct_cnt;
	}
	
	// 추가
	public String getNick_nm() {
		return nick_nm;
	}

	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}
	
	public String getSubject_nm() {
		return subject_nm;
	}

	public void setSubject_nm(String subject_nm) {
		this.subject_nm = subject_nm;
	}

	@Override
	public String toString() {
		return "QuizVO [quiz_no=" + quiz_no + ", ori_code_no=" + ori_code_no + ", group_no=" + group_no
				+ ", group_layer=" + group_layer + ", member_email=" + member_email + ", subject_no=" + subject_no
				+ ", quiz_nm=" + quiz_nm + ", quiz_type=" + quiz_type + ", content=" + content + ", explanation="
				+ explanation + ", answer=" + answer + ", reg_dt=" + reg_dt + ", try_cnt=" + try_cnt
				+ ", correct_ratio=" + correct_ratio + ", view_cnt=" + view_cnt + ", quiz_img=" + quiz_img
				+ ", correct_cnt=" + correct_cnt + ", nick_nm=" + nick_nm + ", subject_nm=" + subject_nm + "]";
	}

}
