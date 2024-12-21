package kr.ac.kopo.vo;

/*
 * 자바빈즈 클래스
 * 1. 패키지 존재
 * 2. class 접근제한자는 public
 * 3. 기본생성자(디폴트생성자) 존재
 * 4. 모든 멤버변수의 접근제한자는 private
 * 5. 멤벼변수에 setter/getter 메소드
 */
public class UserVO {
	private String name;
	private int age;
	
	public UserVO() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
}






