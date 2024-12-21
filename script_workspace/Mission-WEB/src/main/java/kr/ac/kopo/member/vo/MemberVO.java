package kr.ac.kopo.member.vo;

public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private String type;
	
	
	
	public MemberVO(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public MemberVO(String id, String password, String name, String type) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.type = type;
	}
	
	public MemberVO() {
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", type=" + type + "]";
	}
	
}
