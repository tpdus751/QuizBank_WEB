package kr.ac.kopo.subject.vo;

public class SubjectVO {
	
	private int subject_no;
	private String subject_nm;
	private String reg_dt;
	private int try_cnt;
	private int mean_score;
	private int total_quiz_cnt;
	private String page_nm;
	private String subject_img;
	
	public SubjectVO() {
	}
	
	public SubjectVO(String subject_nm) {
		this.subject_nm = subject_nm;
	}

	public SubjectVO(int subject_no, String subject_nm, String reg_dt, int try_cnt, int mean_score, int total_quiz_cnt, String page_nm, String subject_img) {
		this.subject_no = subject_no;
		this.subject_nm = subject_nm;
		this.reg_dt = reg_dt;
		this.try_cnt = try_cnt;
		this.mean_score = mean_score;
		this.total_quiz_cnt = total_quiz_cnt;
		this.page_nm = page_nm;
	}

	public int getSubject_no() {
		return subject_no;
	}

	public void setSubject_no(int subject_no) {
		this.subject_no = subject_no;
	}

	public String getSubject_nm() {
		return subject_nm;
	}

	public void setSubject_nm(String subject_nm) {
		this.subject_nm = subject_nm;
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

	public int getMean_score() {
		return mean_score;
	}

	public void setMean_score(int mean_score) {
		this.mean_score = mean_score;
	}

	public int getTotal_quiz_cnt() {
		return total_quiz_cnt;
	}

	public void setTotal_quiz_cnt(int total_quiz_cnt) {
		this.total_quiz_cnt = total_quiz_cnt;
	}
	
	public String getPage_nm() {
		return page_nm;
	}

	public void setPage_nm(String page_nm) {
		this.page_nm = page_nm;
	}

	@Override
	public String toString() {
		return "SubjectVO [subject_no=" + subject_no + ", subject_nm=" + subject_nm + ", reg_dt=" + reg_dt
				+ ", try_cnt=" + try_cnt + ", mean_score=" + mean_score + ", total_quiz_cnt=" + total_quiz_cnt
				+ ", page_nm=" + page_nm + "]";
	}

	
}
