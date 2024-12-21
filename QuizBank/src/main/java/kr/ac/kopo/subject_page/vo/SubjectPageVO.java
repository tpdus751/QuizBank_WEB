package kr.ac.kopo.subject_page.vo;

public class SubjectPageVO {
	private int subject_no;
	private int currentPage;
	
	public SubjectPageVO() {
		super();
	}

	public SubjectPageVO(int subject_no, int currentPage) {
		super();
		this.subject_no = subject_no;
		this.currentPage = currentPage;
	}

	public int getSubject_no() {
		return subject_no;
	}

	public void setSubject_no(int subject_no) {
		this.subject_no = subject_no;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "SubjectPageVO [subject_no=" + subject_no + ", currentPage=" + currentPage + "]";
	}

	
	
	
	
	
}
